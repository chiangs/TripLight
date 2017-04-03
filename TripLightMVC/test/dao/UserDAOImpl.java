package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.tl.entities.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public User createUser(User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();

		// start the transaction
		em.getTransaction().begin();
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

	public List<User> index(){
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		String queryString = "SELECT u FROM User u";
		List<User> results = em.createQuery(queryString, User.class).getResultList();
		
	    return results;
	
	}
	public User getUserByID(int id){
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("TripLight");
		EntityManager em = emf.createEntityManager();
		User foundUser = em.find(User.class,id);
		return foundUser;
	}
}
