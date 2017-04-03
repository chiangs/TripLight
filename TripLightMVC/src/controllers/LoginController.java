package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.User;

import data.LoginDelegate;

@Controller
@SessionAttributes("sessionUser")
public class LoginController {

	@Autowired
	private LoginDelegate loginDelegate;
	
	@ModelAttribute("sessionUser")
	public User user() {
		return new User();
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public ModelAndView displayLogin(@Valid User user) {
		ModelAndView mv = new ModelAndView("login");
		User loginUser = new User();
		mv.addObject("user", loginUser);
		return mv;
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView executeLogin(Model model, User user) {
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
	public ModelAndView executeLogout(SessionStatus status) {
	ModelAndView mv = new ModelAndView();
	status.setComplete();
	mv.setViewName("index");
	return mv;
	}
	
}
