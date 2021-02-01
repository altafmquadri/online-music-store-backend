package com.capstone.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.capstone.model.Admin;

public interface AdminDAO extends CrudRepository<Admin, Integer>{
	
	 public Optional<Admin> findOneByUsernameAndPassword(String username, String password);
}
