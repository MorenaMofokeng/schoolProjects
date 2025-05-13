/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.model.bl.StudentFacadeLocal;
import za.ac.tut.model.entity.Student;

/**
 *
 * @author user
 */
public class GetDetailsOverMarkRangeServlet extends HttpServlet {
    @EJB StudentFacadeLocal sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer minMark = Integer.parseInt(request.getParameter("min_mark"));
        Integer maxMark = Integer.parseInt(request.getParameter("max_mark"));
        List<Student> students = sfl.getStudentsOverMarkRange(minMark, maxMark);
        
        request.setAttribute("students", students);
        request.setAttribute("minMark", minMark);
        request.setAttribute("maxMark", maxMark);
        
        RequestDispatcher disp = request.getRequestDispatcher("get_details_over_mark_range_outcome.jsp");
        disp.forward(request, response);
    }

}
