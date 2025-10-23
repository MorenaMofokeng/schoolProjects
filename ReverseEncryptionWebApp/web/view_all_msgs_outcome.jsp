<%-- 
    Document   : view_all_msgs_outcome
    Created on : 13 Aug 2025, 7:18:38 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Messages Outcome Page</title>
    </head>
    <body>
        <h1>View All Messages Outcome</h1>
        <%
            String name = (String)session.getAttribute("name");
        %>
        <p>
            <b><%=name%></b>, Below are all the messages in decrypted format
        </p>
        <%
            List<String> messages = (List<String>)session.getAttribute("decryptedMsgs");
            for(String message: messages){
        %>
        <table border="1px">
            <tr>
                <td><%=message%></td>
            </tr>
        <%
            }
        %>    
        </table>
        <ul>
            <li><a href="menu.jsp">Menu</a></li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
