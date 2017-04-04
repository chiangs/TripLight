package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tl.entities.City;
import com.tl.entities.Country;
import com.tl.entities.Place;
import com.tl.entities.Post;
import com.tl.entities.User;

import data.PostDAO;
import data.UserDAO;

@Controller
@SessionAttributes("sessionUser")
public class PostContoller {
	
	@Autowired
	private UserDAO userdao;
	
	@Autowired
	private PostDAO postDAO;
	


	@RequestMapping(value = "updatePost.do", method = RequestMethod.GET)
	public ModelAndView updateUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatePost");
		mv.addObject("sessionUser", user);
		return mv;
	}
	
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

	
	@RequestMapping(value="displayPostByCountry.do", method=RequestMethod.POST)
	public ModelAndView displayPostByCountry(@RequestParam("countryName") String countryName) {
		
		ModelAndView mv = new ModelAndView();
		List<Post> posts = postDAO.displayPostByCountryName(countryName);
//		for (Post post : posts) {
//			System.out.println(post);
//		}
		mv.setViewName("userMain");
		mv.addObject("postList", posts);
		return mv;
	}
	
	@RequestMapping(path = "createPost.do", method = RequestMethod.GET)
	public ModelAndView createUser(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createPost");
		mv.addObject("sessionUser", user);
		return mv;
	}
	
	@RequestMapping(value="createPost.do", method=RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute("sessionUser") Post post) {
		ModelAndView mv = new ModelAndView();
		postDAO.createPost(post);
		mv.setViewName("create");
		mv.addObject("sessionUser", post);
		return mv;
	}
	
	@RequestMapping(value="createPlace.do", method=RequestMethod.POST)
	public ModelAndView createPlace(Place place, @RequestParam("city") String city, @RequestParam("countryName") String countryName) {
		ModelAndView mv = new ModelAndView();
		City c = userdao.getCityByName(city);
		Country co = userdao.getCountryByCountryName(countryName);
		place.setCountry(co);
		place.setCity(c);
		postDAO.createPost(post);
		mv.setViewName("create");
		mv.addObject("sessionUser", post);
		return mv;
	}
	
	//create Method with value="createPlace.do" 
	//@RequestParam(Place place, @RequestParam("city") String city, @RequestParam("countryName") String countryName)
	//get city by city name
	//get country by countryName
	//set 
	
	@RequestMapping(value="displayPostByUser.do", method=RequestMethod.POST)
	public ModelAndView displayPostByUserId(@ModelAttribute("sessionUser")User user) {
		ModelAndView mv = new ModelAndView();
		postDAO.displayPostByUserId(user);
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		return mv;
	}
	//New Comment
}
