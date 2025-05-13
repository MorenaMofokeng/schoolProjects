/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
       
       RequestDispatcher disp = request.getRequestDispatcher("menu.jsp");
       disp.forward(request, response);
    }

    private void initializeSession(HttpSession session, String name) {
       String question = "";
       Character currentOperation = null;
       List<String> outcomes = new ArrayList<>();
       List<String> questions = new ArrayList<>();
       List<Integer> userAnswers = new ArrayList<>();
       List<String> correctAnswers = new ArrayList<>();
       Integer num1 = 0, num2 = 0, numQuestionAsked = 0,
               numCorrectAnswers = 0, numWrongAnswers = 0;
       
       session.setAttribute("name", name);
       session.setAttribute("num1", num1);
       session.setAttribute("num2", num2);
       session.setAttribute("currentOperation", currentOperation);
       
       
       session.setAttribute("question", question);
       session.setAttribute("questions", questions);
       
       
       session.setAttribute("correctAnswers", correctAnswers);
       session.setAttribute("userAnswers",userAnswers);
       session.setAttribute("outcomes",outcomes);
       
       
       session.setAttribute("numQuestionAsked",numQuestionAsked);
       session.setAttribute("numCorrectAnswers",numCorrectAnswers);
       session.setAttribute("numWrongAnswers",numWrongAnswers);
    }


}
