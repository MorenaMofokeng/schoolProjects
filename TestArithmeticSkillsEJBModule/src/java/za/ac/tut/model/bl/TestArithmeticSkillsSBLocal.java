/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/SessionLocal.java to edit this template
 */
package za.ac.tut.model.bl;

import javax.ejb.Local;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@Local
public interface TestArithmeticSkillsSBLocal {
    
    Integer generateRandomNumber();
    String generateQuestion(Character op, Integer num1, Integer num2);
    Integer generateAnswer(HttpSession session);
    String determineOutcome(Integer userAnswer, Integer correctAnswer);
    Boolean isAnswerCorrect(Integer userAnswer, Integer correctAnswer) throws InvalidAnswerException;
    
}