package logins;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Session
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = request.getParameter("uname");
		String pwd = request.getParameter("pass");
		if (un.equals("candidjava")) {
			out.print("Welcome, " + un);
			HttpSession session = request.getSession(true); // reuse existing
			
			
			Date date =new Date();
			long timeMilli = date.getTime();
			String random = "al"+timeMilli;
			session.setAttribute("testInq", random);
														// session if exist
															// or create one
			session.setAttribute("user", un);
			session.setMaxInactiveInterval(1200); // 10mins
			response.sendRedirect("home.jsp");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			out.println("<font color=red>Either user name or password is wrong.</font>");
			rd.include(request, response);
		} // TODO Auto-generated method stub
	}
}
