package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.User;

import data.UserDAO;

@Controller
@SessionAttributes("sessionUser")
public class UserController {
	@Autowired
	private UserDAO userdao;
	@RequestMapping(value="updateUser.do", method=RequestMethod.POST)
	public ModelAndView updateUserWithInformationFromPage(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		userdao.updateUser(user.getId(), user);
		mv.setViewName("userMain");
		mv.addObject("sessionUser", user);
		return mv;
	}
	@RequestMapping(value="updateUser.do", method=RequestMethod.GET)
	public ModelAndView updateUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateUser");
		mv.addObject("sessionUser", user);
		return mv;
	}
	@RequestMapping(value="createUser.do", method=RequestMethod.GET)
	public ModelAndView createUser(User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser");
		mv.addObject("sessionUser", user);
		return mv;
	}
	@RequestMapping(value="createUser.do", method=RequestMethod.POST)
	public ModelAndView createUserWithInfoFromPage(User user, @RequestParam("countryCode") String countryCode) {
		System.err.println("test");
		ModelAndView mv = new ModelAndView();
		System.out.println(user.getEmail());
		System.out.println(userdao.getCountryByCountryCode(countryCode));
		user.setCountry(userdao.getCountryByCountryCode(countryCode));
		userdao.createUser(user);
		mv.setViewName("userMain");
		mv.addObject("sessionUser", user);
		return mv;
	}
}
