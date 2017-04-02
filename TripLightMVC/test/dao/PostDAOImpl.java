package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.tl.entities.Post;

public class PostDAOImpl implements PostDAO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("TestTripLight");
    EntityManager em = emf.createEntityManager();
    
	@Override
	public Post createPost(Post post) {
		
        if (post != null) {
            em.getTransaction().begin();
                em.persist(post);
                em.flush();
            em.getTransaction().commit();
        }
        else {
            System.out.println("Please enter something here");
        }
        return post;
    }

	@Override
	public Post updatePost() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post destroyPost() {
		// TODO Auto-generated method stub
		return null;
	}

}
