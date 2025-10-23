<%-- 
    Document   : advise
    Created on : 14 Jun 2025, 12:53:57 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advise Page</title>
    </head>
    <body>
        <h1>Advise</h1>
        <%
            String compName = pageContext.getServletContext().getInitParameter("computer_name");
            String userName = (String)session.getAttribute("name");
            String message = (String)session.getAttribute("message");
            String title = (String)session.getAttribute("title");

        %>
        <p>
            <b><%=title%> <%=userName%></b>, <b><%=compName%></b> says <b><%=message%></b>
        </p>
        <p>
            Click <a href="EndServlet.do">here</a> to end the session.
        </p>
    </body>
</html>
