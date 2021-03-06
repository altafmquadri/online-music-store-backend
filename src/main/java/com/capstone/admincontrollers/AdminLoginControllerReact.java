package com.capstone.admincontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.capstone.config.JwtTokenUtil;
import com.capstone.dao.AdminDAO;
import com.capstone.dao.SongDAO;
import com.capstone.model.HelloWorld;
import com.capstone.model.JwtRequest;
import com.capstone.model.JwtResponse;
import com.capstone.model.Song;
import com.capstone.service.JwtUserDetailsService;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class AdminLoginControllerReact {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Autowired
	private JwtUserDetailsService userDetailsService;

	@Autowired
	AdminDAO adminDao;

	@Autowired
	SongDAO songDao;

	// test mapping
	@RequestMapping(path = "/hello-world")
	public HelloWorld helloWorld() {
		return new HelloWorld("Spring Boot is Brilliant!!");
	}

	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
		authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
		final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
		final String token = jwtTokenUtil.generateToken(userDetails);
		return ResponseEntity.ok(new JwtResponse(token));
	}

	private void authenticate(String username, String password) throws Exception {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}

	@GetMapping("/admin/songs")
	public List<Song> getSongs() {
		return (List<Song>) songDao.findAll();
	}

	@GetMapping("admin/edit/songs/{id}")
	public Song getSong(@PathVariable("id") int id) {
		return songDao.findById(id).get();
	}

	@PostMapping("admin/edit/songs/{id}")
	public Song editSong(@PathVariable("id") int id, @RequestBody Song s) {
		Song song = songDao.findById(id).get();
		song.setImageUrl(s.getImageUrl());
		song.setTitle(s.getTitle());
		song.setDescription(s.getDescription());
		song.setArtist(s.getArtist());
		song.setGenre(s.getGenre());
		song.setFormat(s.getFormat());
		song.setPrice(s.getPrice());
		return songDao.save(song);
	}

	@PostMapping("admin/addsong")
	public Song addSong(@RequestBody Song s) {
		Song song = new Song();
		song.setImageUrl(s.getImageUrl());
		song.setTitle(s.getTitle());
		song.setDescription(s.getDescription());
		song.setArtist(s.getArtist());
		song.setGenre(s.getGenre());
		song.setFormat(s.getFormat());
		song.setPrice(s.getPrice());
		return songDao.save(song);
	}

	@DeleteMapping("admin/deletesong/{id}")
	public Song deleteSong(@PathVariable("id") int id) {
		Song song = songDao.findById(id).get();
		songDao.delete(song);
		return song;
	}
}
