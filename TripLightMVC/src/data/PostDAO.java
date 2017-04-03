package data;

import java.util.List;

import javax.persistence.EntityManager;

import com.tl.entities.Post;

public interface PostDAO {
	public Post createPost(Post post);
	
	public Post updatePost(int id, Post post);
	
	public boolean destroyPost(int id);
		
	public List<Post> displayPostByCountryCode(String countryCode);
	
	public void setEntityManager(EntityManager emInj);
}
