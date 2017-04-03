package ctrl;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import controllers.LoginController;
import data.UserDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class LoginControllerTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private LoginController lc;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (UserDAO) wac.getBean("UserDAO");	
	}

	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}
	
	@Test
	public void test_isValidUser() {
		try {
			assertEquals("admin", dao.isValidUser("admin", "solarkisses").getFirstName());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
}
