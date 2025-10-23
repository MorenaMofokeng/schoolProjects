<%-- 
    Document   : find_student_outcome
    Created on : 17 Jun 2025, 6:38:34 PM
    Author     : user
--%>

<%@page import="za.ac.tut.entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find Student Outcome Page</title>
    </head>
    <body>
        <h1>Find Student Outcome</h1>
        <%
            Student student = (Student)request.getAttribute("student");
            String name = student.getName();
            Integer age = student.getAge();
            Long studID= student.getId();
        %>
        <p>
            The student has been found. Below are the details of the student.
        </p>
        <table>
            <tr>
                <td><b>Name:</b></td>
                <td><%=name%></td>
            </tr>
            <tr>
                <td><b>Age:</b></td>
                <td><%=age%></td>
            </tr>
            <tr>
                <td><b>Student Number</b></td>
                <td><%=studID%></td>
            </tr>
        </table>
        <ol>
            <li><a href="menu.jsp">Menu Page</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ol>
    </body>
</html>
