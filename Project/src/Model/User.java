package Model;

public class User 
{
	private String name;
	private String username;
	private String email;
	private String password;
	private String status;
	private String Currentstatus;
	private String phone;
	private String company_name;
	
	public String getName() 
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getCompany() 
	{
		return company_name;
	}
	public void setCompany(String company_name) 
	{
		this.company_name = company_name;
	}
	
	public String getUsername() 
	{
		return username;
	}
	
	public void setUsername(String username) 
	{
		this.username = username;
	}
	
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getPassword() 
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public String getStatus() 
	{
		return status;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	
	public String getCurrentStatus() 
	{
		return Currentstatus;
	}
	public void setCurrentStatus(String Currentstatus)
	{
		this.Currentstatus = Currentstatus;
	}
	
	public String getPhone() 
	{
		return phone;
	}
	public void setPhone(String phone) 
	{
		this.phone = phone;
	}

}
