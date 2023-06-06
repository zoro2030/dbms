

import java.sql.*;

class Prog{
	public static void main(String args[])
	{
	
  try{
	System.out.println("welcome....");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stud","root","root"); 
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("Select * from stud");

	while(rs.next())	
	{
		System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getInt(4));
	}
String sql = "insert into stud (Rollno,Name,Branch,Percent) values (8,'Anmol','prod',55)";
int rows = stmt.executeUpdate(sql);
System.out.println(rows);
con.close();

}catch(Exception e)
{
e.printStackTrace();
//System.out.println(e.getMessage());
}
}
}