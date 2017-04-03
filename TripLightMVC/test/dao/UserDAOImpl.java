package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.tl.entities.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public User createUser(User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Triplight");
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
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("VideoStore");
		EntityManager em = emf.createEntityManager();

		// start the transaction
		em.getTransaction().begin();

		User Managed = em.find(User.class, id);
		Managed.setFirstName(user.getFirstName());
		Managed.setLastName(user.getLastName());
		// write the customer to the database
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
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Triplight");
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, id);
		em.getTransaction().begin();
		em.remove(user); // performs the delete on the managed entity

		em.getTransaction().commit();

		if (em.contains(user) == false){
			return true;
		}
		return false;	
	}

}
