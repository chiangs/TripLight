package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tl.entities.Post;

public class PostTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Post post;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
		post = em.find(Post.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_mapping_post_have_countryCode() {
		assertEquals("US", post.getUser().getCountry().getCountryCode());
	}
}
