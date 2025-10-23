/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ac.za.tut.web;

import ac.za.tut.bl.Encryption;
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
public class AddMessageServlet extends HttpServlet {
    @EJB MessageFacadeLocal mfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String message = request.getParameter("message");
        Encryption encrypt = new Encryption(message);
        String encryptedMsg = encrypt.getMessage();
        Integer agentId = (Integer) session.getAttribute("agentId");
        byte msgLength = (byte) message.length();
        
        Message msg = createMessage(agentId, encryptedMsg, msgLength);
        mfl.create(msg);
        String url = "enter_message_outcome.jsp";
        request.getRequestDispatcher(url).forward(request, response);
        
    }

    private Message createMessage(Integer agentId, String encryptedMsg, byte msgLength) {
        Message message = new Message();
        message.setAgentId(agentId);
        message.setCipherText(encryptedMsg);
        message.setMsgLength(msgLength);
        
        return message;
    }

}
