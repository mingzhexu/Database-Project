package dal;
import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;


public class AppointmentDao {
	protected ConnectionManager connectionManager;
	
	// Single pattern: instantiation is limited to one object.
	private static AppointmentDao instance = null;
	protected AppointmentDao() {
		connectionManager = new ConnectionManager();
	}
	public static AppointmentDao getInstance() {
		if(instance == null) {
			instance = new AppointmentDao();
		}
		return instance;
	}
	
	public Appointment create(Appointment appointment) throws SQLException {
		String insertAppointment = 
				"INSERT INTO Appointment "
				+ "(storeId, Date, Duration, CustomerId, BarberId, Style, Price)"
				+ " VALUES (?,?,?,?,?,?,?);";
		Connection connection = null;
		PreparedStatement insertStmt = null;
		ResultSet resultKey = null;
		try{
			connection = connectionManager.getConnection();
			insertStmt = connection.prepareStatement(insertAppointment, Statement.RETURN_GENERATED_KEYS);
			insertStmt.setInt(1, appointment.getStoreId());
			insertStmt.setTimestamp(2, new Timestamp(appointment.getDate().getTime()));
			insertStmt.setInt(3, appointment.getDuration());
			insertStmt.setInt(4, appointment.getCustomerId());
			insertStmt.setInt(5, appointment.getBarberId());
			insertStmt.setString(6, appointment.getStyle());
			insertStmt.setDouble(7, appointment.getPrice());

			insertStmt.executeUpdate();
			
			// Retrieve the auto-generated key and set it, so it can be used by the caller.
			resultKey = insertStmt.getGeneratedKeys();
			int appointmentId = -1;
			if(resultKey.next()) {
				appointmentId = resultKey.getInt(1);
			} else {
				throw new SQLException("Unable to retrieve auto-generated key.");
			}
			appointment.setAppointmentId(appointmentId);
			return appointment;
			
		}catch (SQLException e) {
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
	
	public List<Appointment> getAppointmentsFromCustomerId(int CustomerID) throws SQLException{
		List<Appointment> appointments = new ArrayList<Appointment>();
		String selectAppointmentsbyCustomerID = 
				
				"SELECT StoreId,Date,Duration,CustomerId, BarberId,Style,Price "
				+ "FROM Appointment "
				+ "WHERE CustomerId = ?";
		Connection connection = null;
		PreparedStatement selectStmt = null;
		ResultSet results = null;
		try {
			connection = connectionManager.getConnection();
			selectStmt = connection.prepareStatement(selectAppointmentsbyCustomerID);
			selectStmt.setInt(1, CustomerID);
			results = selectStmt.executeQuery();
			
			while(results.next()) {
				int custId = results.getInt("CustomerId");
				int storeid = results.getInt("StoreId");
				Date date = results.getDate("Date");
				int duration = results.getInt("Duration");
				int bId = results.getInt("BarberId");
				String style = results.getString("Style");
				int price = results.getInt("Price");
				Appointment appoint = 
						new Appointment(storeid, date, duration, custId, bId, style, price);
				appointments.add(appoint);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if(connection != null) {
				connection.close();
			}
			if(selectStmt != null) {
				selectStmt.close();
			}
			if(results != null) {
				results.close();
			}
		}
		
		return appointments;
	}
	
    public Appointment delete(Appointment appointment) throws SQLException {
		
		String deleteAppointment = "DELETE FROM Appointment WHERE AppointmentId = ?;";
		Connection connection = null;
		PreparedStatement deleteStmt = null;
		
		try {
			connection = connectionManager.getConnection();
			deleteStmt = connection.prepareStatement(deleteAppointment);
			deleteStmt.setLong(1, appointment.getAppointmentId());
			deleteStmt.executeUpdate();
			
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
		
		return null;
	}

}
