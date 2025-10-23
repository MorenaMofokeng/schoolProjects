<%-- 
    Document   : longest_msg_outcome
    Created on : 13 Aug 2025, 7:41:13 PM
    Author     : user
--%>

<%@page import="ac.za.tut.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Longest Message Outcome Page</title>
    </head>
    <body>
        <h1>Longest Message Outcome </h1>
        <%
            String name = (String)session.getAttribute("name");
            
            Message message = (Message)session.getAttribute("longestMsg");
            Integer agentId = message.getAgentId();
            String msg = message.getCipherText();
            byte msgLength = message.getMsgLength();
        %>
        <p>
            <b><%=name%></b>, Below is the details of the longest message.
        </p>
        <table border="1px">
            <th>Agent ID</th>
            <th>Message (Ciphertext)</th>
            <th>Length (Bytes)</th>
            <tr>
                <td><%=agentId%></td>
                <td><%=msg%></td>
                <td><%=msgLength%> bytes</td>
            </tr>
        </table>
            <ul>
                <li><a href="menu.jsp">Menu</a></li>
                <li><a href="LogoutServlet.do">Logout</a></li>
            </ul>
    </body>
</html>
