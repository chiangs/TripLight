package dao;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tl.entities.Country;
import com.tl.entities.User;

public class UserDAOTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
	}

	@After
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_customer_mappings2() {
		UserDAO dao = new UserDAOImpl();
		User user = em.find(User.class, 2);
		User testUser = new User();
		testUser.setFirstName("Ehren");
		testUser.setLastName("Williamson");
		testUser.setUsername("ehren");
		testUser.setPassword("williamson");
		testUser.setEmail("e.williamson@yahoo.com");
		testUser.setCountry(em.find(Country.class, "US"));
		assertEquals("Dennis", user.getFirstName().toString());
		assertEquals(3, user.getPosts().size());
		assertEquals("United States", user.getCountry().getName());
		Country country = em.find(Country.class, "US");
		assertEquals(0, country.getPlaces().size());
		assertEquals("Ehren", dao.createUser(testUser).getFirstName());
	}
}
