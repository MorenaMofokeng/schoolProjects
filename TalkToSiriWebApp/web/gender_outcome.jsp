<%-- 
    Document   : gender_outcome
    Created on : 14 Jun 2025, 12:37:40 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gender Outcome Page</title>
    </head>
    <body>
        <h1>Gender Outcome</h1>
        <%
            String name = (String)session.getAttribute("name");
            String title = (String)session.getAttribute("title");
        %>
        <p>
            Nice knowing you <b><%=title%></b>. <b><%=name%></b>
        </p>
        <form action="TeamSupportedServlet.do" method="POST">
            <table>
                <tr>
                    <td>Which team do you support?</td>
                    <td>
                        <select name="team_supported" required="">
                            <option value="Pirates">Pirates</option>
                            <option value="Others">Others</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="SUMBIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
