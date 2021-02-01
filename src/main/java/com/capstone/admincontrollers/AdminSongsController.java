package com.capstone.admincontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.dao.CustomerDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.Customer;
import com.capstone.model.Song;

@RestController
@SessionAttributes({ "admin", "songs", "users" })
public class AdminSongsController {

	@Autowired
	SongDAO songDao;

	@Autowired
	CustomerDAO custDao;

	@GetMapping("admin/songs")
	public ModelAndView showPage(ModelMap model) {
		List<Song> songs = (List<Song>) songDao.findAll();
		model.put("songs", songs);

		return new ModelAndView("adminsongs");
	}

	@PostMapping("admin/songs")
	public ModelAndView addSong(@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("artist") String artist, @RequestParam("genre") String genre,
			@RequestParam("format") String format, @RequestParam("price") double price,
			@RequestParam("imageUrl") String imageUrl) {
		Song song = new Song();
		song.setImageUrl(imageUrl);
		song.setTitle(title);
		song.setDescription(description);
		song.setArtist(artist);
		song.setGenre(genre);
		song.setFormat(format);
		song.setPrice(price);
		songDao.save(song);
		return new ModelAndView("redirect:/admin/songs");
	}

	@GetMapping("admin/songs/editsong/{id}")
	public ModelAndView showEdit(@PathVariable("id") int id) {
		Song song = songDao.findById(id).get();
		return new ModelAndView("editsong").addObject(song);
	}
	@PostMapping("admin/songs/editsong/{id}")
	public ModelAndView editSong(@PathVariable("id") int id, @RequestParam("title") String title,
			@RequestParam("description") String description, @RequestParam("artist") String artist,
			@RequestParam("genre") String genre, @RequestParam("format") String format,
			@RequestParam("price") double price,@RequestParam("imageUrl") String imageUrl) {

		Song song = songDao.findById(id).get();
		song.setImageUrl(imageUrl);
		song.setTitle(title);
		song.setDescription(description);
		song.setArtist(artist);
		song.setGenre(genre);
		song.setFormat(format);
		song.setPrice(price);
		songDao.save(song);
		return new ModelAndView("redirect:/admin/songs");
	}

	@GetMapping("admin/songs/deletesong/{id}")
	public ModelAndView deleteSong(@PathVariable("id") int id) {
		songDao.deleteById(id);
		return new ModelAndView("redirect:/admin/songs");
	}

	@GetMapping("admin/viewusers")
	public ModelAndView showUsers(ModelMap model) {
		model.put("users", (List<Customer>) custDao.findAll());
		return new ModelAndView("viewusers");
	}
}
