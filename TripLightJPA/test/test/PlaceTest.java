package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tl.entities.Place;

public class PlaceTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Place place;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
		place = em.find(Place.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_mapping_user_have_names() {
		assertEquals("Huxinttung Teahouse", place.getName());
	}
}
