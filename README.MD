# Summary - Under Construction
A web-app for users who travel and wish to share reviews and ratings of places all over the world. This a collaborative project developed with a MAMP stack consisting of Java JPA API, the Spring MVC framework, and MySQL database technologies with CRUD functionality. This web-app implements session control, Object-Relational Mapping (ORM), Form Validation, and has a MySQL database deployed to an Apache Tomcat 8 Server.  The database was created with MySQL Workbench.

|Role & Responsibilities                                       | Team Member        |
|--------------------------------------------------------------|--------------------|
|Project Team Lead and Overall Design and Login functionality: | Stephen Chiang     |
|Database Architect and Post functionality                     | Dennis Carrasquillo|
|Project Setup and User functionality| Ehren Williamson        |                    |

This is the first we have attempted to implement login functionality to a web-app. There are more secure methods that could be implemented as skills develop and future iterations allow. The goals, milestones, and separation of roles/responsibilities are illustrated in the structure/flow chart image embedded in the README but can also be found in slideshow format in the root folder.

Issues the team ran into:
- Login and logout functionality provided an interesting dimension in querying and validating a user and persisting the account during the entire session. Additionally logging out and ensuring the session was cleared took longer than expected.

- This is the most complex project we have worked on and we have to update and alter the database a few times, but our deliberate process of planning and initial mapping prevented significant issues or delays despite a few updates.

If more time were available:
    -

<p align="center">
<img src="scrn1.png" height="245">
<img src="#" height="245"></p>
<p align="center">
<img src="#" height="245">
<img src="#" height="245"></p>
<p align="center"><img src="#" height="245"></p>

## In This Document
1. [How to Execute](#how-to-execute)
2. [Class Structure Overview](#class-structure-overview)

## How to Execute
- The web-app is hosted on my AWS server: <a href="http://www.chiangs.ninja:8080/TripLight/">**here**</a>
- Download the entire program as a .war file <a href="TripLight.war">**here**</a>

## Instructions
1. User arrives on landing page
2. User menu:
    - Login / Create Account
    - User Profile Actions (Add/Edit/Delete)
    - Post / Search reviews (Add/Edit/Delete)

## Class Structure Overview

<p align="center">
<img src="#" height="350">
</p>

## Code Examples
Here's a snippit of the controller logic for login/logout. It first checks if the username/password entered are valid entries in the database and returns different views depending on the validation.
```Java
@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView executeLogin(@Valid Error errors, Model model, User user) {
		ModelAndView mv = new ModelAndView();
		try {
			User isValidUser = loginDelegate.isValidUser(user.getUsername(), user.getPassword());
			if (isValidUser != null) {
				System.out.println("User Login Successful");
				model.addAttribute("sessionUser", isValidUser);
				mv.addObject("loggedInUser",  isValidUser);
				mv.setViewName("userMain");
			}
			else {
				mv.addObject("loggedInUser", user);
				mv.addObject("message", "No such username/password");
				mv.setViewName("index");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public ModelAndView executeLogout(HttpSession session, SessionStatus status) {
	ModelAndView mv = new ModelAndView();
	session.setAttribute("sessionUser", new User());
	status.setComplete();
	mv.setViewName("index");
	return mv;
	}
```

## Technologies Used
- Java JPA API
- Spring MVC and Spring STS
- Gradle Managed Dependencies
- MySQL and MySQL Workbench
- Java Server Pages and JSTL/EL
- HTML
- CSS and Bootstrap
- JavaScript / JQuery
