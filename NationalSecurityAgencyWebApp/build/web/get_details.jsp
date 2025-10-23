<%-- 
    Document   : get_details
    Created on : 10 Aug 2025, 12:48:04 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Get Details Page</title>
    </head>
    <body>
        <h1>Get Details</h1>
        <%
            String computerName = pageContext.getServletContext().getInitParameter("computerName");
        %>
        <p>
            Hey, I am <b><%=computerName%></b>, Please enter your details below:
        </p>
        <form action="StartSessionServlet.do" method="POST">
            <table>
                <tr>
                    <td>Agent ID:</td>
                    <td><input type="number" name="agentId" maxlength="3" required=""/></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="username" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="START"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
