package com.example.demo.service;

import java.util.ArrayList;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.Mycart;
import com.example.demo.bean.User;
import com.example.demo.dao.CarRepository;
import com.example.demo.dao.MycartRepository;
import com.mysql.cj.Session;

import jakarta.servlet.http.HttpSession;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private CarRepository carRepo;

	

	@Override
	public User loginUser(User user) {
		
		Iterable<User> itr=carRepo.findAll();
		Optional<User> op=carRepo.findById(user.getId());
		User u=op.get();
		
		carRepo.save(u);
		itr.forEach(p->{
			String email1=p.getEmail();
			String email2=u.getEmail();
			String password1=p.getPassword();
			String password2=u.getPassword();
			
			System.out.println(email1+" "+email2);
			if(email1.equals(email2)&& password1.equals(password2)) {
				
				System.out.println("Login Successfully");
				
			}else {
				System.out.println("Login Failed");
				
			}
		});	
		
		return carRepo.save(u);
	}

	@Autowired
	MycartRepository mr;
	@Override
	public Mycart addCars(Mycart m) {
		
		return mr.save(m);
	}

	@Override
	public List<Mycart> getCars(int uid) {
		
		List<Mycart> cart=new ArrayList<Mycart>();
		for(Mycart m1:mr.findAll()) {
			if(uid==m1.getUid()) {
				
				cart.add(m1);
			}
		}
		
		return cart;
	}

	@Override
	public boolean delete(int id) {
		
		mr.deleteById(id);
		
		
		return true;
	}

	
	
	
	


	
	
 
	
	
}
