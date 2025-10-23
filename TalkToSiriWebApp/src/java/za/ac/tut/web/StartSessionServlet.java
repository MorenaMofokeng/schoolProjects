/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
        String name = request.getParameter("name");
        
        initializeSession(session, name);
        
        RequestDispatcher disp = request.getRequestDispatcher("session_started.jsp");
        disp.forward(request, response);
    }

    private void initializeSession(HttpSession session, String name) {
        String gender= "", teamSupported  = "";
        session.setAttribute("name", name);
        session.setAttribute("gender", gender);
        session.setAttribute("teamSupported", teamSupported);
    }

}
