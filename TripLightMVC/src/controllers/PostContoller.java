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
		postDAO.displayPostByCountryName(countryName);
		List<Post> posts = postDAO.displayPostByCountryName(countryName);
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
		mv.setViewName("createPost");
		mv.addObject("sessionUser", post);
		System.out.println("test");
		return mv;
	}
	
	@RequestMapping(value="createPlace.do", method=RequestMethod.POST)
	public ModelAndView createPlace(@ModelAttribute("sessionUser") User user, Place place, @RequestParam("cityName") String city, @RequestParam("countryName") String countryName) {
 		ModelAndView mv = new ModelAndView();
		City c = userdao.getCityByName(city);
		
		if(c != null){
			place.setCity(c);
		}
		else{
			c = userdao.getCityByName("Istanbul");
			place.setCity(c);
		}
		
		Country co = userdao.getCountryByCountryName(countryName);
		if(co != null){
			place.setCountry(co);
		}
		else{
			co = userdao.getCountryByCountryName("United States");
			place.setCountry(co);
		}
		
		postDAO.createPlace(place);
		mv.setViewName("createPost");
		mv.addObject("sessionUser", user);
		return mv;
	}
	
	
	@RequestMapping(value="displayPostByUser.do", method=RequestMethod.POST)
	public ModelAndView displayPostByUserId(@ModelAttribute("sessionUser")User user) {
		ModelAndView mv = new ModelAndView();
		postDAO.displayPostByUserId(user);
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		return mv;
	}
	
}
