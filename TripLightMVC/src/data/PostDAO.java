package data;

import java.util.List;

import javax.persistence.EntityManager;

import com.tl.entities.Place;
import com.tl.entities.Post;
import com.tl.entities.User;

public interface PostDAO {
	public Post createPost(Post post);
	
	public Post updatePost(int id, Post post);
	
	public boolean destroyPost(int id);
	
	public List<Post> displayPostByUserId(User user);
	
	public List<Post> displayPostByCountryName(String countryName);

	public List<Post> displayPostByCountryCode(String countryCode);
	
	public void setEntityManager(EntityManager em);
	 
	public Place createPlace(Place place);
<<<<<<< HEAD
	
	public Place getPlaceByName(String name);
=======
	public List<Post> index();
>>>>>>> 8213ca82108452633c3658bde4e34dc223b63fcf
}
