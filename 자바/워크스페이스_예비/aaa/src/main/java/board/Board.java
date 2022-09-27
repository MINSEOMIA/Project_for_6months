package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.Member;
import member.MysqlConnect;

public class Dao {

	private MysqlConnect dbconn;

	public Dao() {
		dbconn = MysqlConnect.getInstance();
	}

	public void insert(Board b) {
		Connection conn = dbconn.getConn();
		String sql = "insert into board(writer,title,w_date,content) values(?,?,now(),?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getWriter());
			pstmt.setString(2, m.getContent());
			pstmt.setString(3, m.getTitle());
			pstmt.setString(4, m.getDate());

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
	
	public ArrayList<Board> selectAll() {
		ArrayList<Board> list = new ArrayList<Board>();
		ResultSet rs = null;
		Connection conn = dbconn.getConn();
		String sql = "select * from board order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();// 검색한 결과를 ResultSet으로 반환
			while (rs.next()) {
				list.add(new Board(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getDate(4))
			}
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