/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.entities.Student;

/**
 *
 * @author user
 */
public class FindStudentServlet extends HttpServlet {
    @EJB StudentFacadeLocal sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long studID = Long.parseLong(request.getParameter("studID"));
        String url = "find_student_outcome.jsp";
        
        Student student = sfl.find(studID);
        if(student == null){
            url = "student_not_found.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }else{
             request.setAttribute("student", student);
        
             request.getRequestDispatcher(url).forward(request, response);
        }
     }

}
