<%-- 
    Document   : forbidden
    Created on : 17 Jun 2025, 7:42:59 PM
    Author     : user
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forbidden Page</title>
    </head>
    <body>
          <h1>Forbidden</h1>
          <p>
              Access Denied. Unauthorized User!
          </p>
          <ol>
            <li><a href="menu.jsp">Menu Page</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ol>
    </body>
</html>
