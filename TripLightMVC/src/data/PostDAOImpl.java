package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import com.tl.entities.Post;

public class PostDAOImpl implements PostDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Post> displayPostByCountryCode(String countryCode) {
		String query = "SELECT p FROM Post p JOIN FETCH p.place WHERE p.place.country = :country";
		List<Post> posts = null;
		posts= em.createQuery(query, Post.class).setParameter("country", countryCode).getResultList();
		

	return posts;
	}

	@Override
	public Post createPost(Post post) {
		EntityManagerFactory emf = 
		        Persistence.createEntityManagerFactory("TripLight");
		    EntityManager em = emf.createEntityManager();

		    // start the transaction
		    em.getTransaction().begin();
		    // write the customer to the database
		    em.persist(post);
		    // update the "local" ("detached") 'customer' object
		    em.flush();
		    // commit the changes (actually perform the operation)
		    em.getTransaction().commit();

		    // return the full "managed" customer object
		    return post;
	}

	@Override
	public Post updatePost(int id, Post post) {
		
			EntityManagerFactory emf = 
			        Persistence.createEntityManagerFactory("TripLight");
			    EntityManager em = emf.createEntityManager();

			    // start the transaction
			    em.getTransaction().begin();
			   Post managed = em.find(Post.class, id);
			    em.getTransaction().commit();

			
			
			return post;
		}
	

	@Override
	public boolean destroyPost(int id) {
		EntityManagerFactory emf = 
		        Persistence.createEntityManagerFactory("TripLight");
		    EntityManager em = emf.createEntityManager();
		Post p = em.find(Post.class, id);
		em.getTransaction().begin();

		em.remove(p); // performs the delete on the managed entity

		em.getTransaction().commit();

		
		
		return false;
	}

}
