/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.bl;

import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.Student;

/**
 *
 * @author user
 */
@Stateless
public class StudentFacade extends AbstractFacade<Student> implements StudentFacadeLocal {

    @PersistenceContext(unitName = "ClassManagerEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StudentFacade() {
        super(Student.class);
    }
    @RolesAllowed("teacher")
    @Override
    public void createStudent(Student student) {
        create(student);
    }
    @RolesAllowed("teacher")
    @Override
    public void editStudent(Student student) {
        edit(student);
    }
    @RolesAllowed("teacher")
    @Override
    public void removeStudent(Student student) {
        remove(student);
    }
    @RolesAllowed("teacher")
    @Override
    public Student findStudent(Object id) {
        Student student = find(id);
        
        return student;
    }
    @RolesAllowed({"teacher" , "student"})
    @Override
    public List<Student> findAllStudent() {
        List<Student> students = findAll();
        
        return students;
    }
    
}
