package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberUtility;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String login = request.getParameter("loginID");
		String password = request.getParameter("password");
		Boolean log;
		Boolean logi;
		String name=MemberUtility.getName(login);
		log=MemberUtility.loginMember(login, password);
		logi=MemberUtility.loginAdmin(login, password);
		if(log){
			HttpSession session =request.getSession();
			session.setAttribute("user", login);
			session.setAttribute("name", name);
			RequestDispatcher lm=request.getRequestDispatcher("index.jsp");
			lm.forward(request, response);
			
		}
		else if(logi){
			HttpSession session =request.getSession();
			session.setAttribute("admin", login);
			RequestDispatcher lm=request.getRequestDispatcher("adminindex.jsp");
			lm.forward(request, response);
		}else{
			HttpSession session =request.getSession();
			session.setAttribute("invalid","Invalid") ;
			response.sendRedirect("login.jsp");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
