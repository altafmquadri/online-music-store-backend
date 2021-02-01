package com.capstone.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.capstone.model.Song;

public interface SongDAO extends CrudRepository<Song, Integer> {

	@Query("SELECT s FROM Song s WHERE " + "CONCAT(s.id, s.title, s.description, s.artist, s.genre, s.format)"
			+ " LIKE %?1%")
	public List<Song> findAll(String keyword);

}
