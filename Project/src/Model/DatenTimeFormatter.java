package Model;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
public class DatenTimeFormatter {

	private String date;
	DateTimeFormatter myFormatObj;
	private String time;
	 
	public void setDate(LocalDate myDateObj)
	{ 
	    myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
	    date = myDateObj.format(myFormatObj);
	}
	
	public String getDate()
	{
		   return date;
	}
	public void setTime(LocalTime myDateObj)
	{
		myFormatObj = DateTimeFormatter.ofPattern("HH:mm:ss");  
	    time = myDateObj.format(myFormatObj);
	}
	public String getTime()
	{
		return time;
	}
	     
}
