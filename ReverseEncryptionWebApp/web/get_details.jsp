<%-- 
    Document   : get_details
    Created on : 13 Aug 2025, 6:25:16 PM
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
        <h1>Enter Details</h1>
        <p>
            Please enter your details below:
        </p>
        <form action="StartSessionServlet.do" method="POST">
            <table>
                <tr>
                    <td>Agent ID:</td>
                    <td><input type="number" name="agentId" maxlength="3" required=""/></td>
                </tr>
                <tr>
                    <td>Name:</td>
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
