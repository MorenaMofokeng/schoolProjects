<%-- 
    Document   : enter_message
    Created on : 13 Aug 2025, 6:46:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Message Page</title>
    </head>
    <body>
        <h1>Enter Message</h1>
        <%
            String name = (String)session.getAttribute("name");
        %>
        <p>
            <b><%=name%></b>, Please enter a message below:
        </p>
        <form action="AddMessageServlet.do" method="POST">
            <table>
                <tr>
                    <td>Message: </td>
                    <td>
                        <textarea name="message" width="6px" required=""></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="ENCRYPT AND SAVE"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
