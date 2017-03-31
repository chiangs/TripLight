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
public class City {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String name;
@OneToMany(mappedBy="city")
private List<Place> places;
@ManyToOne
@JoinColumn(name="countryCode")
private Country country;

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
//public String getCountryCode() {
//	return countryCode;
//}
//public void setCountryCode(String countryCode) {
//	this.countryCode = countryCode;
//}
@Override
public String toString() {
	return "City [id=" + id + ", name=" + name  + "]";
}
}
