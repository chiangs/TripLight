package dao;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import com.tl.entities.Place;
import com.tl.entities.Post;
import com.tl.entities.User;

import data.PostDAO;
import data.PostDAOImpl;

public class PostDAOTest {
	@Test // Basic test
    public void test() {
        boolean pass = true;
        assertEquals(pass, true);
    }
	
	private EntityManagerFactory emf = null;
	private EntityManager em = null;

	@Autowired
	WebApplicationContext wac;
	
	@Autowired
	private PostDAO dao;
	
	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
		dao = new PostDAOImpl();
		dao.setEntityManager(em);
		

	}
	
	@After
	public void tearDown() throws Exception {

		em.close();
		emf.close();
	}
	
	@Test
	public void test_displayPostByCountryCode() {
		assertEquals(1, dao.displayPostByCountryCode("CO").size());
	}
	
	@Test 
	public void test_createPost() throws ParseException{
		SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
		Date date = dateformat3.parse("17/07/1989");

		System.out.println(dao == null);
		Post p = new Post();
		Place place = em.find(Place.class,1);
		System.err.println(place);
		User user = em.find(User.class, 3);
		p.setPlace(place);
		p.setUser(user);
		p.setReview("It's so totally wicked!");
		p.setDate(date);
		
		assertEquals(1, dao.createPost(p).getPlace().getId());
		
	}
	@Test 
	public void test_updatePost(){
		Post p = new Post();
		Place pl = new Place();
		p.setReview("Statue of Christ the Redeemer");
		assertEquals("Statue of Christ the Redeemer", dao.updatePost(2, p).getReview());
		
	}
		
		

	@Test 
	public void test_destroyPost(){
		System.err.println(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
		assertEquals("", dao.destroyPost(2));
	}
}
