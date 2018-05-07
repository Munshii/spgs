package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.MemberUtility;

/**
 * Servlet implementation class addMemberServlet
 */
@WebServlet("/addMemberServlet")
public class addMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("Name");
		String password=request.getParameter("Password1");
		String passworde=request.getParameter("Password2");
		String address=request.getParameter("Address");
		String email=request.getParameter("Email");
		String contact=request.getParameter("Contact");
		boolean valid= false;
		boolean hasDigit = false;
		boolean hasLetter = false;
		int atSymbol = email.indexOf("@");
	    int dot = email.indexOf(".");

	    // check that the dot is not at the end
		
		
		if ((atSymbol < 1) || (dot <= atSymbol + 2) || (dot == email.length() - 1 )){
			valid= false  ;
		  }else{
		    valid= true  ;
			} 
		
		 try
		   {
		      Integer.parseInt(contact);
		      valid=true;
		   }
		   catch(Exception e)
		   {
		      valid=false;
		   }
		
		
		for (char ch : password.toCharArray()) {
			if(Character.isDigit(ch)){
				hasDigit=true;
			}
			if(Character.isLetter(ch)){
				hasLetter=true;
			}
		}
		if(!(hasDigit && hasLetter)){
			valid=false;
		}
		
		if(name.length()<3){
			valid=false;
			}
		
		if(name==""){
			valid=false;
			}
		
		if(password==""){
			valid=false;
			}
		
		if(passworde==""){
			valid=false;
			}
		
		if(password.length()<8 || password.length()>16){	
			valid=false;
			}	
		
		if(!password.equals(passworde)){
			valid=false;
			}
		
		if(address==""){
			valid=false;
		}
	

		if(email==""){
			valid=false;
			}
		
		if(contact==""){
			valid=false;
			}
		
		else if(contact.toString().length()<8 || contact.toString().length()>8){
			valid=false;
			}
		
		
		
		
	if(valid){
		MemberUtility.addMember(name, password,address,email, contact);
		Member a=new Member(name,password,address,email,contact);
		request.setAttribute("memberdetails",a);
		HttpSession session =request.getSession();
		session.setAttribute("user", email);
		session.setAttribute("name", name);
		RequestDispatcher ab=request.getRequestDispatcher("memberinfo.jsp");
		ab.forward(request, response);
		
		}else{
			response.sendRedirect("registrationForm.jsp");
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
