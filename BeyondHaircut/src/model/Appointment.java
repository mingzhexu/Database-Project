package model;
import java.util.Date;

public class Appointment {
	protected int appointmentId;
	protected int storeId;
	protected Date Date;
	protected int Duration;
	protected int CustomerId;
	protected int BarberId;
	protected String Style;
	protected int Price;
	
	public Appointment 
	(int storeId, Date Date, int Duration,int CustomerId, int BarberId, 
	 String Style, int Price){
		this.storeId = storeId;
		this.Date = Date;
		this.Duration = Duration;
		this.CustomerId = CustomerId;
		this.BarberId = BarberId;
		this.Style = Style;
		this.Price = Price;
	}
	
	public int getAppointmentId(){
		return appointmentId;
	}
	public void setAppointmentId(int a){
		this.appointmentId = a;
	}
	
	public int getStoreId(){
		return storeId;
	}
	
	public void setStoreId(int s){
		this.storeId = s;
	}
	
	public Date getDate(){
		return Date;
	}
	
	public int getBarberId() {
		return BarberId;
	}


	public void setBarberId(int barberId) {
		BarberId = barberId;
	}


	public String getStyle() {
		return Style;
	}

	public void setStyle(String style) {
		Style = style;
	}


	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}


	public void setDate(Date d){
		this.Date = d;
	}
	public int getDuration(){
		return Duration;
	}
	public void setDuration(int d){
		this.Duration = d;
	}
	
	public int getCustomerId(){
		return CustomerId;
	}
	

}
