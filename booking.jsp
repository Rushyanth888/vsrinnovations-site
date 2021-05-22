<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Booking</title>
    <link rel="stylesheet" href="master.css">
  </head>
  <body>

    <%@page import="java.sql.*" %>

       <%
  System.out.println("injsp");
  Class.forName("com.mysql.jdbc.Driver");

     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
System.out.println("connection established");

    String t0=request.getParameter("id");
    String t1=request.getParameter("f_name");
    String t2 = request.getParameter("s_name");
    String  t3 =request.getParameter("Tours");
		String t4=request.getParameter("gender");
    String t5 = request.getParameter("Age");





      String query ="insert into tourism.tourdetails values (?,?,?,?,?,?)";
      PreparedStatement ps=con.prepareStatement(query);

      ps.setString(1, t0);
      System.out.println("id entered");
      ps.setString(2, t1);
      System.out.println("f_name entered");
      ps.setString(3, t2);
        System.out.println("s_name entered");
      ps.setString(4, t3);
				System.out.println("touring_pack entered");
			ps.setString(5, t4);
      	System.out.println("gender entered");
      ps.setString(6, t5);
			System.out.println("age entered");

      int nub=ps.executeUpdate();

      System.out.println("updated");

      ps.close();



   con.close();


    %>
		<center>

<div class="last">
	<h1>inserted</h1>

<a href="sample.html">Add Data</a>
<a href="editing.jsp">Edit Data</a>

</div>
</center>


    </form>

  </body>
</html>
