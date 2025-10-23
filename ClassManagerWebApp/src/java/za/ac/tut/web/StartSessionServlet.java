/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

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
        String userName = request.getParameter("userName");
        String id = request.getParameter("agentID");
        
        if(id.length() != 3){
            request.getRequestDispatcher("invalid_format.jsp").forward(request, response);
        }
        
        Integer agentID = Integer.parseInt(id);
        
        session.setAttribute("userName", userName);
        session.setAttribute("agentID", agentID);
        
        request.getRequestDispatcher("menu.jsp").forward(request, response);
        
    }

}
