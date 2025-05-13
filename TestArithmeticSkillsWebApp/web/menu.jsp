<%-- 
    Document   : menu
    Created on : 08 Apr 2025, 9:03:02 PM
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
            String compName = application.getInitParameter("comp_name");
            String name = (String)session.getAttribute("name");
            String sessionID = session.getId();
        %>
        <p>
            [Session ID: <b><%=sessionID%></b>]
        </p>
        <p>
            Hi <b><%=name%></b>. It's <b><%=compName%></b> here.
            Please select one of the following options:
        </p>
        <ul>
            <li><a href="test_addition_skills.jsp">Test your addition skills.</a></li>
            <li><a href="test_multiplication_skills.jsp">Test your multiplication skills.</a></li>
     
        </ul>
    </body>
</html>
