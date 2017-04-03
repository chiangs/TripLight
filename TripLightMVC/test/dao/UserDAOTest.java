package dao;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.Before;
import org.junit.Test;

import com.tl.entities.User;

public class UserDAOTest {
	  private EntityManagerFactory emf;
	  private EntityManager em;

		@Before
		public void setUp() throws Exception {
			emf = Persistence.createEntityManagerFactory("TripLight");
			em = emf.createEntityManager();
			
		}
	  
	  @Test
	  public void test_customer_mappings2() {
	
		  User user = em.find(User.class, 1);
		  assertEquals("admin", user.getFirstName().toString());
		  assertEquals("1", user.getPosts().size());
		
	  }
}
