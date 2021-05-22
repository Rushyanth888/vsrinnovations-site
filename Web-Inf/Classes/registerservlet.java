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


public class registerservlet extends HttpServlet {
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

		String query ="insert into tourism.logindata values(?,?)";

		PreparedStatement ps=con.prepareStatement(query);

		ps.setString(1, t1);
		System.out.println("userid entered");
		ps.setString(2, t2);
			System.out.println("password entered");
		int nub=ps.executeUpdate();
//con.commit();
		System.out.println("updated");
		res.sendRedirect("index.html");
		ps.close();
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
