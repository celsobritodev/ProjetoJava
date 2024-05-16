package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseDAO {
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/aulajava";
	public static final String USER_LOGIN = "root";
	public static final String USER_PASSWD = "admin";
	public Connection conn;
	
	public DataBaseDAO() throws Exception {
		Class.forName(DRIVER); // força o carregamento do driver
	}
	
	public void conectar() throws Exception {
		conn = DriverManager.getConnection(URL, USER_LOGIN, USER_PASSWD);
	}
	
	public void desconectar() throws Exception {
		conn.close();
	}


}
