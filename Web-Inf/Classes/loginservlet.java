import java.sql.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class loginservlet extends HttpServlet {
	/**
	 *
	 */

	private static final long serialVersionUID = 1L;
	public Connection con = null;
	public Statement st = null;



public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
PrintWriter out=res.getWriter();
try{
Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
st=con.createStatement();
System.out.println("in service");
		String t1=req.getParameter("id");
		String t2 = req.getParameter("pass");


		PreparedStatement Stmt=con.prepareStatement("SELECT * from tourism.logindata");
		out.println("Statement loaded sucessfuly");
		Stmt.executeQuery();
		ResultSet rs=Stmt.getResultSet();
		out.println("query execute loaded sucessfully");
		String name= null;
		String password=null;
		while(rs.next())
		{
		name=rs.getString(1);
		password=rs.getString(2);
			if (t1.equals(name)&&t2.equals(password)) {
				res.sendRedirect("sample.html");
			}
		}

			out.print("<html><head>");
			out.print("<script type=\"text/javascript\">alert('user details not found');</script>");
			out.print("</head><body></body></html>");
			res.sendRedirect("error.html");


			// ps.close();
		//st.close();


   //con.close();





  }




    catch(SQLException e){
      out.println("SQLException caught: " + e.getMessage());
    }
    catch (Exception e){
      out.println(e);
    }
    }
    }
