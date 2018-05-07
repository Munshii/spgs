package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.GameDB;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String gametitle= request.getParameter("title");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		HttpSession session = request.getSession();
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("display");
		
		GameDB db= new GameDB();
		
		for(Cart c:cartList){
			if(gametitle.equals(c.getGameTitle())){
				c.setQuantity(quantity);
			}
			//String title = c.getGameTitle();
			//if(c.getQuantity() < db.getQuantity(title)){
			//	c.setQuantity(c.getQuantity());
			//} else{
			//	response.sendRedirect("displayCart.jsp");
			//}
		}
		
		
//		double itemPrice;
//		for(Cart c: cartList){
//			itemPrice =  (double)c.getQuantity() * c.getPrice();
//			c.setPrice(itemPrice);
//		}
		
//		double totalPrice = 0;
//		for(Cart c: cartList){
//			totalPrice += c.getPrice();
//		}
		
//		double sum = 0;
//		for(Cart c:cartList){
//			sum+= c.getPrice() * c.getQuantity();
//		}
		
		session.setAttribute("display", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("displayCart.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//check quantity with db pass in gametitle
	}

}
