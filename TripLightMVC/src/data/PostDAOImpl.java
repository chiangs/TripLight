
package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.tl.entities.Place;
import com.tl.entities.Post;
import com.tl.entities.User;

@Transactional
public class PostDAOImpl implements PostDAO {

	@Override
	public Place createPlace(Place place) {
		
		em.persist(place);
		
		return place;
	}

	@PersistenceContext
	private EntityManager em;

	public void setEntityManager(EntityManager emInj) {
		em = emInj;
	}

	@Override
	public List<Post> displayPostByCountryName(String countryName) {
		String query = "SELECT p FROM Post p WHERE p.place.country.name = :country";
		System.out.println(countryName);
		List<Post> post = null;
		post = em.createQuery(query, Post.class).setParameter("country", countryName).getResultList();
		System.out.println(post);
		return post;
	}
	
	@Override
	public List<Post> displayPostByCountryCode(String countryCode) {
		String query = "SELECT p FROM Post p WHERE p.place.country.name = :country";
		List<Post> post = null;
		post = em.createQuery(query, Post.class).setParameter("country", countryCode).getResultList();
		return post;
	}

	@Override
	public Post createPost(Post post) {
		em.persist(post);
		em.flush();
		return post;
	}

	@Override
	public Post updatePost(int id, Post post) {

		Post managed = em.find(Post.class, id);
		System.err.println(managed);
		System.err.println(post.getReview());
		managed.setReview(post.getReview());
		managed.setDate(post.getDate());
		em.merge(managed);
		

		return post;
	}

	@Override
	public boolean destroyPost(int id) {
		Post p = em.find(Post.class, id);
		em.remove(p); // performs the delete on the managed entity
		return false;
	}

	@Override
	public List<Post> displayPostByUserId(User user) {
		String query = "SELECT p FROM Post p WHERE p.user.id = :user";
		List<Post> posts = null;
		posts = em.createQuery(query, Post.class).setParameter("user", user.getId()).getResultList();

		return posts;
	}
	
	@Override
	public Place getPlaceByName(String name) {
		System.out.println("in findPlaceByName " + name);
		Place place = new Place();
		String query = "SELECT p FROM Place p WHERE p.name = :name";	
		Place p = em.createQuery(query, Place.class).setParameter("name", name).getSingleResult();
//		System.out.println(p.toString());
		return p;
	}
	
	public List<Post> index() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String queryString = "SELECT p FROM Post p";
		List<Post> results = em.createQuery(queryString, Post.class).getResultList();

		return results;

	}

	@Override
	public Post getPostById(int id) {
		return em.find(Post.class, id);
	}


}
