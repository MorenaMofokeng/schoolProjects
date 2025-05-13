/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import com.sun.istack.logging.Logger;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author user
 */
public class AddRecordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try{
           Long id = Long.parseLong(request.getParameter("id"));
           String name = request.getParameter("name");
           Character gender = request.getParameter("gender").charAt(0);
           Integer age = Integer.parseInt(request.getParameter("age"));
           Integer mark = Integer.parseInt(request.getParameter("mark"));
           String dobStr = request.getParameter("dob");
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
           Date dob = sdf.parse(dobStr);
           
           Student student = createStudent(id, name, dob, age, gender, mark);
           
           RequestDispatcher disp = request.getRequestDispatcher("add_record_outcome.jsp");
           disp.forward(request, response);
       } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(AddRecordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       } 

    private Student createStudent(Long id, String name, Date dob, Integer age, Character gender, Integer mark) {
        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setDob(dob);
        student.setAge(age);
        student.setGender(gender);
        student.setMarkObtained(mark);
        student.setCreationDate(new Date());
        
        return student;
    }


}
