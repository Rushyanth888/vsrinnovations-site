<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/test";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String t0=request.getParameter("id");
String t1=request.getParameter("f_name");
String t2 = request.getParameter("s_name");
String  t3 =request.getParameter("Tours");
String t4=request.getParameter("gender");
String t5 = request.getParameter("Age");
if(t0 != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(t0);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update tourism.tourdetails set id=?,f_name=?,s_name=?,tour_details=?,gender=?, Age=? where id="+t0;
ps = con.prepareStatement(sql);
ps.setString(1,t0);
ps.setString(2,t1);
ps.setString(3,t2);
ps.setString(4,t3);
ps.setString(5,t4);
ps.setString(6,t5);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Updated</title>
    <style media="screen">
      .navbar{
        width:100%;
        height: 40px;
        background-color: black;
        color: white;
        font-size: 20px;
        font-family: monospace;
        position: fixed;
        top:0px;
        left:0px;

      }
      .navbar a{
        text-decoration: none;
        padding: 10px;
        margin: 50px;
        color: white;
        font-size: 20px;


      }
      .navbar a:hover{
        background-color: white;
        color:black;

      }
      h1{
        color:red;
        text-align: center;
        font-family: monospace;
        font-size: 60px;
        margin: 25%;
      }
    </style>
  </head>
  <body>
    <div class="navbar">
      <a href="sample.html">Add data</a>
      <a href="show.jsp">My orders</a>
      <a href="editing.jsp">Edit data</a>
      <a href="index.html">Logout</a>

    </div>

    <h1>Data Updated</h1>

  </body>
</html>
