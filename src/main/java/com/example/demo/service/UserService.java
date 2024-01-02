package com.example.demo.service;

import java.util.List;


import com.example.demo.bean.Mycart;
import com.example.demo.bean.User;

import jakarta.servlet.http.HttpSession;

public interface UserService {
	
	
	
	
	public User loginUser(User user);
	
	
	public Mycart addCars(Mycart m);
	
	public List<Mycart> getCars(int uid);
	
	public boolean delete(int id);
	
	
	

}
