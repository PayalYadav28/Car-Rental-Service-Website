package com.example.demo.controller;


import java.io.IOException;





import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.InvalidDataAccessResourceUsageException;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.bean.Cars;
import com.example.demo.bean.Contact;
import com.example.demo.bean.Email;
import com.example.demo.bean.Mycart;
import com.example.demo.bean.Reservation;
import com.example.demo.bean.Reviews;
import com.example.demo.bean.User;
import com.example.demo.dao.CarRepository;
import com.example.demo.dao.CarsShowRepostitory;
import com.example.demo.dao.ContactRepository;
import com.example.demo.dao.MycartRepository;
import com.example.demo.dao.ReservationRepository;
import com.example.demo.dao.ReviewRepository;
import com.example.demo.service.UserService;
import com.mysql.cj.Session;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CarController {

//	@RequestMapping("/index")
//	public String index() {
//		
//		return "index";
//		
//	}
	@Autowired
	private UserService userService;

	@RequestMapping("/register")
	public String register() {
		
		return "register";
		
	}
	
	@Autowired
	
	CarRepository cr1;
	@PostMapping("/createUser")
	public String createUser(@ModelAttribute User user,HttpSession session) {
		
		//System.out.println(user);
		
		
		try {
			User u=cr1.save(user);
		if(u!=null) {
			
			System.out.println("insert");
			session.setAttribute("reg-success","Registration Successfully");
			return "login";
		}
		}catch(DataIntegrityViolationException e){
			System.out.println("wrong!");
			session.setAttribute("failed-msg","Email Id already exists!!");
			return "register";
		}
		
		
		return "redirect:/register"; 
		
	}
	
	@PostMapping("/loginUser")
	public String loginData(@ModelAttribute User user,HttpSession session) {
		
		Iterable<User> itr=cr1.findAll();
		ModelAndView mv=new ModelAndView();
		int count=0;
		for(User u:itr) {
			if(u.getEmail().equals(user.getEmail())&&u.getPassword().equals(user.getPassword())) {
				Optional<User> op=cr1.findById(u.getId());
				User u1=op.get();
				session.setAttribute("user", u);
				return "redirect:index";
			
			}
			else {
				count++;
			}
		}
		if(count>0) {
			System.out.println("failed");
			session.setAttribute("login-failed","Invalid Username Or Password");
			return "login";
		}
		
		
		
		
		
		return "login";
		
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
		
	}
	@RequestMapping("/about")
	public String about() {
		
		return "about";
		
	}
	
	@RequestMapping("/blog")
	public String blog() {
		
		return "blog";
		
	}
	
	@RequestMapping("/contact")
	public String contact() {
		
		
		return "contact";
		
	}
	@RequestMapping("/listing")
	public String listing(HttpServletRequest request,HttpServletResponse response) {
		List<Cars> cars=new ArrayList<>();
		for(Cars car:rp.findAll()) {
			System.out.println(car);
			cars.add(car); 
		}
		HttpSession session=request.getSession();
		session.setAttribute("cars",cars);
		return "listing";
		
	}

	
	@RequestMapping("/testimonials")
	public String testimonials() {
		
		return "testimonials";
		
	}
	@Autowired
	MycartRepository mr1;
	@RequestMapping("/cart")
	public String rent(HttpServletRequest request,HttpServletResponse response) {
		
		List<Mycart> cart=new ArrayList<>();
		for(Mycart m:mr1.findAll()) {
			
			cart.add(m); 
		}
		HttpSession session=request.getSession();
		session.setAttribute("cart",cart);
		return "cart";
		
	}
	
	@Autowired
	CarRepository cr;
	
//	@RequestMapping("/registerData")
//	public String registerData(User u) {
//		
//		cr.save(u);
//		return "login";
//		
//	}
//	@RequestMapping("/loginUser")
//	public ModelAndView loginUser(User u,HttpServletRequest request) {
//		
//		Iterable<User> itr=cr.findAll();
//		Optional<User> op=cr.findById(u.getEmail());
//		User user=op.get();
//		
//		cr.save(user);
//		itr.forEach(p->{
//			String email1=p.getEmail();
//			String email2=u.getEmail();
//			String password1=p.getPassword();
//			String password2=u.getPassword();
//			
//			System.out.println(email1+" "+email2);
//			if(email1.equals(email2)&& password1.equals(password2)) {
//				
//				System.out.println("Login Successfully");
//				
//			}else {
//				System.out.println("Login Failed");
//				
//			}
//		});	
//		
//		request.setAttribute("user",user);
//		ModelAndView mv = new ModelAndView("index");
//		mv.addObject("user", user);
//		
//		
//		return mv;
//			
//	}
	
	@Autowired
	ContactRepository cor;
	
	@RequestMapping("/contactUs")
	public String contactUs(Contact c) {
		
		cor.save(c);
		return "index";
		
	}
	
	@Autowired
	CarsShowRepostitory rp;
	
	@Autowired
	ReviewRepository rer;
	
	@RequestMapping("/index")
	public List<Cars> getCars(HttpServletRequest request,HttpServletResponse response) {
		
		List<Cars> cars=new ArrayList<>();
		List<Reviews> reviews=new  ArrayList<>();
		
		
		for(Cars car:rp.findAll()) {
			cars.add(car); 
		}
		
		for(Reviews r:rer.findAll()) {
			
			reviews.add(r); 
		}
		
		
		HttpSession session=request.getSession();
		session.setAttribute("cars",cars);
		HttpSession session1=request.getSession();
		session1.setAttribute("reviews",reviews);
		
		return cars;
		 
	}
	
	@Autowired
	MycartRepository mr;
	@RequestMapping("/addtocart")
	public String addCars(Mycart my,HttpServletRequest request,HttpServletResponse response) {
		
		
		Mycart m=userService.addCars(my);
		
		
		List<Mycart> cart=userService.getCars(m.getUid());
		
		
		HttpSession session=request.getSession();
		session.setAttribute("cart",cart);
		
		
		return "cart";
		
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		
		return "index";
	}
	
	
	@RequestMapping("/delete")
	public String delete(Mycart m,HttpServletRequest request,HttpServletResponse response) {
		
		boolean b=userService.delete(m.getId());
		
		List<Mycart> cart=new ArrayList<>();
		Iterable<Mycart> itr=mr.findAll();

		for(Mycart my:itr) {
				cart.add(my); 
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("cart",cart);
		
		return "cart";
		
	}
	
	
	
	
	
	
	
	@RequestMapping("/new")
	public String form(){
		List<Mycart> m=new ArrayList<>();
		
		
		return "form";
		
	}
	
	@Autowired
	
	ReservationRepository resrepo;
	@RequestMapping("/reserve")
	public String checkout(Reservation re,HttpSession session) throws InterruptedException {
		System.out.println(re.getName());
		resrepo.save(re);
		mr.deleteById(re.getId());
		List<Mycart> cart=new ArrayList<>();
		Iterable<Mycart> itr=mr.findAll();

		for(Mycart my:itr) {
				cart.add(my); 
		}
		
		
		session.setAttribute("cart",cart);
		session.setAttribute("final",re);
		
		return "checkout";
		
	}
	
	
	
	@RequestMapping("/reservation")
	public String reservation(Mycart re,HttpSession session) {
		

		session.setAttribute("image",re.getImage());
		session.setAttribute("id",re.getId());
		session.setAttribute("name",re.getName());
		session.setAttribute("price",re.getPrice());
		return "reservation";
				
	}
	
	
	@RequestMapping("/newcart")
	public String newcart() {
		return "newcart";
		
	}
	
	@Autowired
	
	private JavaMailSender javaMailSender;
	
	
	@RequestMapping("/sendemail")
	public String sendEmail(Email em,HttpSession session) throws MessagingException {
		

		
				 try {
					  MimeMessage messege=javaMailSender.createMimeMessage();
					  MimeMessageHelper helper=new MimeMessageHelper(messege);
					  helper.setFrom("padmarekhaj18@gmail.com");
					  helper.setTo(em.getEmail());
					  helper.setSubject("Your Car Booking Confirmed!");
					  helper.setText("Dear [Customer],\r\n"
					  		+ "\r\n"
					  		+ "Exciting news! Your car booking has been successfully confirmed. We're thrilled to have you on board. Get ready for a fantastic journey ahead! If you have any queries, feel free to reach out.\r\n"
					  		+ "\r\n"
					  		+ "Best regards,\r\n"
					  		+ "[Your Company Name]");
					 
					  System.out.println("email");
					  javaMailSender.send(messege);
					  
				  }catch(MailSendException e) {
					  System.out.println(e);
					  System.out.println("hi");
					  e.printStackTrace();
					  
				  }
				 
				 session.setAttribute("msg", "send");
				return "checkout";
			}
		 
		
		
	}
	
	
	

	
	
	
	
	
	
	