package com.tl.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Country {
	
	@Id
	private String countryCode;
	
	@OneToMany(mappedBy="country")
	private List<Place> places;
	
	private String name;

	public List<Place> getPlaces() {
		return places;
	}

	public void setPlaces(List<Place> places) {
		this.places = places;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountryCode() {
		return countryCode;
	}

	@Override
	public String toString() {
		return "Country [countryCode=" + countryCode + ", name=" + name + "]";
	}
	
	
	
	
}
