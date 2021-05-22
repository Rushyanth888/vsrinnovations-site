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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from tourism.tourdetails where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){

%>
<!DOCTYPE html>
<html><style media="screen">
  body{text-align:center;
  font-family:monospace;
font-size:20px;}
  input{font-family:monospace;
font-size:20px;
color:red;}
h2{
  color:red;
}
</style>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input type="text" name="id" value="<%=resultSet.getString("id") %>">
<br>
First name:<br>
<input type="text" name="f_name" value="<%=resultSet.getString("f_name") %>">
<br>
Last_name:<br>
<input type="text" name="s_name" value="<%=resultSet.getString("s_name") %>">
<br>
Tour Details:<br>
<input type="text" name="tour_details" value="<%=resultSet.getString("tour_details") %>">
<br>
Gender:<br>
<input type="text" name="gender" value="<%=resultSet.getString("gender") %>">
<br><br>
Age:<br>
<input type="text" name="Age" value="<%=resultSet.getString("Age") %>">
<br><br>
<input type="submit" value="submit">
</form>
<h2>Note: the above database is going to update</h2>
<h2>Note: You cant change customer id</h2>
<a href="editing.jsp" >Go back to editing page</a>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
