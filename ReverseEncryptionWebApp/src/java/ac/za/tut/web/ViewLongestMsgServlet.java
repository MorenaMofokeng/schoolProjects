/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ac.za.tut.web;

import ac.za.tut.bl.MessageFacadeLocal;
import ac.za.tut.entity.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class ViewLongestMsgServlet extends HttpServlet {
    @EJB MessageFacadeLocal mfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Message longestMsg = mfl.longestMessage();
        String url = "longest_msg_outcome.jsp";
        
        session.setAttribute("longestMsg",longestMsg);
        request.getRequestDispatcher(url).forward(request, response);
    }


}
