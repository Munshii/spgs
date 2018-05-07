package model;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://jws-app-mysql:3306/assignment?user=user&password=password";		
		return DriverManager.getConnection(connURL);
	}
}
