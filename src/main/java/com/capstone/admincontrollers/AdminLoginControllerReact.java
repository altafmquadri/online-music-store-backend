package com.capstone.admincontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.dao.AdminDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.Admin;
import com.capstone.model.HelloWorld;
import com.capstone.model.Song;
import com.capstone.service.Authentication;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
public class AdminLoginControllerReact {
	
	@Autowired
	AdminDAO adminDao;
	@Autowired
	Authentication auth;
	@Autowired
	SongDAO songDao;
	
	//test mapping
	@RequestMapping( path="/hello-world") 
	public HelloWorld helloWorld() {
		return new HelloWorld("Spring Boot is Brilliant!!");
	}
	
	@PostMapping(path="admin/login", consumes = "application/json")
		public boolean verifyLogin(@RequestBody Admin admin) {
		boolean isValid = auth.authenticate(admin.getUsername(), admin.getPassword(), adminDao);					
		return isValid;
	}
	
	@GetMapping("/admin/songs")
	public List<Song> getSongs(){
		return (List<Song>) songDao.findAll();
	}

}
