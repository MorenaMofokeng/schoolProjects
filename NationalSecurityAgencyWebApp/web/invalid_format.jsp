<%-- 
    Document   : invalid_format
    Created on : 11 Aug 2025, 12:40:29 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid Format Page</title>
    </head>
    <body>
        <h1>Invalid Format</h1>
        <%
            String computerName = pageContext.getServletContext().getInitParameter("computerName");
        
        %>
        <p>
         <%=computerName%> says the Agent ID you have entered is invalid. Please enter valid credentials.
        </p>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="get_details.jsp">Back</a></li>
        </ul>
    </body>
</html>
