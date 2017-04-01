package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tl.entities.City;

public class CityTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private City city;

	@Before
	public void setUp() throws Exception {
		System.out.println("test");
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
		
		System.out.println("test2");
		city = em.find(City.class, 1);
		System.out.println("test3");
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_mapping_user_have_names() {
		assertEquals("Shanghai", city.getName());
	}
}
