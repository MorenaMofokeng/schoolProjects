<%-- 
    Document   : menu
    Created on : 13 Aug 2025, 6:38:43 PM
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
            String computerName = pageContext.getServletContext().getInitParameter("computerName");
            String name = (String) session.getAttribute("name");
        %>
        <p>
            Hey <b><%=name%></b>, <%=computerName%> here, Please select one of the following options
        </p>
        <ul>
            <li><a href="enter_message.jsp">Enter a message</a></li>
            <li><a href="ViewAllMsgsServlet.do">View All Messages</a></li>
            <li><a href="ViewLongestMsgServlet.do">View the longest message</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
