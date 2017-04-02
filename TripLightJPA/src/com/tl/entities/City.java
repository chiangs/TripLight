package com.tl.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

@Entity
public class City {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=2, max=45, message="Please enter a real city!")
	private String name;
	
	@Size(min=2, max=2, message="Please use teh correct Country Code letters")
	@ManyToOne
	@JoinColumn(name="country_countryCode")
	private Country country;
	
//	@OneToMany (mappedBy="") does this need a placeID in the city table?
//	private List<Place> places;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "City [id=" + id + ", name=" + name + "]";
	}
	
	
	
}
