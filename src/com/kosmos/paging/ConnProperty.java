package com.kosmos.paging;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class ConnProperty {

	public static final String KOS_URL = "jdbc:oracle:thin:@localhost:1521:orclKOSMO00";
	public static final String KOS_USER = "scott";
	public static final String KOS_PASS = "tiger";	
	public static final String KOS_DRIVER = "oracle.jdbc.driver.OracleDriver";
		
	public static Connection getConnection() {		
		
		Connection conn = null;
		
		try {
			Class.forName(ConnProperty.KOS_DRIVER);
			conn = DriverManager.getConnection( ConnProperty.KOS_URL
					                           ,ConnProperty.KOS_USER
					                           ,ConnProperty.KOS_PASS);
		}catch(Exception c) {
			System.out.println("드라이버 찾기에 문제가 발생 >>> : " + c);
		}	
				
		return conn;
	}
	
	public static void conClose( Connection conn
					            ,PreparedStatement pstmt 
					            ,ResultSet rsRs) {
		try{
			if (rsRs != null) try { rsRs.close(); rsRs = null; } catch(Exception ex){}
			if (pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex){}
			if (conn != null) try { conn.close(); conn = null; } catch(Exception ex){}
		}
		catch (Exception e2){}			
	}
	
	public static void conClose(Connection conn, PreparedStatement pstmt) {
		try{
			if (pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex){}
			if (conn != null) try { conn.close(); conn = null; } catch(Exception ex){}
		}
		catch (Exception e2){}			
	}	
	
}//end of ConnProperty
