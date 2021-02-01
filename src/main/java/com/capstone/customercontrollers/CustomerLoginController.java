package com.capstone.customercontrollers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.capstone.dao.CustomerDAO;
import com.capstone.exceptions.IncorrectLoginException;
import com.capstone.exceptions.PasswordConfirmationException;
import com.capstone.exceptions.UniqueException;
import com.capstone.model.Customer;
import com.capstone.service.Authentication;
import com.capstone.service.CartService;

@RestController
@SessionAttributes({"customer", "songs", "cart"})
public class CustomerLoginController {

	@Autowired
	CustomerDAO custDao;
	
	@Autowired
	Authentication auth;
	
	@Autowired
	CartService cs;

	@GetMapping("/register")
	public ModelAndView showRegistration() {
		return new ModelAndView("registration");
	}

	@PostMapping("/register")
	public ModelAndView doRegistration(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("confirm") String confirm, @RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email, @RequestParam("address") String address) {

		String message = null;
		try {

			Customer c = custDao.findOneByUsername(name).orElse(null);
			Customer e = custDao.findOneByEmail(email).orElse(null);
			System.out.println(c);
			if (password.equals(confirm) && (c == null) && (e == null)) {
				Customer customer = new Customer();
				customer.setUsername(name);
				customer.setPassword(password);
				customer.setPhoneNumber(phoneNumber);
				customer.setEmail(email);
				customer.setAddress(address);
				custDao.save(customer);
				message = "You have registered successfully";
				return new ModelAndView("registration").addObject("message", message);
			} else if ((c != null) || (e != null)) {
				throw new UniqueException("Username Or Email Already Taken");

			} else {
				throw new PasswordConfirmationException("Password And Confirmation Do Not Match");
			}

		} catch (PasswordConfirmationException | UniqueException e) {
			message = e.getMessage();
		}

		return new ModelAndView("registration").addObject("message", message);
	}

	@GetMapping("/login")
	public ModelAndView showLogin(){
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam("name") String name,@RequestParam("password") String password, ModelMap model ){		
		String message = null;
		boolean isValid = auth.authenticate(name, password, custDao);			
		try {			
			if(isValid) {
				model.put("customer", auth.getCustomer());	
				return new ModelAndView("redirect:/songs");
			}else  {
				throw new IncorrectLoginException("The credentials are incorrect");
			}
		}catch (IncorrectLoginException e) {			
			message = e.getMessage();			
		}
		return new ModelAndView("login").addObject("message", message);		
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(SessionStatus status) {
		auth.logout();
		cs.removeAll();
		status.setComplete();
		return new ModelAndView("redirect:/login");
	}
	
}
