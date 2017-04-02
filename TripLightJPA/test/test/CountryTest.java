package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tl.entities.Country;

public class CountryTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Country country;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("TripLight");
		em = emf.createEntityManager();
		country = em.find(Country.class, "US");
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_mapping_country_have_names() {
		assertEquals("United States", country.getName());
	}
}
