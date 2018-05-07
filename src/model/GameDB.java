package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class GameDB {

	public ArrayList<Cart> addtoCart(String gametitle, ArrayList<Cart> cartList){
		
		
		try{
			Connection conn = DBConn.getConnection();
			
			String sql = "select * from game where GameTitle=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gametitle);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
			
			String gameid = rs.getString("GameID");
			String title = rs.getString("GameTitle");
			//String image = rs.getString("ImageLocation");
			//int quantity = rs.getInt("quantity");
			double price = rs.getDouble("Price");
			int quantity = 1;
			
			Cart cart = new Cart(title, quantity, price);
			
			cartList.add(cart);
			}
			conn.close();
			
		}catch(Exception e){
			System.out.println(e);
		}
		return cartList;
		
	}//addtocart()
	
	
	public static int getQuantity(String gameTitle){
		int quantity = 0;
		try{
			Connection conn = DBConn.getConnection();
			
			String sql = "select Quantity from game where GameTitle=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gameTitle);
			ResultSet rs = pstmt.executeQuery();
			
			
			rs.next();
			quantity = rs.getInt("Quantity");
			
			
			//conn.close();
		}catch(Exception e){
			System.out.println(e);
		}
		return quantity;
	}
	
	public void insertHistory(int id, String date, ArrayList<Cart> cartList){
		try{
		  Connection conn = DBConn.getConnection();
		
		  String sql = "Insert into history(memberID,gameTitle,quantity,date,price) values(?,?,?,?,?)";
		  
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  
		  for(Cart cart:cartList){
			  
			  
			  pstmt.setInt(1, id);
			  pstmt.setString(2, cart.getGameTitle());
			  pstmt.setInt(3, cart.getQuantity());
			  pstmt.setString(4, date);
			  pstmt.setDouble(5, cart.getPrice());
			  
			  pstmt.executeUpdate();
		  }
		  
			
		}catch(Exception e){
		  System.out.println(e);
		}
		
		
	}
	
	public void updateQuantity(ArrayList<Cart> cartList){
		try{
		 Connection conn = DBConn.getConnection();

		  String sql = "select Quantity from game where GameTitle=?";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  String sql1 = "update game set Quantity=? where GameTitle=?";
		  PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		  int qty = 0;
		  int newquantity = 0;
		  
		  for(Cart c:cartList){
		  pstmt.setString(1, c.getGameTitle());
		  ResultSet rs = pstmt.executeQuery();
		  
		  rs.next();
		  qty = rs.getInt("quantity");
		  
		  newquantity =qty-(c.getQuantity());
		  
		  
          pstmt1.setInt(1, newquantity);
          pstmt1.setString(2, c.getGameTitle());
          
          pstmt1.executeUpdate();
		  }
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
