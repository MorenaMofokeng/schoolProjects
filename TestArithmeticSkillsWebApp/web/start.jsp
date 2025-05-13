<%-- 
    Document   : start
    Created on : 08 Apr 2025, 8:33:08 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Page</title>
    </head>
    <body>
        <h1>Start</h1>
        <%
            String compName = application.getInitParameter("comp_name");
        %>
        <p>
            Hi. My name is <b><%=compName%></b>. Please enter your name below. 
        </p>
        <form action="StartSessionServlet.do" method="POST">
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
