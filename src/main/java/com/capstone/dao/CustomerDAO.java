package com.capstone.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.capstone.model.Customer;

public interface CustomerDAO extends CrudRepository<Customer, Integer>{
	
	 public Optional<Customer>findOneByUsernameAndPassword(String username, String password);
	 public Optional<Customer>findOneByUsername(String username);
	 public Optional<Customer>findOneByEmail(String email);
}
