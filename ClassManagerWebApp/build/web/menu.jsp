<%-- 
    Document   : menu
    Created on : 17 Jun 2025, 5:24:50 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Page</title>
    </head>
    <body>
        <h1>Menu</h1>
        <%
            String computerName = (String)application.getInitParameter("computerName");
            String userName = (String)session.getAttribute("userName");
        %>
        
        <p>
            Hey <b><%=userName%></b>, <%=computerName%> here. Please select one of the following options:
        </p>
        <ol>
            <li><a href="addStudent.html">Add a Student</a></li>
            <li><a href="findStudent.html">Find a student</a></li>
            <li><a href="removeStudent.html">Remove a student</a></li>
            <li><a href="editStudent.html">Edit a student</a></li>
            <li><a href="GetAllStudentsServlet.do">View All students</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ol>
    </body>
</html>
