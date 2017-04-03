package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.Post;

import data.PostDAO;

@Controller
@SessionAttributes("sessionUser")
public class PostContoller {
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
	
	
}
