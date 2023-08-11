import java.sql.*;

class connectivity{
	public static void main(String args[])
	{
	
	  try{
		System.out.println("welcome....");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
		Statement stmt = con.createStatement();
		System.out.println("connected.....");
		ResultSet rs = stmt.executeQuery("Select * from stud");
		while(rs.next())	
		{
			System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getInt(4));
		}
		
		String sql = "insert into stud (Rollno,Name,Branch,Percent) values (8,'Anmol','prod',55)";
		stmt.executeUpdate(sql);
		
		con.close();
		System.out.println("Exit...");
		}catch(Exception e)
		{
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
	}
}