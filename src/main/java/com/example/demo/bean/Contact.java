package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
@Entity
public class Contact {

	private String fname;
	private String lname;
	@Id
	private String email;
	private String msg;
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}

