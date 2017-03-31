package com.tl.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Place {
	@Override
	public String toString() {
		return "Place [id=" + id + ", name=" + name + ", userID=" + userID + ", url=" + url + ", CountryCode="
				+ CountryCode + "]";
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private int userID;
	
	@ManyToOne
	@JoinColumn(name="cityID")
	private City city;
	@ManyToOne
	@JoinColumn(name="CountryCode")
	private Country country;

	@OneToMany(mappedBy="place")
	private List<Post> posts;
	private String url;
	private String CountryCode;
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
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCountryCode() {
		return CountryCode;
	}
	public void setCountryCode(String countryCode) {
		CountryCode = countryCode;
	}
}
