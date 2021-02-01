package com.capstone.dao;

import com.capstone.model.Song;

public interface CartDAO {
	
	public Song addToCart(Song song);
	
	public void deleteItemById(int id);
}
