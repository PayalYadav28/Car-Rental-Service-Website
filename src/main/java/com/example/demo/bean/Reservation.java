package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
@Entity
public class Reservation {
   
	@Id
	private int id;
	private String name;
	private String price;
	private String image;
	private String pick_up_location;
	private String drop_off_location;
	private String pick_up_date;
	private String drop_off_date;
	private String picktime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPick_up_location() {
		return pick_up_location;
	}
	public void setPick_up_location(String pick_up_location) {
		this.pick_up_location = pick_up_location;
	}
	public String getDrop_off_location() {
		return drop_off_location;
	}
	public void setDrop_off_location(String drop_off_location) {
		this.drop_off_location = drop_off_location;
	}
	public String getPick_up_date() {
		return pick_up_date;
	}
	public void setPick_up_date(String pick_up_date) {
		this.pick_up_date = pick_up_date;
	}
	public String getDrop_off_date() {
		return drop_off_date;
	}
	public void setDrop_off_date(String drop_off_date) {
		this.drop_off_date = drop_off_date;
	}
	public String getPicktime() {
		return picktime;
	}
	public void setPicktime(String picktime) {
		this.picktime = picktime;
	}
}
