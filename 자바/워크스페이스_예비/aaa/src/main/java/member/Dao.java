package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.MysqlConnect;

//public void insert(Member m):한줄추가
//public Member select(String id): id로 한개 검색
//public void update(Member m): id로 찾아서 pwd, email 변경
//public void delete(String id): id로 삭제

public class Dao {

	private MysqlConnect dbconn;

	public Dao() {
		dbconn = MysqlConnect.getInstance();
	}

	public void insert(Member m) {
		Connection conn = dbconn.getConn();
		String sql = "insert into member values(?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public Member select(String id) {
		Member m = null;
		ResultSet rs = null;
		Connection conn = dbconn.getConn();
		String sql = "select * from member where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();// 검색한 결과를 ResultSet으로 반환
			if (rs.next()) {
				m = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return m;
	}
	
	public void update(Member m) {
		Connection conn = dbconn.getConn();
		String sql = "update member set pwd=?, email=? where id=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, m.getPwd());			
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getId());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void delete(String id) {
		Connection conn = dbconn.getConn();
		String sql = "delete from member where id=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
