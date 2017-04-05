package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.Country;
import com.tl.entities.User;

import data.UserDAO;

@Controller
@SessionAttributes("sessionUser")
public class UserController {

	@Autowired
	private UserDAO userdao;

	@ModelAttribute("sessionUser")
	public User user() {
		return new User();
	}
	
	@RequestMapping(value = "userMain.do", method = RequestMethod.GET)
	public ModelAndView returnToMain(@ModelAttribute("sessionUser") User user ){
		ModelAndView mv = new ModelAndView();	
		mv.addObject("sessionUser", user);
		mv.setViewName("userMain");
		return mv;
	}

	@RequestMapping(value = "updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUserWithInformationFromPage(@ModelAttribute("userToUpdate") User user, @RequestParam("countryName") String name, @RequestParam("originalCountry") String originalName) {
		ModelAndView mv = new ModelAndView();		
		Country c = userdao.getCountryByCountryName(name);
		if(c != null){
			user.setCountry(c);
		}
		else{
			c = userdao.getCountryByCountryName(originalName);
			user.setCountry(c);
		}
		userdao.updateUser(user.getId(), user);
		mv.setViewName("updateUser");
		mv.addObject("userToUpdate", user);
		return mv;
	}
	
	@RequestMapping(value="adminUpdateUser.do", method=RequestMethod.POST)
	public ModelAndView updateUserByAdmin(@RequestParam("updateid") int id) {
	ModelAndView mv = new ModelAndView();
	User temp = userdao.getUserByID(id);
	mv.setViewName("updateUser");
	mv.addObject("userToUpdate", temp);
	return mv;
	}
	

	@RequestMapping(value = "updateUser.do", method = RequestMethod.GET)
	public ModelAndView updateUser(@ModelAttribute("sessionUser") User user, @RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		if (user.getFirstName() == null) {
			mv.setViewName("index");
			return mv;
		} else {
		
		User temp = userdao.getUserByID(id);
		mv.setViewName("updateUser");
		mv.addObject("userToUpdate", temp);
		return mv;
		}
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.GET)
	public ModelAndView createUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser");
		return mv;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUserWithInfoFromPage(@Valid @ModelAttribute("sessionUser") User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		if (errors.getErrorCount() != 0) {
			mv.setViewName("createUser");
			return mv;
		} else if (userdao.usernameExists(user.getUsername())) {
			mv.setViewName("createUser");
			mv.addObject("userExists", "This username exists already, try again");
			return mv;
			
		} else {
			user.setPhotoUrl("http://res.cloudinary.com/chiangs/image/upload/v1491241630/SD%20projects/travel.png");		
			userdao.createUser(user);
			mv.setViewName("userMain");
			mv.addObject("sessionUser", user);
			return mv;
		}
	}

	@RequestMapping(value="deleteUser.do", method=RequestMethod.POST)
	public ModelAndView deleteUser(@ModelAttribute("sessionUser") User user, @RequestParam("myId") int id) {
		ModelAndView mv = new ModelAndView();
		userdao.destroyUser(user.getId());
		mv.setViewName("index");
		mv.addObject("sessionUser", user);
		return mv;
	}
	
	@RequestMapping(value="deleteUsers.do", method=RequestMethod.GET)
	public ModelAndView goToDeleteUsersPage(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("adminDeleteUsers");
		mv.addObject("sessionUser", user);
		mv.addObject("allUsers", userdao.index());
		return mv;
	}
	
	@RequestMapping(value="deleteUsers.do", method=RequestMethod.POST)
	public ModelAndView deleteUsers(@ModelAttribute("sessionUser") User user, @RequestParam("deleteId") int id) {
		ModelAndView mv = new ModelAndView();
		userdao.destroyUser(id);
		mv.setViewName("userMain");
		mv.addObject("sessionUser", user);
		mv.addObject("allUsers", userdao.index());
		return mv;
	}
}
