package com.capstone.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.capstone.model.Order;

public interface OrderDAO extends CrudRepository<Order, Integer> {
	public List<Order>findAllOrdersByCustomerId(int id);
}
