package com.capstone.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.capstone.dao.CartDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.Song;
import lombok.Data;

@Data
@Service
public class CartService implements CartDAO {
	@Autowired
	SongDAO songDao;
	private List<Song> songs = new ArrayList<>();

	@Override
	public Song addToCart(Song song) {
		songs.add(song);
		return song;
	}

	@Override
	public void deleteItemById(int id) {
		Song song = songDao.findById(id).get();
		songs.remove(song);
	}

	public void removeAll() {
		songs.clear();
	}

}
