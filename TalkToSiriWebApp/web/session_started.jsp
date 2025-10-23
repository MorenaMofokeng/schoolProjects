<%-- 
    Document   : session_started
    Created on : 14 Jun 2025, 12:05:51 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Started Page</title>
    </head>
    <body>
        <h1>Session Started</h1>
        <%
            String compName = (String)pageContext.getServletContext().getInitParameter("computer_name");
            String userName = (String)session.getAttribute("name");
        %>
        <p>
            Hi <b><%=userName%></b>, I'm <b><%=compName%></b>.
        </p>
        <form action="GenderServlet.do" method="POST">
            <table>
                <tr>
                    <td>Whats your gender:</td>
                    <td>
                        <select name="gender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
