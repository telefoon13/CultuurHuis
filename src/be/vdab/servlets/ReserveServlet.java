package be.vdab.servlets;

import be.vdab.enteties.Performance;
import be.vdab.repositories.PerformancesRepository;

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

@WebServlet(urlPatterns = "/reserve.htm", name = "ReserveServlet")
public class ReserveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/reserve.jsp";
	private static final String REDIRECT_URL = "%s/reserveBasket.htm";
	private final transient PerformancesRepository performancesRepository = new PerformancesRepository();

	@Resource(name = PerformancesRepository.JNDI_NAME)
	public void setDataSource(DataSource dataSource) {
		performancesRepository.setDataSource(dataSource);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long performanceID = Long.parseLong(request.getParameter("performanceid"));
		int numbOfTickets = Integer.valueOf(request.getParameter("numbOfTickets"));
		Performance performance = performancesRepository.findPerformanceById(performanceID);
		//To many tickets
		if (performance.getFreeseats() < numbOfTickets) {
			request.setAttribute("error", "toManyTickets");
			long id = Long.parseLong(request.getParameter("id"));
			request.setAttribute("performance", performancesRepository.findPerformanceById(id));
			request.getRequestDispatcher(VIEW).forward(request, response);
			//Correct numb of tickets
		} else {
			HttpSession session = request.getSession();
			//Session basket exist
			if (session.getAttribute("basket") != null) {
				@SuppressWarnings("unchecked")
				Map<Performance, Integer> basketMap = (HashMap) session.getAttribute("basket");
				basketMap.put(performance, numbOfTickets);
				session.setAttribute("basket", basketMap);
			} else {
				Map<Performance, Integer> basketMap = new HashMap<>();
				basketMap.put(performance, numbOfTickets);
				session.setAttribute("basket", basketMap);
			}
			response.sendRedirect(response.encodeRedirectURL(String.format(REDIRECT_URL, request.getContextPath())));
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long id = Long.parseLong(request.getParameter("id"));
		request.setAttribute("performance", performancesRepository.findPerformanceById(id));
		request.getRequestDispatcher(VIEW).forward(request, response);

	}
}