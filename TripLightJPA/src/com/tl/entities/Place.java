package com.tl.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

@Entity
public class Place {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=10, max=45, message="Minium 10 characters and max of 45")
	private String name;
	
	@ManyToOne
	@JoinColumn(name="country_countryCode")
	private Country country;
	
	private String url;
	
	@ManyToOne
	@JoinColumn(name="city_id")
	private City city;

	@Override
	public String toString() {
		return "Place [id=" + id + ", name=" + name + ", countryName=" + country.getName() + ", url=" + url + "]";
	}

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getId() {
		return id;
	}
}
