<%-- 
    Document   : studentcheck
    Created on : 30 Apr, 2015, 2:58:55 PM
    Author     : AmanDhiman
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <div>
	<h1  > <img src="thapar.jpg" style="float:left;margin-top:3px; margin-left:30px; width:100px;height:120px;border: 3px solid #000; box-shadow: 0 0 40px #fff;">Online Attendance Management System</h1>
</div>
        <%
            String Name="";
           String u="";
           String p="";
//           String s=request.getParameter("select");
    String userid = request.getParameter("id");    
    String pwd = request.getParameter("password");
    out.println("MyDerby Connect Example.<br/>");
  Connection conn = null;
  String url = "jdbc:derby://localhost:1527/";
  String dbName = "OAMS";
  String driver = "org.apache.derby.jdbc.ClientDriver";
  String userName = "oams"; 
  String password = "oams";
//  if(s=="Faculty")
  try {
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url+dbName,userName,password);
        System.out.println("Connected to the database");
        Statement s = conn.createStatement();
        ResultSet rs;
        rs = s.executeQuery("select * from student where rollno='" + userid + "' and password='" + pwd + "'");
        while(rs.next())
        {
            u=rs.getString(1);
            p=rs.getString(2);
            Name=rs.getString(3);
            out.println("</h1>");
        }
        if(p.equals(pwd) && u.equals(userid))
        {
            session.setAttribute("Name", userid);
            response.sendRedirect("student.jsp");
        }
        out.println("Invalid password <a href='index.jsp'>try again</a>");
        conn.close();
        
        }
        catch (Exception e) 
        {
        e.getMessage();
        }      
     %>
    </body>
</html>
