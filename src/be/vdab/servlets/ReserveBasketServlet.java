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
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/reserveBasket.htm", name = "ReserveBasketServlet")
public class ReserveBasketServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/reserveBasket.jsp";
	private static final String REDIRECT_URL = "%s/performances.htm";
	private final transient PerformancesRepository performancesRepository = new PerformancesRepository();

	@Resource(name = PerformancesRepository.JNDI_NAME)
	public void setDataSource(DataSource dataSource) {
		performancesRepository.setDataSource(dataSource);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//DELETE KNOP
		String[] idAlsString = request.getParameterValues("toDeleteId");
		if (idAlsString != null) {
			HttpSession session = request.getSession();
			Set<Long> setId = Arrays.stream(idAlsString).map(id -> Long.parseLong(id)).collect(Collectors.toSet());
			Map<Performance, Integer> basketMap = (HashMap) session.getAttribute("basket");
			Set<Performance> basketPerf = basketMap.keySet();
			for (long idFromDel : setId) {
				for (Performance performanceInBasket : basketPerf) {
					long idFromBasket = performanceInBasket.getId();
					if (idFromDel == idFromBasket) {
						basketMap.remove(performanceInBasket);

					}
				}
			}
			if (basketMap.size() <= 0) {
				session.removeAttribute("basket");
				response.sendRedirect(response.encodeRedirectURL(String.format(REDIRECT_URL, request.getContextPath())));
			} else {
				session.setAttribute("basket", basketMap);
				request.getRequestDispatcher(VIEW).forward(request, response);
			}
		} else {
			request.getRequestDispatcher(VIEW).forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher(VIEW).forward(request, response);

	}
}