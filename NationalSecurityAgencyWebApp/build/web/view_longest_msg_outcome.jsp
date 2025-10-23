<%-- 
    Document   : view_longest_msg_outcome
    Created on : 11 Aug 2025, 2:15:20 PM
    Author     : user
--%>

<%@page import="ac.za.tut.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Longest Message Page</title>
    </head>
    <body>
        <h1>View Longest Message</h1>
        <p>Below are the details of the longest message:</p>
        <%
            Message messageDetails = (Message)session.getAttribute("message");
            Integer agentId = messageDetails.getAgentID();
            String message = messageDetails.getCiphertext();
            byte msgLength = messageDetails.getMsgLength();
        %>
        <table border="1px">
            <th>Agent ID</th>
            <th>Message (CipherText)</th>
            <th>Length (Bytes)</th>
            <tr>
                <td><%=agentId%></td>
                <td><%=message%></td>
                <td><%=msgLength%></td>
            </tr>
        </table>
            <ul>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="LogoutServlet.do">Logout</a></li>
            </ul>
    </body>
</html>
