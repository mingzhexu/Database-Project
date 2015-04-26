package dal;

import model.*;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;


/**
* Data access object (DAO) class to interact with the underlying Persons table in your MySQL
* instance. This is used to store {@link Persons} into your MySQL instance and retrieve 
* {@link Persons} from MySQL instance.
*/
public class HairstyleDao {
	protected ConnectionManager connectionManager;
	
	// Single pattern: instantiation is limited to one object.
	private static HairstyleDao instance = null;
	protected HairstyleDao() {
		connectionManager = new ConnectionManager();
	}
	public static HairstyleDao getInstance() {
		if(instance == null) {
			instance = new HairstyleDao();
		}
		return instance;
	}

	/**
	 * Save the Persons instance by storing it in your MySQL instance.
	 * This runs a INSERT statement.
	 */
	public Hairstyle create(Hairstyle hairstyle) throws SQLException {
		String insertHairstyle = "INSERT INTO Hairstyle(Style,Gender,Picture,Instance,Price) VALUES(?,?,?,?,?);";
		Connection connection = null;
		PreparedStatement insertStmt = null;
		try {
			connection = connectionManager.getConnection();
			insertStmt = connection.prepareStatement(insertHairstyle);
			insertStmt.setString(1, hairstyle.getStyle());
			insertStmt.setString(2, hairstyle.getGender());
			insertStmt.setNull(3, Types.BLOB);
			insertStmt.setNull(4, Types.BLOB);
			insertStmt.setInt(5, hairstyle.getPrice());


			insertStmt.executeUpdate();
			
			return hairstyle;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(connection != null) {
				connection.close();
			}
			if(insertStmt != null) {
				insertStmt.close();
			}
		}
	}



	/**
	 * Delete the Persons instance.
	 * This runs a DELETE statement.
	 */
	public Hairstyle delete(Hairstyle hairstyle) throws SQLException {
		String deleteHairstyle = "DELETE FROM Items WHERE Name=?;";
		Connection connection = null;
		PreparedStatement deleteStmt = null;
		try {
			connection = connectionManager.getConnection();
			deleteStmt = connection.prepareStatement(deleteHairstyle);
			deleteStmt.setString(1, hairstyle.getStyle());
			deleteStmt.executeUpdate();

			// Return null so the caller can no longer operate on the Persons instance.
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(connection != null) {
				connection.close();
			}
			if(deleteStmt != null) {
				deleteStmt.close();
			}
		}
	}
}