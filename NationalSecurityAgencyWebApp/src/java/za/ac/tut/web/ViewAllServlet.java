/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import ac.za.tut.bl.Decryption;
import ac.za.tut.bl.Encryption;
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
public class ViewAllServlet extends HttpServlet {
    @EJB MessageFacadeLocal mfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
       List<Message> messages = mfl.findAll();
       List<String> decryptedMsgs = new ArrayList<>();
       
       for(Message msg : messages){
           String encryptedMsg = msg.getCiphertext();
           
           Decryption decrypt = new Decryption(encryptedMsg);
           decryptedMsgs.add(decrypt.getMessage());
       }
       session.setAttribute("decryptedMsgs", decryptedMsgs);
       
       request.getRequestDispatcher("view_all_outcome.jsp").forward(request, response);
       
    }
}

