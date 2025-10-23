<%-- 
    Document   : start
    Created on : 17 Jun 2025, 5:12:07 PM
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
        <p>
            Please provide your details below:
        </p>
        <form action="StartSessionServlet.do" method="POST">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="number" name="agentID" maxlength="3"/></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="userName"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
