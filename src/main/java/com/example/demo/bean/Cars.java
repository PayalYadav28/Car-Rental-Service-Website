package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Cars {

	@Id
	private int id;
	private String image;
	private String name;
	private String price;
	private String luggage;
	private String doors;
	private String passengers;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
	public String getLuggage() {
		return luggage;
	}
	public void setLuggage(String luggage) {
		this.luggage = luggage;
	}
	public String getDoors() {
		return doors;
	}
	public Cars() {
		
	}
	public Cars(int id, String image, String name, String price, String luggage, String doors, String passengers,
			String description) {
		super();
		this.id = id;
		this.image = image;
		this.name = name;
		this.price = price;
		this.luggage = luggage;
		this.doors = doors;
		this.passengers = passengers;
		this.description = description;
	}
	public void setDoors(String doors) {
		this.doors = doors;
	}
	public String getPassengers() {
		return passengers;
	}
	public void setPassengers(String passengers) {
		this.passengers = passengers;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
