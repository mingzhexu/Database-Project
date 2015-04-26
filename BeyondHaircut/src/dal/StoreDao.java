package dal;

import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StoreDao {
protected ConnectionManager connectionManager;
	
	// Single pattern: instantiation is limited to one object.
	private static StoreDao instance = null;
	protected StoreDao() {
		connectionManager = new ConnectionManager();
	}
	public static StoreDao getInstance() {
		if(instance == null) {
			instance = new StoreDao();
		}
		return instance;
	}
	
	public Store create(Store store) throws SQLException {
		String insertStore = "INSERT INTO Store(AddressId,Phone) VALUES(?,?);";
		Connection connection = null;
		PreparedStatement insertStmt = null;
		ResultSet resultKey = null;
		try {
				connection = connectionManager.getConnection();
				insertStmt = connection.prepareStatement(insertStore,
	    				Statement.RETURN_GENERATED_KEYS);
				//insertStmt.setInt(1, store.getStoreId());
				insertStmt.setInt(1, store.getAddressId());
				insertStmt.setString(2, store.getPhone());
				insertStmt.executeUpdate();
				// Retrieve the auto-generated key and set it, so it can be used by the caller.
				// For more details, see:
				// http://dev.mysql.com/doc/connector-j/en/connector-j-usagenotes-last-insert-id.html
				resultKey = insertStmt.getGeneratedKeys();
				int storeId = -1;
				if(resultKey.next()) {
					storeId = resultKey.getInt(1);
				} else {
					throw new SQLException("Unable to retrieve auto-generated key.");
				}
				store.setStoreId(storeId);
				return store;
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
			if(resultKey != null) {
				resultKey.close();
			}
		}
	}
	
	public Store delete(Store store) throws SQLException {
		String deleteStore = "DELETE FROM Store WHERE StoreId=?;";
		Connection connection = null;
		PreparedStatement deleteStmt = null;
		try {
			connection = connectionManager.getConnection();
			deleteStmt = connection.prepareStatement(deleteStore);
			deleteStmt.setInt(1, store.getStoreId());
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
