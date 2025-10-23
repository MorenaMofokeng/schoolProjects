<%-- 
    Document   : view_all_outcome
    Created on : 11 Aug 2025, 1:30:22 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Messages Page</title>
    </head>
    <body>
        <h1>View All Messages</h1>
        <table>
        <%
            List<String> decryptedMessages = (List<String>)session.getAttribute("decryptedMsgs");
            for(String message : decryptedMessages){
            
        %>
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
