<%-- 
    Document   : enter_message
    Created on : 11 Aug 2025, 12:47:05 PM
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
        <p>
            Please enter a message below:
        </p>
        <form action="AddMessageServlet.do" method="POST">
            <table>
                <tr>
                    <td>Message:</td>
                    <td>
                        <textarea name="message" width="4px"></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="ADD MESSAGE"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
