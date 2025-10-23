<%-- 
    Document   : enter_message_outcome
    Created on : 13 Aug 2025, 7:02:46 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Message Outcome Page</title>
    </head>
    <body>
        <h1>Enter Message Outcome</h1>
        <%
            String name = (String)session.getAttribute("name");
        %>
        <p>
            <b><%=name%></b>, Your message has been successfully encrypted and saved!
        </p>
        <ul>
            <li><a href="enter_message.jsp">Enter message</a></li>
            <li><a href="menu.jsp">Menu</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
            <li></li>
        </ul>
    </body>
</html>
