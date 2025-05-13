<%-- 
    Document   : test_addition_skills
    Created on : 08 Apr 2025, 9:11:26 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Addition Skills Page</title>
    </head>
    <body>
        <h1>Test Addition Skills</h1>
        <%
            String compName = application.getInitParameter("comp_name");
            String name = (String)session.getAttribute("name");
            String sessionID = session.getId();
        %>
         <p>
            [Session ID: <b><%=sessionID%></b>]
        </p
    </body>
</html>
