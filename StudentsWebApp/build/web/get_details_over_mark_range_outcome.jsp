<%-- 
    Document   : get_passed_students_outcome
    Created on : 09 May 2025, 10:46:51 AM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.model.entity.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details of Students Over Mark Range Outcome Page</title>
    </head>
    <body>
        <h1>Details of Students Over Mark Range Outcome</h1>
        <%
            List<Student> students = (List<Student>)request.getAttribute("students");
            Integer cnt = students.size();
            Integer minMark = (Integer)request.getAttribute("minMark");
            Integer maxMark = (Integer)request.getAttribute("maxMark");
        %>
        <%
            if(cnt > 0){
        %>
        <p>
            There are <b><%=cnt%></b> in the mark range of <b><%=minMark%></b> and <b><%=maxMark%></b> 
            Below are their details:
        </p>
          <table border="1">
            <th>ID</th>
            <th>Name</th>
            <th>Birth Date</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Mark Obtained</th>
            <th>Creation Date</th>
         <%
            for(int i = 0; i<students.size(); i++){
                Student student = students.get(i);
                Long id = student.getId();
                String name = student.getName();
                
                Date dob = student.getDob();
                SimpleDateFormat date = new SimpleDateFormat("yyyy-mm-dd");
                String formattedDate = date.format(dob);
                
                Integer age = student.getAge();
                Character gender = student.getGender();
                Integer markObtained = student.getMarkObtained();
                Date creationDate = student.getCreationDate();
                %>
            <tr>
                    <td><%=id%></td>
                    <td><%=name%></td>
                    <td><%=formattedDate%></td>
                    <td><%=age%></td>
                    <td><%=gender%></td>
                    <td><%=markObtained%></td>
                    <td><%=creationDate%></td>
                </tr>
         <%
             }
        %>
        </table>
         <%
             }
            else
                {
        %>
        <p>
            There are no students in the mark range of <b><%=minMark%></b> and <b><%=maxMark%></b> .
        </p>
         <%
             }
        %>
            <ul>
                <li><a href="menu.html">Menu</a></li>
                <li><a href="index.html">Home</a></li>
            </ul>
    </body>
</html>
