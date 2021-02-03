package com.capstone.admincontrollers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.dao.AdminDAO;


import com.capstone.service.Authentication;

@RestController
@SessionAttributes("admin")
public class LoginController {
	
	@Autowired
	AdminDAO adminDao;
	@Autowired
	Authentication auth;
	
	@GetMapping("admin/login")
	public ModelAndView showloginpage() {
		return new ModelAndView("adminlogin");
	}
	
	@PostMapping("admin/login")
	public ModelAndView verifyLogin(@RequestParam("name") String name,@RequestParam("password") String password,ModelMap model) {
		boolean isValid = auth.authenticate(name, password, adminDao);			
			
			if(isValid) {
				model.put("admin", auth.getAdmin());	
				return new ModelAndView("redirect:/admin/songs");
			}			
		
		return new ModelAndView("adminlogin");
	}		
	
	@GetMapping("/admin/logout")
	public ModelAndView logout(SessionStatus status) {
		auth.logout();
		status.setComplete();
		return new ModelAndView("redirect:/admin/login");
	}

}
