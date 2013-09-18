package com.thefax.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.thefax.bean.LoginBean;
import com.thefax.bean.ProductBean;
import com.thefax.bean.UserBean;

public class ShoppingDao {
	private Connection newConnection() throws SQLException {
		/*ResourceBundle bundle = ResourceBundle.getBundle("dbinfo");
		try {
			// Alternative way to register driver (Reflection)
			Class.forName(bundle.getString("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn = DriverManager.getConnection(bundle.getString("url"),
				bundle.getString("user"), bundle.getString("pass"));*/
		
		try {
			//Context from javax.naming
			//Creates object of context
			Context initCtx = new InitialContext();
			//Gives you the environment context
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			// DataSource from javax.sql
			DataSource datasrc = (DataSource) envCtx.lookup("jdbc/myds");
			return datasrc.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public boolean persist(UserBean user) {
		String sql = "insert into users values (?,?,?,?,?,?,?)";
		Connection conn = null;

		try {
			conn = newConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, user.getUserid());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getPassword());
			stmt.setInt(4, user.getAge());
			stmt.setString(5, user.getCity());
			stmt.setString(6, user.getPhone());
			stmt.setString(7, user.getEmail());
			stmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	public boolean validate(LoginBean login) {
		String sql = "select * from users where userid=? and password=?";
		Connection conn = null;

		try {
			conn = newConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, login.getUserid());
			stmt.setString(2, login.getPassword());
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	public ArrayList<ProductBean> getCatalog() {
		String sql = "select * from products";
		Connection conn = null;
		ArrayList<ProductBean> catalog = null;

		try {
			conn = newConnection();
			ResultSet rs = conn.createStatement().executeQuery(sql);
			catalog = new ArrayList<ProductBean>();
			while (rs.next()) {
				ProductBean product = new ProductBean();
				product.setCode(rs.getInt(1));
				product.setDescription(rs.getString(2));
				product.setPrice(rs.getDouble(3));
				catalog.add(product);
			}
			return catalog;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	public ProductBean getProduct(String code) {
		String sql = "select * from products where code=" + code;
		Connection conn = null;

		try {
			conn = newConnection();
			ResultSet rs = conn.createStatement().executeQuery(sql);
			ProductBean product = null;
			if (rs.next()) {
				product = new ProductBean();
				product.setCode(rs.getInt(1));
				product.setDescription(rs.getString(2));
				product.setPrice(rs.getDouble(3));
			}
			return product;
		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
}
