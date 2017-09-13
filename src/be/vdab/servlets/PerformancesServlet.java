package be.vdab.servlets;

import be.vdab.repositories.PerformancesRepository;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(urlPatterns = "/performances.htm", name = "PerformancesServlet")
public class PerformancesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final String VIEW = "/WEB-INF/JSP/performances.jsp";
	private final transient PerformancesRepository performancesRepository = new PerformancesRepository();

	@Resource(name = PerformancesRepository.JNDI_NAME)
	public void setDataSource(DataSource dataSource) {
		performancesRepository.setDataSource(dataSource);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("genre") != null) {
			long genreid = Long.parseLong(request.getParameter("genre"));
			request.setAttribute("performances", performancesRepository.findPerformanceByGenre(genreid));
			request.setAttribute("actifGenre", performancesRepository.findGenreById(genreid));
		}
		request.setAttribute("genres", performancesRepository.findAllGenres());
		request.getRequestDispatcher(VIEW).forward(request, response);

	}
}