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
import za.ac.tut.model.ConversationInterface;
import za.ac.tut.model.ConversationManager;

/**
 *
 * @author user
 */
public class GenderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       HttpSession session = request.getSession();
       String gender = request.getParameter("gender");
       
       ConversationInterface ci = new ConversationManager();
       String title = ci.generateTitle(gender);
       session.setAttribute("title", title);
       
       RequestDispatcher disp = request.getRequestDispatcher("gender_outcome.jsp");
       disp.forward(request, response);
       
   
    }

}
