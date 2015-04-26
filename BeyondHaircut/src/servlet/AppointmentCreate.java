package servlet;
import dal.*;
import model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/appointmentcreate")
public class AppointmentCreate extends HttpServlet{
	
	protected AppointmentDao appointmentDao;
	protected BarberDao barderDao;
	protected CustomerDao customerDao;

	@Override
	public void init() throws ServletException {
		appointmentDao = AppointmentDao.getInstance();
		barderDao = BarberDao.getInstance();
		customerDao = CustomerDao.getInstance();
		
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Map for storing messages.
		Map<String, String> messages = new HashMap<String, String>();
		req.setAttribute("messages", messages);
		//Just render the JSP.   
		req.getRequestDispatcher("/AppointmentCreate.jsp").forward(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Map for storing messages.
		Map<String, String> messages = new HashMap<String, String>();
		req.setAttribute("messages", messages);
		
		// Retrieve and validate name.
		String customerId = req.getParameter("customerid");
		if (customerId == null || customerId.trim().isEmpty()) {
			messages.put("success", "Invalid CustomerId");
		} else {
			// Create the Appointment
			String customerid = req.getParameter("customerid");
			String barberid = req.getParameter("barberId");
			String date = req.getParameter("date");
			String duration = req.getParameter("duration");
			String storeid = req.getParameter("storeId");
			String style = req.getParameter("style");
			String price = req.getParameter("price");
			DateFormat format = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH);
			Date datetime;
			
			try {
				datetime = format.parse(date);
				Appointment appointment = 
						new Appointment(Integer.parseInt(storeid), datetime, 
						Integer.parseInt(duration), 
						Integer.parseInt(customerid), 
						Integer.parseInt(barberid),
						style,
						Integer.parseInt(price));
				appointment = appointmentDao.create(appointment);
				messages.put("success", "Successfully created a comment for barber No." + barberid);
			} catch (SQLException | ParseException e) {
				e.printStackTrace();
				throw new IOException(e);
			}
		}

		req.getRequestDispatcher("/AppointmentCreate.jsp").forward(req, resp);
	}
}
