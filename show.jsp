<html>
    <head>
    <title>my sql Sample</title>
    <style media="screen">
    body{
      text-align: center;
      font-weight: bold;
      font-style: oblique;
      margin-left: 30%;
      margin-top: 20%;
      background-image: url("tn.jpg");
    }

    .red{
      border: 3px solid black;
      font-size: 20px;
      padding: 10px;
      font-family: monospace;
      font-weight: lighter;
      color: white;
    }
    td{
      padding: 20px;
    }
    #ab{
      color:red;
      margin: 10px;
    }
    .navbar{
      padding-left: 25%;
      width:100%;
      height:40px;
      background-color: black;
      position: fixed;
      top:0px;
      left:0px;
    }
    .navbar a{
      font-size: 20px;
      font-family: monospace;
      padding: 12px;
      text-decoration: none;
      color:white;
    }
    .navbar a:hover{
      background-color: white;
      color:black;

    }
    table{
      background-color: rgba(1, 1, 0, 1);
      font-weight: bolder;
    }
    </style>

    </head>
    <body>

      <div class="navbar">
        <a href="sample.html">Add Data</a>
        <a href="editing.jsp">Edit Data</a>

      </div>

    <%@page import="java.sql.*" %>

       <%
	System.out.println("injsp");
	Class.forName("com.mysql.jdbc.Driver");

      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
System.out.println("connection established");
    PreparedStatement Stmt=con.prepareStatement("SELECT * from tourism.tourdetails");
    Stmt.executeQuery();
    ResultSet rs=Stmt.getResultSet();
    String id =null;
    String fname= null;
String sname=null;
String tour= null;
String Gender=null;
String age= null;
	%>
  <h1>Tourist data In Local Database</h1>
<table border='0' class="red">
  <tr id="ab">
    <td>ID</td>
    <td>First Name</td>
    <td>Second Name</td>
    <td>Tour Package</td>
    <td>Gender</td>
    <td>Age</td>
  </tr>
<%
while(rs.next())
    {
id=rs.getString(1);
fname=rs.getString(2);
sname=rs.getString(3);
tour=rs.getString(4);
Gender=rs.getString(5);
age=rs.getString(6);
%>

<tr id="box">
  <td><%=id%></td>
<td><%=fname %></td>
<td><%=sname %></td>
<td><%=tour %></td>
<td><%=Gender %></td>
<td><%=age %></td>
</tr>


  <%  }

    rs.close();Stmt.close();con.close();

    %>
</table>

    </body>
    </html>
