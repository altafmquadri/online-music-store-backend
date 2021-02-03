package com.capstone.admincontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.dao.AdminDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.Admin;
import com.capstone.model.HelloWorld;
import com.capstone.model.Song;


@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
public class AdminLoginControllerReact {

	@Autowired
	AdminDAO adminDao;
//	@Autowired
//	Authentication auth;
	@Autowired
	SongDAO songDao;

	// test mapping
	@RequestMapping(path = "/hello-world")
	public HelloWorld helloWorld() {
		return new HelloWorld("Spring Boot is Brilliant!!");
	}

	@PostMapping(path = "admin/login", consumes = "application/json")
	public boolean verifyLogin(@RequestBody Admin admin) {
//		boolean isValid = auth.authenticate(admin.getUsername(), admin.getPassword(), adminDao);
//		return isValid;
		return false;
	}

	@GetMapping("/admin/songs")
	public List<Song> getSongs() {
		return (List<Song>) songDao.findAll();
	}

	@GetMapping("admin/edit/songs/{id}")
	public Song getSong(@PathVariable("id") int id) {
		return songDao.findById(id).get();
	}

	@PostMapping("admin/edit/songs/{id}")
	public Song editSong(@PathVariable("id") int id, @RequestBody Song s ){
		Song song = songDao.findById(id).get();
		song.setImageUrl(s.getImageUrl());
		song.setTitle(s.getTitle());
		song.setDescription(s.getDescription());
		song.setArtist(s.getArtist());
		song.setGenre(s.getGenre());
		song.setFormat(s.getFormat());
		song.setPrice(s.getPrice());
		return songDao.save(song);
	}
	
	@PostMapping("admin/addsong")
	public Song addSong(@RequestBody Song s){
		Song song = new Song();
		song.setImageUrl(s.getImageUrl());
		song.setTitle(s.getTitle());
		song.setDescription(s.getDescription());
		song.setArtist(s.getArtist());
		song.setGenre(s.getGenre());
		song.setFormat(s.getFormat());
		song.setPrice(s.getPrice());
		return songDao.save(song);
	}
	
	@DeleteMapping("admin/deletesong/{id}")
	public Song deleteSong(@PathVariable("id") int id) {
		Song song =  songDao.findById(id).get();
		songDao.delete(song);
		return song;
		
	}
}
