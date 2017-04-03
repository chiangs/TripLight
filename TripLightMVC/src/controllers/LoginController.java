package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.User;

import data.LoginDelegate;

@Controller
public class LoginController {

	@Autowired
	private LoginDelegate loginDelegate;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView displayLogin(@Valid User user) {
		System.out.println("test");
		ModelAndView mv = new ModelAndView("login");
		User loginUser = new User();
		mv.addObject("user", loginUser);
		return mv;
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView executeLogin(@ModelAttribute("user") User user) {
		ModelAndView model = new ModelAndView();
		try {
			User isValidUser = loginDelegate.isValidUser(user.getUsername(), user.getPassword());
			if (isValidUser != null) {
				System.out.println("User Login Successful");
				model.addObject("loggedInUser",  isValidUser);
				model.setViewName("userMain");
			}
			else {
				model.addObject("loggedInUser", user);
				model.addObject("message", "No such username/password");
				model.setViewName("index");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	
}
