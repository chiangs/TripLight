package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.User;

import data.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO userdao;
	@RequestMapping(value="create.do", method=RequestMethod.GET)
	public ModelAndView createNewUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("sessionUser", user);
		return mv;
	}
	@RequestMapping(value="userMain.do", method=RequestMethod.POST)
	public ModelAndView createUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		mv.addObject("sessionUser", user);
		return mv;
	}
}
