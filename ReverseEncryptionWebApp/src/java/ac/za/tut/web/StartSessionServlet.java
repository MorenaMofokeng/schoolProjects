/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ac.za.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class StartSessionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String url = "invalid_format.jsp";
        
        String id = request.getParameter("agentId");
        String name = request.getParameter("name");
        
        if(id.length() != 3){
            request.getRequestDispatcher(url).forward(request, response);
        }
        
        Integer agentId = Integer.parseInt(id);
        
        session.setAttribute("agentId", agentId);
        session.setAttribute("name", name);
        
        url = "menu.jsp";
        
        request.getRequestDispatcher(url).forward(request, response);
        
        
        
    }

}
