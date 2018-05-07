package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import model.*;


/**
 * Servlet implementation class displaycart
 */
@WebServlet("/displaycart")
public class DisplayCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DisplayCart() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//int id = Integer.parseInt(request.getParameter("hiddenID1"));
		String gametitle = request.getParameter("hiddenID1");

		HttpSession session = request.getSession();
        boolean b = false;
		
		GameDB db = new GameDB();
		ArrayList<Cart> cartList;
		if((ArrayList<Cart>)session.getAttribute("display")==null){
			cartList = new ArrayList<Cart>();
		}else{
			cartList = (ArrayList<Cart>)session.getAttribute("display");
		}
		
		for(Cart cart : cartList){
			if(gametitle.equals(cart.getGameTitle())){
				cart.setQuantity(cart.getQuantity()+1);
				b = true;
			}
		}
		
		if(b ==false){
			cartList=db.addtoCart(gametitle,cartList);
		}
		
		
	    session.setAttribute("display", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("displayCart.jsp");
        rd.forward(request, response);
        
		//request.setAttribute("display", display);
		//RequestDispatcher rd = request.getRequestDispatcher("displayCart.jsp");
        //rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
