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

	@RequestMapping(value = "updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUserWithInformationFromPage(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		userdao.updateUser(user.getId(), user);
		mv.setViewName("userMain");
		mv.addObject("sessionUser", user);
		return mv;
	}

	@RequestMapping(value = "updateUser.do", method = RequestMethod.GET)
	public ModelAndView updateUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateUser");
		mv.addObject("sessionUser", user);
		return mv;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.GET)
	public ModelAndView createUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser");
		return mv;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUserWithInfoFromPage(@Valid User user, Errors errors) {

		ModelAndView mv = new ModelAndView();

		if (errors.getErrorCount() != 0) {
			System.out.println("IN ERROR BLOCK");
			mv.setViewName("createUser");
			return mv;
		}
		
		userdao.createUser(user);
		mv.setViewName("userMain");
		mv.addObject("sessionUser", user);
		return mv;
	}

	@RequestMapping(value="deleteUser.do", method=RequestMethod.POST)
	public ModelAndView deleteUSer(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
	
		userdao.destroyUser(user.getId());
		mv.setViewName("index");
		mv.addObject("sessionUser", user);
		return mv;
	}
}