/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ac.za.tut.web;

import ac.za.tut.bl.Decryption;
import ac.za.tut.bl.MessageFacadeLocal;
import ac.za.tut.entity.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class ViewAllMsgsServlet extends HttpServlet {
    @EJB MessageFacadeLocal mfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Message> messages = mfl.findAll();
        List<String> decryptedMsgs = new ArrayList<>();
        HttpSession session = request.getSession();
        String url = "view_all_msgs_outcome.jsp";
        
        for(Message message : messages){
            String encryptedMsg = message.getCipherText();
            Decryption decrypt = new Decryption(encryptedMsg);
            String decryptedMsg = decrypt.getMessage();
            decryptedMsgs.add(decryptedMsg);
        }
        session.setAttribute("decryptedMsgs", decryptedMsgs);
        
        request.getRequestDispatcher(url).forward(request, response);
        
    }


}
