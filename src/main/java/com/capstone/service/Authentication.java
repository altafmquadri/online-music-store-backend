package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.AdminDAO;
import com.capstone.model.Admin;

import lombok.Data;

@Data
@Service
public class Authentication {

	@Autowired
	AdminDAO adminDao;


	private Admin admin = null;


	public boolean authenticate(String userName, String password, AdminDAO dao) {
		if (!(dao instanceof AdminDAO))
			return false;
		Admin admin = adminDao.findOneByUsernameAndPassword(userName, password).orElse(null);
		if (admin != null) {
			setAdmin(admin);
			return true;
		}
		return false;
	}


	public void logout() {
		setAdmin(null);
	}
}
