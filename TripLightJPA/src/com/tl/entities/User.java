package com.tl.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=1, message="We need to know what to call you!")
	private String firstName;
	
	@Size(min=1, message="What clan or house do you belong to?")
	private String lastName;
	
	@Size(min=1, message="A username is necessary")
	@Pattern(regexp="^[a-zA-Z0-9]{4,10}$", message="No special characters please")
	private String username;
	
	@Size(min=1, max=20, message="Password must be min 1 and up to 20 characters long")
	private String password;
	
	@OneToOne
	@JoinColumn(name="country_countryCode")
	private Country country;
	
	@OneToMany(mappedBy="user")
	private List<Post> posts;
	
	private int adminFlag;
	
	@Pattern(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="Full email address please admin@triplight.com")
	private String email;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public int getAdminFlag() {
		return adminFlag;
	}

	public void setAdminFlag(int adminFlag) {
		this.adminFlag = adminFlag;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

//	@Override
//	public String toString() {
//		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
//				+ ", currentLocation=" + country.getName() + ", posts=" + posts + ", adminFlag=" + adminFlag
//				+ ", email=" + email + "]";
//	}
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", username=" + username
				+ ", currentLocation=" + country.getName() + ", adminFlag=" + adminFlag
				+ ", email=" + email + "]";
	}

}
