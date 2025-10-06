package com.srm.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.srm.hms.model.Users;
import com.srm.hms.util.JdbcUtils;





public class LoginDao {
	public boolean validate(Users user) throws ClassNotFoundException {
		boolean status = false;
 
		try (Connection connection = JdbcUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where user_email = ? and user_password = ? ;")) {
			preparedStatement.setString(1, user.getUser_email());
			preparedStatement.setString(2, user.getUser_password());
 
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
 
		} catch (SQLException e) {
			// process sql exception
			JdbcUtils.printSQLException(e);
		}
		return status;
	}
	
	public String getRole(Users user) {
		String role=null;
		try (Connection connection = JdbcUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select user_role from users where user_email=? and user_password=?;")) {
			preparedStatement.setString(1, user.getUser_email());
			preparedStatement.setString(2, user.getUser_password());
			ResultSet rs = preparedStatement.executeQuery();
			while( rs.next()) {
				role = rs.getString(1);
				System.out.println(role);
				return role;
			}
		} catch (SQLException e) {
			// process sql exception
			JdbcUtils.printSQLException(e);
		}
		return role;
	}
	
	public Users getUserByEmail(String email) throws SQLException {
		String SELECT_BY_EMAIL="select * from users where user_email=?;";
		Users user = null;
		Connection conn  = null;
		PreparedStatement pstmt = null;
		try{
			conn = JdbcUtils.getConnection();
			pstmt = conn.prepareStatement(SELECT_BY_EMAIL);
			pstmt.setString(1, email);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int id =  rs.getInt("user_id");
				String first_name = rs.getString("user_first_name");
				String last_name = rs.getString("user_last_name");
				String role = rs.getString("user_role");
				String uemail = rs.getString("user_email");
				String password = rs.getString("user_password");
				String mobile = rs.getString("user_mobile_number");
				user =  new Users(id,first_name,last_name,role,uemail,password,mobile);
			}
		}catch(SQLException exception){
			JdbcUtils.printSQLException(exception);
		}finally{
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return user;
	}

}
