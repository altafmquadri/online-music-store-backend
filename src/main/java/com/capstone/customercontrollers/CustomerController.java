package com.capstone.customercontrollers;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.dao.CustomerDAO;
import com.capstone.dao.OrderDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.Customer;
import com.capstone.model.Item;
import com.capstone.model.MailingAddress;
import com.capstone.model.Order;
import com.capstone.model.Song;
import com.capstone.service.CartService;

@RestController
@SessionAttributes({"customer", "songs", "cart", "order","orders"})
@Transactional
public class CustomerController {

	@Autowired
	SongDAO songDao;
	
	@Autowired
	CartService cs;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	CustomerDAO custDao;

	@GetMapping("/songs")	
	public ModelAndView showSongs(ModelMap model,@Param("keyword") String keyword) {
		if(keyword==null) {
			List<Song> songs = (List<Song>) songDao.findAll();
			model.put("songs", songs);
			return new ModelAndView("songs").addObject("songs", songs);			
		}
		
		List<Song> songs = songDao.findAll(keyword);
		model.put("songs", songs);
		return new ModelAndView("songs").addObject("songs", songs);			
	}
	
	@GetMapping("/addtocart/{id}")
	public ModelAndView addToCart(@PathVariable("id") int id, ModelMap model) {
		Song song = songDao.findById(id).get();
		System.out.println(song);
		cs.addToCart(song);
		model.put("cart", cs.getSongs());
		return new ModelAndView("/songs");
	}
	
	@GetMapping("/cart")
	public ModelAndView showCart() {
		List<Song> songs = cs.getSongs();		
		return new ModelAndView("cart").addObject("cart", songs);
	}
	
	@GetMapping("/removeitem/{id}")
	public ModelAndView removeItem(@PathVariable("id") int id) {
		cs.deleteItemById(id);
		return new ModelAndView("redirect:/cart");		
	}
	
	@GetMapping("/clearcart")
	public ModelAndView clearCart() {
		cs.removeAll();
		return new ModelAndView("redirect:/songs");
	}	
	
	@GetMapping("/checkout")
	public ModelAndView showCheckout() {
		double total=cs.getSongs().stream()
				.map(s->s.getPrice())
				.reduce(0.0 , (sum,price)->sum+price);		
		return new ModelAndView("checkout").addObject("total",total);
	}
	
	@GetMapping("/mailing")
	public ModelAndView showMailingAddress() {
		return new ModelAndView("mailing");
	}
	
	@PostMapping("/mailing")
	public ModelAndView saveMailingAddress(@RequestParam("street") String street,
			@RequestParam("city") String city,
			@RequestParam("state") String state,
			@RequestParam("zip") int zip,
			ModelMap model) {
		Customer c=(Customer) model.get("customer");
		MailingAddress ma=new MailingAddress();
		ma.setStreet(street);
		ma.setCity(city);
		ma.setState(state);
		ma.setZip(zip);
		Order o=new Order();
		
		o.setStatus("ordered");
		o.setDate(new Date());
		c.getOrders().add(o);		
		o.setCustomer(c);
		o.setMailingAddress(ma);

		for(Song s: cs.getSongs()) {
			Item i=new Item();
			i.setArtist(s.getArtist());
			i.setDescription(s.getDescription());
			i.setFormat(s.getFormat());
			i.setGenre(s.getGenre());
			i.setImageUrl(s.getImageUrl());
			i.setTitle(s.getTitle());
			i.setPrice(s.getPrice());
			i.setOrder(o);
			o.getItems().add(i);
		}
		Order order = orderDao.save(o);
		model.put("order", order);
		cs.removeAll();
		double total= order.getItems().stream()
				.map(i->i.getPrice())
				.reduce(0.0 , (sum,price)->sum+price);	
		
		
		return new ModelAndView("success").addObject("total", total).addObject("orderid",order.getId()).addObject("address", order.getMailingAddress());		
	}
	
	@GetMapping("/success")
	public ModelAndView showSuccess(){
		return new ModelAndView("success");
	}
	
	@GetMapping("/pastorders")
	public ModelAndView showOrders(ModelMap model) {
		Customer c=(Customer) model.get("customer");
		List<Order> orders = orderDao.findAllOrdersByCustomerId(c.getId());
		model.put("orders", orders);		
		return new ModelAndView("pastorders");
	}
	
}




