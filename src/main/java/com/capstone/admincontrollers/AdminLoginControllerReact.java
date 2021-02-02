package com.capstone.admincontrollers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.dao.AdminDAO;
import com.capstone.model.Admin;
import com.capstone.model.HelloWorld;
import com.capstone.service.Authentication;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api")
public class AdminLoginControllerReact {
	
	@Autowired
	AdminDAO adminDao;
	@Autowired
	Authentication auth;
	
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

}
