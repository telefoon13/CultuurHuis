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
import javax.sql.DataSource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/signup.htm",name = "SignupServlet")
public class SignupServlet extends HttpServlet {

	private static final long serialVersionUID =1L;
	private static final String VIEW = "/WEB-INF/JSP/signup.jsp";
	private static final String REDIRECT_URL = "/WEB-INF/JSP/confirmReservations.jsp";
	private final transient UserRepository userRepository = new UserRepository();
	private static final String USERNAME_PATTERN = "^[a-zA-Z0-9._-]{3,40}$";
	private static final String EMAIL_PATTERN = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$";
	private static final String PASS_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.?!])(?=\\S+$).{8,40}$";

	@Resource(name = PerformancesRepository.JNDI_NAME)
	public void setDataSource(DataSource dataSource) {
		userRepository.setDataSource(dataSource);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map<String, String> faults = new HashMap<>();
		String prename = request.getParameter("prename");
		String lastname = request.getParameter("lastname");
		String street = request.getParameter("street");
		String streetnr = request.getParameter("streetnr");
		String zipcode = request.getParameter("zipcode");
		String city = request.getParameter("city");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		User userExist = userRepository.userExist(username);
		boolean emailExist = userRepository.emailExist(email);
		Pattern pattern = Pattern.compile(USERNAME_PATTERN);
		Pattern emailPattern = Pattern.compile(EMAIL_PATTERN, Pattern.CASE_INSENSITIVE);
		Pattern passPattern = Pattern.compile(PASS_PATTERN);

		//prename check
		if (prename == null || prename.isEmpty()){
			faults.put("prename", "Gelieven een prename in te vullen.");
		}
		if (!pattern.matcher(prename).matches()){
			faults.put("prename", "prename voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		//lastname check
		if (lastname == null || lastname.isEmpty()){
			faults.put("lastname", "Gelieven een lastname in te vullen.");
		}
		if (!pattern.matcher(lastname).matches()){
			faults.put("lastname", "lastname voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		//street check
		if (street == null || street.isEmpty()){
			faults.put("street", "Gelieven een street in te vullen.");
		}
		if (!pattern.matcher(street).matches()){
			faults.put("street", "street voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		//streetnr check
		if (streetnr == null || streetnr.isEmpty()){
			faults.put("streetnr", "Gelieven een streetnr in te vullen.");
		}
		//zipcode check
		if (zipcode == null || zipcode.isEmpty()){
			faults.put("zipcode", "Gelieven een zipcode in te vullen.");
		}
		if (!pattern.matcher(zipcode).matches()){
			faults.put("zipcode", "zipcode voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		//city check
		if (city == null || city.isEmpty()){
			faults.put("city", "Gelieven een city in te vullen.");
		}
		if (!pattern.matcher(username).matches()){
			faults.put("city", "city voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		//Gebruikersnaam check
		if (username == null || username.isEmpty()){
			faults.put("username", "Gelieven een gebruikersnaam in te vullen.");
		}
		if (!pattern.matcher(username).matches()){
			faults.put("username", "Gebruikersnaam voldoet niet aan de voorwaarden (a-Z . - _) min 3 max 40 tekens.");
		}
		if (userExist != null) {
			faults.put("username", "Gebruikersnaam bestaat al.");
		}

		//Email check
		if (email == null || email.isEmpty()){
			faults.put("email", "Gelieven een email adres in te vullen.");
		}
		if (!emailPattern.matcher(email).matches()){
			faults.put("email", "Dit is geen geldig email adres");
		}
		if (emailExist){
			faults.put("email", "Dit email adres komt al voor in onze database.");
		}

		//Pass check
		if (password == null || password.isEmpty() || password2 == null || password2.isEmpty()){
			faults.put("password","Gelieven een wachtwoord in te invullen.");
		}
		if (!password.equals(password2)){
			faults.put("password","Beide wachtwoorden komen niet overeen");
		}
		if (!passPattern.matcher(password).matches()){
			faults.put("password","Wachtwoord voldoet niet aan de voorwaarden " +
					"(min 1 cijfer, 1 kleine letter, 1 grote letter, 1 speciaal teken(@#$%^&+=.?!), min 8 tekens lang en max 40 tekens lang).");
		}

		//Geen fouten
		if (faults.isEmpty()){
			boolean makeUser = userRepository.signup(prename,lastname,street,streetnr,zipcode,city,username,email,password);
			if (makeUser) {
				request.getRequestDispatcher(REDIRECT_URL).forward(request, response);
			}
		} else {
			request.setAttribute("fouten", faults);
			request.getRequestDispatcher(VIEW).forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher(VIEW).forward(request,response);

	}
}
