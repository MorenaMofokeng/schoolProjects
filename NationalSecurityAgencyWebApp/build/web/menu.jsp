<%-- 
    Document   : menu
    Created on : 10 Aug 2025, 1:08:52 AM
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
            String username = (String)session.getAttribute("username");
            String computerName = pageContext.getServletContext().getInitParameter("computerName");
        %>
        <p>
            Hey <b><%=username%></b>, <%=computerName%> here. Please select one of the following options:
        </p>
        <ul>
            <li><a href="enter_message.jsp">Enter a message</a></li>
            <li><a href="ViewAllServlet.do">View all Messages, Decrypted</a></li>
            <li><a href="ViewLongestMessageServlet.do">View Longest Message Received.</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
