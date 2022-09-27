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
		// 1. db����
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
		// db����
		Connection conn = dbconn.getConn();
		// sql �� �ۼ�
		String sql = "select * from product where num=?";

		try {
			// preparedstmt ��ü
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// ?��Ī
			pstmt.setInt(1, num);

			// sql ����
			rs = pstmt.executeQuery();// �˻��� ����� ResultSet���� ��ȯ

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

	// �̸�, ���ݼ���
	public void update(Product p) {// p:������ ��ǰ��ȣ, ���̸�, ������
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

	// ���� ����
	public void updateAmount(int num, int amount) {// amount:�߰��ɾ�. +�԰� / -���
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
