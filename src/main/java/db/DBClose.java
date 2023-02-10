package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBClose {

	
	public static void close(Connection conn, Statement psmt, ResultSet rs) {
		
		try {
			// 접속해제(서버는 계속 연결되어있으면 안돼)
			if(conn != null) { //db후처리
				conn.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
