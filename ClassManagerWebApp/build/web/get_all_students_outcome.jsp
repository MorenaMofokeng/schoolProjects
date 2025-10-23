<%-- 
    Document   : get_all_students_outcome
    Created on : 17 Jun 2025, 6:51:26 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Students Page</title>
    </head>
    <body>
        <h1>Class List</h1>
        <%
            List<Student> students = (List<Student>)request.getAttribute("students");
            
        %>
        <table border="1">
            <th>Name</th>
            <th>Age</th>
            <th>Student Number</th>
        <%
            for(int i = 0; i < students.size() ; i++){
                Student student = students.get(i);
                String name = student.getName();
                Integer age = student.getAge();
                Long studID = student.getId();
         %>
            <tr>
                <td><%=name%></td>
                <td><%=age%></td>
                <td><%=studID%></td>
            </tr>
            <tr>
        <%
              }
        %>   
            </tr>
        </table>
        <ol>
            <li><a href="menu.jsp">Menu Page</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ol>
    </body>
</html>
