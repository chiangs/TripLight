package data;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

import com.tl.entities.City;
import com.tl.entities.Country;
import com.tl.entities.User;

public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	EntityManager em;

	DataSource dataSource;

	public DataSource getDataSource() {
		return this.dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public User isValidUser(String username, String password) throws SQLException {
		String query = "Select u from User u where u.username = :username and u.password = :password";
		try {
			User user = em.createQuery(query, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
			return user;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public User createUser(User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		// start the transaction
		em.getTransaction().begin();

		user.setCountry(em.find(Country.class, "US"));
		em.persist(user);
		// update the "local" ("detached") 'customer' object
		em.flush();
		// commit the changes (actually perform the operation)
		em.getTransaction().commit();

		// return the full "managed" customer object
		return user;
	}

	@Override
	public User updateUser(int id, User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		// start the transaction
		em.getTransaction().begin();

		User Managed = em.find(User.class, id);
		Managed.setFirstName(user.getFirstName());
		Managed.setLastName(user.getLastName());
		Managed.setUsername(user.getUsername());
		Managed.setPassword(user.getPassword());
		Managed.setEmail(user.getEmail());
		Managed.setCountry(user.getCountry());
		Managed.setAdminFlag(user.getAdminFlag());

		em.persist(Managed);
		// update the "local" ("detached") 'customer' object
		em.flush();
		// commit the changes (actually perform the operation)
		em.getTransaction().commit();
		// return the full "managed" customer object
		return Managed;
	}

	@Override
	public boolean destroyUser(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, id);
		em.getTransaction().begin();
		em.remove(user); // performs the delete on the managed entity

		em.getTransaction().commit();

		if (em.contains(user) == false) {
			return true;
		}
		return false;
	}

	public List<User> index() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String queryString = "SELECT u FROM User u";
		List<User> results = em.createQuery(queryString, User.class).getResultList();

		return results;

	}

	public User getUserByID(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		User foundUser = em.find(User.class, id);
		return foundUser;
	}

	@Override
	public Country getCountryByCountryCode(String countryCode) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		return em.find(Country.class, countryCode);
	}

	@Override
	public Country getCountryByCountryName(String countryName) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String query = "SELECT c from Country c where c.name = :countryName";
		try {
			Country country = em.createQuery(query, Country.class).setParameter("countryName", countryName)
					.getSingleResult();
			return country;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public City getCityByName(String city) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String query = "SELECT c from City c where c.name = :city";
		try {
			City c = em.createQuery(query, City.class).setParameter("city", city).getSingleResult();
			return c;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public boolean usernameExists(String username) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String query = "SELECT u from User u where u.username = :username";
		try {
			User found = em.createQuery(query, User.class).setParameter("username", username).getSingleResult();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
