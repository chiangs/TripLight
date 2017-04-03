package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.Post;

import data.UserDAO;
import data.PostDAO;

@Controller
@SessionAttributes("sessionUser")
public class PostContoller {
	
	@Autowired
	private UserDAO userdao;
	
	@Autowired
	private PostDAO postDAO;
	
	@RequestMapping(value="updatePost.do", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute("sessionUser") Post post) {
		ModelAndView mv = new ModelAndView();
		postDAO.updatePost(post.getId(), post);
		mv.setViewName("index");
		mv.addObject("sessionUser", post);
		return mv;
	}
	
	@RequestMapping(value= "destroyPost.do", method = RequestMethod.POST)
	public ModelAndView destroyPost(@ModelAttribute("sessionUser") int id) {
		ModelAndView mv = new ModelAndView();
		postDAO.destroyPost(id);
		mv.setViewName("destroyPost");
		mv.addObject("sessionUser", id);
		return mv;
	}	

	
	@RequestMapping(value="displayPost.do", method=RequestMethod.POST)
	public ModelAndView displayPostByCountry(@ModelAttribute("sessionUser") String countryCode) {
		ModelAndView mv = new ModelAndView();
		postDAO.displayPostByCountryCode(countryCode);
		mv.setViewName("countryPost");
		mv.addObject("sessionUser", countryCode);
		return mv;
	}
	
	@RequestMapping(value="crearePost.do", method=RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute("sessionUser") Post post) {
		ModelAndView mv = new ModelAndView();
		postDAO.createPost(post);
		mv.addObject("sessionUser", post);
		mv.setViewName("create");
		return mv;
	}
}
