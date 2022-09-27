package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.MysqlConnect;

public class ProductDao {
	private MysqlConnect dbconn;

	public ProductDao() {
		dbconn = MysqlConnect.getInstance();
	}

	public void insert(Product p) {
		// 1. db연결
		Connection conn = dbconn.getConn();

		// 2. sql
		String sql = "insert into product(name, price, amount) values(?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getAmount());

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

	public Product selectByNum(int num) {
		Product p = null;
		ResultSet rs = null;
		// db연결
		Connection conn = dbconn.getConn();
		// sql 문 작성
		String sql = "select * from product where num=?";

		try {
			// preparedstmt 객체
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// ?매칭
			pstmt.setInt(1, num);

			// sql 실행
			rs = pstmt.executeQuery();// 검색한 결과를 ResultSet으로 반환

			if (rs.next()) {
				p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
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
		return p;
	}

	public ArrayList<Product> selectByName(String name) {
		ArrayList<Product> list = new ArrayList<Product>();
		ResultSet rs = null;
		Connection conn = dbconn.getConn();
		String sql = "select * from product where name=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
		return list;
	}

	public ArrayList<Product> selectAll() {
		ArrayList<Product> list = new ArrayList<Product>();
		ResultSet rs = null;
		Connection conn = dbconn.getConn();
		String sql = "select * from product order by num";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
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
		return list;
	}

	// 이름, 가격수정
	public void update(Product p) {// p:수정할 제품번호, 새이름, 새가격
		Connection conn = dbconn.getConn();
		String sql = "update product set name=?, price=? where num=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getNum());

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

	// 수량 수정
	public void updateAmount(int num, int amount) {// amount:추가될양. +입고 / -출고
		Connection conn = dbconn.getConn();
		String sql = "update product set amount=amount+? where num=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, amount);
			pstmt.setInt(2, num);

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

	public boolean delete(int num) {
		Connection conn = dbconn.getConn();
		String sql = "delete from product where num=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				return true;
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
		return false;
	}
}
