/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class AddStudentServlet extends HttpServlet {
    @EJB StudentFacadeLocal sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long studID = Long.parseLong(request.getParameter("studID"));
        String name = request.getParameter("name");
        Integer age = Integer.parseInt(request.getParameter("age"));
        
        
        
        Student student = new Student();
        student.setId(studID);
        student.setName(name);
        student.setAge(age);
        student.setCreationDate(new Date());
        
        sfl.create(student);
        
        request.getRequestDispatcher("add_student_outcome.jsp").forward(request, response);
        
        
    }


}
