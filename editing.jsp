<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
  <head>
    <style media="screen">

    h1{
      font-family: cursive;
      font-size: 30px;
      padding-top: 45px;
      padding-left:45%;
    }
    body{
      margin:250px;
    }
      table{
        font-size: 20px;
        font-family: monospace;
        text-align: center;
        padding: 20px;
        margin: 20px;
      }
      td{
        padding: 20px;
        margin: 10px;
      }
      #ab{
        color:red;
        margin: 10px;
      }
      table a:hover{
        background-color: black;
        color: white;
      }

      .navbar a{
        font-size: 20px;
        font-family: monospace;
        text-align: center;
        padding: 20px;
        margin-top: 20px;
        text-decoration: none;
        color: white;

      }
      table a{
        font-size: 20px;
        font-family: monospace;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: black;
      }
      #customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}
      a:hover{
        background-color: black;
        color: white;
      }
      .navbar{

        padding-left: 60%;
        top: 0px;
        left: 0px;
        background-color: green;
        width: 100%;
        position: fixed;
        height: 42px;
      }

      #customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}


    </style>
  </head>
<body>
  <div class="navbar">

    <a href="show.jsp">Go back to My orders</a>
    <a href="sample.html">Adding data</a>
    <a href="index.html">Logout</a>

  </div>


<h1>My orders</h1>


<table  id="customers" border="0">
<tr>
<th>id</th>
<th>first name</th>
<th>last name</th>
<th>Tour package</th>
<th>Gender</th>
<th>Age</th>
<th>Update</th>
<th>Delete</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from tourism.tourdetails";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr id="ab">
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("f_name") %></td>
<td><%=resultSet.getString("s_name") %></td>
<td><%=resultSet.getString("tour_details") %></td>
<td><%=resultSet.getString("Gender") %></td>
<td><%=resultSet.getString("Age") %></td>
<td><a href="update.jsp?id=<%=resultSet.getString("id")%>">update</a></td>
<td><a href="del.jsp?id=<%=resultSet.getString("id")%>">Deldata</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
