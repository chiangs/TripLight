package com.tl.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Country {
@Id
private String countryCode;
private String name;
}
