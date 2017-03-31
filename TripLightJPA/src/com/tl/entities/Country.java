package com.tl.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Country {
	@Id
	private String countryCode;
	private String name;
	@OneToMany(mappedBy="city")
	private List<City> cities;
	@OneToMany(mappedBy="country")
	private List<Place> places;
    @OneToOne(mappedBy="country")
    private User user;
	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Country [countryCode=" + countryCode + ", name=" + name + "]";
	}
}
