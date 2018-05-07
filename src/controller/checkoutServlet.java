package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.GameDB;
import model.Member;
import model.MemberUtility;

/**
 * Servlet implementation class checkoutServlet
 */
@WebServlet("/checkoutServlet")
public class checkoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String DateNow=ft.format(date);
		
        HttpSession session = request.getSession();
        String id= (String)session.getAttribute("user");
        Member me = MemberUtility.selectMember(id);
        int ide = me.getMemberid();
        
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("display"); 
		
		GameDB db = new GameDB();
		
		db.insertHistory(ide,DateNow, cartList);
		db.updateQuantity(cartList);
		
		session.removeAttribute("display");
		
		/*out.println("<script>");
		out.println("alert('Thank you for shopping with SP game store!')");
		out.println("window.location.href='index.jsp'");
	    out.println("</script>");*/
	    
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
