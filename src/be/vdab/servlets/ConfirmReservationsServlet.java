package be.vdab.servlets;

import be.vdab.enteties.User;
import be.vdab.repositories.PerformancesRepository;
import be.vdab.repositories.UserRepository;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/confirmreservations.htm",name = "ConfirmReservationServlet")
public class ConfirmReservationsServlet extends HttpServlet {

	private static final long serialVersionUID =1L;
	private static final String VIEW = "/WEB-INF/JSP/confirmReservations.jsp";
	private final transient PerformancesRepository performancesRepository = new PerformancesRepository();
	private final transient UserRepository userRepository = new UserRepository();
	private static final String USERNAME_PATTERN = "^[a-zA-Z0-9._-]{3,40}$";
	private static final String PASS_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.?!])(?=\\S+$).{8,40}$";


	@Resource(name = PerformancesRepository.JNDI_NAME)
	public void setDataSource(DataSource dataSource) {
		performancesRepository.setDataSource(dataSource);
		userRepository.setDataSource(dataSource);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		//LoginKnop
		if (request.getParameter("loginKnop") != null){
			Map<String, String> faults = new HashMap<>();
			boolean chekPass = userRepository.checkPass(request.getParameter("username"), request.getParameter("password"));
			String username = request.getParameter("username");
			String pass = request.getParameter("password");
			User userExist = userRepository.userExist(username);
			Pattern pattern = Pattern.compile(USERNAME_PATTERN);
			Pattern passPattern = Pattern.compile(PASS_PATTERN);


			//Gebruikersnaam check
			if (username == null || username.isEmpty()){
				faults.put("username", "Gelieven een gebruikersnaam in te vullen.");
			}
			else if (!pattern.matcher(username).matches()){
				faults.put("username", "Gebruikersnaam voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
			}
			if (userExist == null) {
				faults.put("username", "Deze gebruikersnaam komt niet voor in onze database.");
			}

			//Pass check
			if (pass == null || pass.isEmpty()){
				faults.put("password","Gelieven een wachtwoord in te vullen.");
			}
			if (!chekPass){
				faults.put("password","Dit wachtwoord is niet correct.");
			}

			//Geen fouten
			if (faults.isEmpty() && userExist != null && chekPass){
				session.setAttribute("user", userExist);
			} else {
				request.setAttribute("faults", faults);
			}
		}


		//Logout
		if (request.getParameter("logoutKnop") != null){
			session.removeAttribute("user");
		}

		//Confirm
		if (request.getParameter("confirmReser") != null){

		}

		request.getRequestDispatcher(VIEW).forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("logout") != ""){
			HttpSession session = request.getSession();
			session.removeAttribute("user");
		}

		request.getRequestDispatcher(VIEW).forward(request,response);

	}
}
