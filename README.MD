# Summary
A web-app for users who travel and wish to share reviews and ratings of places all over the world. This a collaborative project developed with a MAMP stack consisting of Java JPA API, the Spring MVC framework, and MySQL database technologies with CRUD functionality. This web-app implements session control, Object-Relational Mapping (ORM), Form Validation, and has a MySQL database deployed to an Apache Tomcat 8 Server.  The database was created with MySQL Workbench.

We also wrote JUnit tests to ensure proper mapping of the entities before moving from JPA to SpringMVC. We then tested the DAO methods to ensure proper CRUD functionality and session persistence of a user.

|Role & Responsibilities                                          | Team Member        |
|-----------------------------------------------------------------|--------------------|
|Project Team Lead and Overall Design, Login, and floating support| Stephen Chiang     |
|Database Architect and Post functionality                        | Dennis Carrasquillo|
|Project Setup and User/Admin functionality                       | Ehren Williamson   |

This is the first we have attempted to implement login functionality to a web-app. There are more secure methods that could be implemented as skills develop and future iterations allow. The goals, milestones, and separation of roles/responsibilities are illustrated in the structure/flow chart image embedded in the README but can also be found in slideshow format in the root folder. As an added primitive layer of security, the controllers for making changes on user/post data checks the session before displaying the view, otherwise it sends the user back to the login page if it's not in session.

Issues the team ran into:
- Login and logout functionality provided an interesting dimension in querying and validating a user and persisting the account during the entire session. Additionally logging out and ensuring the session was cleared took longer than expected.
- Creating the post also required a lot of work due to multiple tables. If we had more time, we would have made use of DTO(Data Transfer Object) classes to make the flow smoother.

- This is the most complex project we have worked on and we have to update and alter the database a few times, but our deliberate process of planning and initial mapping prevented significant issues or delays despite a few updates.

If more time were available:
    - Optimized form validation logic for creating new place.
    - Adding tags and filtering posts by tags.
    - Adding search by review contains keywords.
    - User ability to comment on other user posts.
    - Tagging posts as a favorite.
    - A direct messaging function.

<p align="center">
<img src="readmeimages/scrn1.png" height="245">
<img src="readmeimages/scrn2.png" height="245"></p>
<p align="center">
<img src="readmeimages/scrn3.png" height="245">
<img src="readmeimages/scrn4.png" height="245"></p>
<p align="center">
<img src="readmeimages/scrn5.png" height="245">
<img src="readmeimages/scrn6.png" height="245"></p>
<p align="center">
<img src="readmeimages/scrn7.png" height="245">
<img src="readmeimages/scrn8.png" height="245"></p>
<p align="center"><img src="readmeimages/scrn9.png" height="245"></p>

## In This Document
1. [How to Execute](#how-to-execute)
2. [Class Structure Overview](#class-structure-overview)

## How to Execute
- The web-app is hosted on my AWS server: <a href="http://www.chiangs.ninja:8080/TripLight/">**here**</a>
- Download the entire program as a .war file <a href="https://github.com/chiangs/TripLight/blob/master/TripLightMVC.war">**here**</a>

## Instructions
1. User arrives on landing page
2. User menu:
    - Login / Create Account
    - User Profile Actions (Add/Edit/Delete)
    - Post / Search reviews (Add/Edit/Delete)

## Project Flow & Structure Overview

<p align="center">
<img src="chart1.png" height="245">
<img src="chart2.png" height="245">
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
- JavaScript
