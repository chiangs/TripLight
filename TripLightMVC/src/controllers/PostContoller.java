package controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public ModelAndView updateUser(@ModelAttribute("sessionUser") User user, @RequestParam("postId") int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatePost");
		mv.addObject("sessionUser", user);
		mv.addObject("post", postDAO.getPostById(id));
		return mv;
	}
	
	@RequestMapping(value="updatePost.do", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute("sessionUser") User user,@RequestParam("review") String review,@RequestParam("dateStr") String dateStr, @RequestParam("postId") int id) {
		ModelAndView mv = new ModelAndView();
//		postDAO.updatePost(post.getId(), post);
		Post post = postDAO.getPostById(id);
//		place= postDAO.createPlace(place);
		post.setReview(review);
//		post.setPlace(place);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = formatter.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		post.setDate(date);
//		post.setUser(user);
		post = postDAO.updatePost(id, post);
		
		
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", postDAO.displayPostByUserId(user));
		return mv;
	}
	
	@RequestMapping(value= "destroyPost.do", method = RequestMethod.POST) //this allows user to destroy own post
	public ModelAndView destroyPost(@ModelAttribute("sessionUser") User user, @ModelAttribute("postId") int id) {
		ModelAndView mv = new ModelAndView();
		postDAO.destroyPost(id);
		List<Post> posts = postDAO.displayPostByUserId(user);
		mv.setViewName("userPost");
		mv.addObject("postList", posts);
		mv.addObject("sessionUser", user);
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
	public ModelAndView createUser(@ModelAttribute("newPlace")Place place, @ModelAttribute("sessionUser") User user ) {
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("createPost");
		mv.addObject("placeName", place);
		mv.addObject("sessionUser", user);
		return mv;
	}
	
	@RequestMapping(value="createPost.do", method=RequestMethod.POST)
	public ModelAndView createPost(@ModelAttribute("sessionUser") User user,  
			@RequestParam("place")String placeStr,
			@RequestParam("dateString")String dateStr,
			@RequestParam("review")String review
			) {
		System.out.println("***********************************");
		System.out.println(dateStr);
		System.out.println(review);
		System.out.println(placeStr);
		System.out.println("***********************************");
		Post post = new Post();
		post.setReview(review);
		Place place = null;
		try{
			 place = postDAO.getPlaceByName(placeStr);
		}catch(Exception e){
			ModelAndView mv = new ModelAndView();
			mv.addObject("review", review);
			mv.addObject("placeName", placeStr);
			mv.addObject("date", dateStr);
			mv.addObject("sessionUser", user);
			mv.setViewName("newPlace");
			
			return mv;
		}
		
		post.setPlace(place);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = formatter.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		post.setDate(date);
		post.setUser(user);
		post = postDAO.createPost(post);

		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", postDAO.displayPostByUserId(user));
		System.out.println("Place is set");
		System.out.println(post.getDate());
		return mv;
	}
	
	@RequestMapping(value="createPlace.do", method=RequestMethod.POST)
	public ModelAndView createPlace(@ModelAttribute("sessionUser") User user, Place place, @RequestParam("cityName") String city, @RequestParam("countryName") String countryName, @RequestParam("review")String review, @RequestParam("dateStr")String dateStr) {
 		ModelAndView mv = new ModelAndView();
		City c = userdao.getCityByName(city);
		System.out.println(place);
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
		
		place= postDAO.createPlace(place);
		
		Post post = new Post();
		post.setReview(review);
		post.setPlace(place);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = formatter.parse(dateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		post.setDate(date);
		post.setUser(user);
		post = postDAO.createPost(post);
		
		
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", postDAO.displayPostByUserId(user));
		return mv;
	}
	
	@RequestMapping(value="viewPost.do", method=RequestMethod.GET)
	public ModelAndView displayPostByUserId(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		System.out.println("In viewpost ID");
		List<Post> posts = postDAO.displayPostByUserId(user);
		mv.setViewName("userPost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", posts);
		return mv;
	}
	@RequestMapping(value="deletePost.do", method=RequestMethod.POST)
	public ModelAndView adminDeletePost(@ModelAttribute("sessionUser") User user,@RequestParam("deleteId") int id) {
		ModelAndView mv = new ModelAndView();
		postDAO.destroyPost(id);
		mv.setViewName("adminDeletePost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", postDAO.index());
		return mv;
	}
	@RequestMapping(value="deletePostAdmin.do", method=RequestMethod.GET)
	public ModelAndView adminDeletePost(@ModelAttribute("sessionUser") User user) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminDeletePost");
		mv.addObject("sessionUser", user);
		mv.addObject("postList", postDAO.index());
		return mv;
	}

}