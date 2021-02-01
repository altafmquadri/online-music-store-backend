package com.capstone.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capstone.dao.AdminDAO;
import com.capstone.dao.CustomerDAO;
import com.capstone.model.Admin;
import com.capstone.model.Customer;

import lombok.Data;

@Data
@Service
public class Authentication {

	@Autowired
	AdminDAO adminDao;
	@Autowired
	CustomerDAO customerDao;

	private Admin admin = null;
	private Customer customer = null;

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

	public boolean authenticate(String userName, String password, CustomerDAO dao) {		
		if (!(dao instanceof CustomerDAO))
			return false;
		Customer customer = customerDao.findOneByUsernameAndPassword(userName, password).orElse(null);
		if (customer != null) {
			setCustomer(customer);			
			return true;
		}
		return false;
	}

	public void logout() {
		setCustomer(null);
		setAdmin(null);
	}
}
