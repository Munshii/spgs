package model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberUtility {
	
	public static boolean loginMember(String userid, String password){
		boolean log=false;
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			PreparedStatement pstmt= conn.prepareStatement(
						"Select * from member where email=? and password=?");
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
				
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				log=true;
			}
					
			
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}return log;
			
	}
	

	public static boolean loginAdmin(String userid, String password){
		boolean logi=false;
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
				PreparedStatement pstmt = conn.prepareStatement(
					"Select * from login where userid=? and password=?");
				pstmt.setString(1, userid);
				pstmt.setString(2, password);
			
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()){
					logi=true;
				}
			
			
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}return logi;
			
	}
	
	public static String getName(String email){
		
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
				PreparedStatement pstmt = conn.prepareStatement(
					"Select name from member where email=?");
				pstmt.setString(1, email);
			
				ResultSet rs=pstmt.executeQuery();
				rs.next();
				String name=rs.getString("name");
				
			return name;
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}return null;
			
	}
	
	public static void addMember(String name, String password, String address, String email, String contact){
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			PreparedStatement pstmt = conn.prepareStatement(
					"Insert into member (name,password,address,email,contact) values(?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, address);
			pstmt.setString(4, email);
			pstmt.setString(5, contact);

			//execute statement
			pstmt.executeUpdate();
			conn.close();
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}
	}
	
	public static Member selectMember(String id){
		Member me=new Member();
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			PreparedStatement pstmt = conn.prepareStatement(
					"select * from member where email=?");
			
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			int mid=rs.getInt("memberid");
			String name = rs.getString("name");
			String password = rs.getString("password");
			String address = rs.getString("address");
			String email = rs.getString("email");
			String contact = rs.getString("contact");
			
			
			me.setMemberid(mid);
			me.setName(name);
			me.setAddress(address);
			me.setPassword(password);
			me.setEmail(email);
			me.setContact(contact);
			
			conn.close();
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}return me;
	}
	public static void updateMember(String id, String name, String password, String address, String email, String contact){
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
			
			PreparedStatement pstmt = conn.prepareStatement(
					"update member set name=?, password=?, address=?, email=?, contact=? where memberid=?");
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, address);
			pstmt.setString(4, email);
			pstmt.setString(5, contact);
			pstmt.setString(6, id);

			//execute statement
			pstmt.executeUpdate();

			
			conn.close();
			
			
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}
			
	
	}
	public static String[] getGenre(){
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
			PreparedStatement pstmt=conn.prepareStatement("Select * from genre ");
			//execute statement
			ResultSet rs= pstmt.executeQuery();
			rs.last();
			String[] Genre=new String[rs.getRow()];
			rs.beforeFirst();
			int i=0;
			while(rs.next()){
				Genre[i]=rs.getString("genre");
				i++;
			}
			
			conn.close();
			
			return Genre;	
		}catch(Exception ex){
			System.err.println(ex.getMessage());
		}return null;

	}
	public static ArrayList<Game> getQuantity(String qty){
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
			PreparedStatement pstmt=conn.prepareStatement("Select GameTitle, Price, Quantity from game where Quantity<?");
			pstmt.setString(1, qty);
			//execute statement
			ResultSet rs= pstmt.executeQuery();
			//create game objects and store them in an array
			ArrayList<Game> games =new ArrayList<Game>();
			
			while (rs.next()){
				Game game = new Game();
				game.setGameTitle(rs.getString("GameTitle"));
				game.setPrice(rs.getDouble("Price"));
				game.setQuantity(rs.getInt("Quantity"));
				games.add(game);
			}
			
			conn.close();
			
			return games;
		}catch(Exception ex){
			System.err.println(ex.getMessage());
			return null;
		}
	}
	public static ArrayList<History> getHistory(int id){
		try{
			//connect to database
			Connection conn =DBConn.getConnection();
			//prepare sql statement
			
			PreparedStatement pstmt=conn.prepareStatement("Select * from history where memberID=?");
			pstmt.setInt(1, id);
			//execute statement
			ResultSet rs= pstmt.executeQuery();
			//create objects and store them in an array
			ArrayList<History> histories=new ArrayList<History>();
			while(rs.next()){
				History history=new History();
				history.setTransactionid(rs.getInt("transactionID"));
				history.setMemberid(rs.getString("memberID"));
				history.setGameTitle(rs.getString("gameTitle"));
				history.setQuantity(rs.getInt("quantity"));
				history.setDate(rs.getString("date"));
				history.setPrice(rs.getDouble("price"));
				histories.add(history);
			}
			
			conn.close();
			
			return histories;
		}catch(Exception ex){
			System.err.println(ex.getMessage());
			return null;
	}
	}
}
