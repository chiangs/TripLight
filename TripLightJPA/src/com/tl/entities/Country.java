package com.tl.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Country {
@Id
private String countryCode;
private String name;
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
