package data;

import com.tl.entities.Post;

public interface PostDAO {
	public Post createPost();
	
	public Post updatePost();
	
	public Post destroyPost();
}
