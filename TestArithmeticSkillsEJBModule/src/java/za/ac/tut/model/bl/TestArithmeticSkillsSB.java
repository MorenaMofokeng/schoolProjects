/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package za.ac.tut.model.bl;

import javax.ejb.Stateless;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@Stateless
public class TestArithmeticSkillsSB implements TestArithmeticSkillsSBLocal, InvalidAnswerLocal {
    
    @Override
    public Integer generateRandomNumber() {
        int randNum;
        
        randNum = 1 + ((int)Math.floor(Math.random()*10));
        
        return randNum;
    }
    
    @Override
    public String generateQuestion(Character op, Integer num1, Integer num2) {
        String question;
        
        if(op.equals('+')){
            question = num1 + " + " + num2 + " = ?";
        } else {
            question = num1 + " + " + num2 + " = ?";
        }
        
        return question;
    }
    
    @Override
    public Integer generateAnswer(HttpSession session) {
        Integer num1, num2, answer;
        Character currentOperation;
        
        num1 = (Integer)session.getAttribute("num1");
        num2 = (Integer)session.getAttribute("num2");
        currentOperation = (Character)session.getAttribute("currentOperation");
        
        if(currentOperation.equals('+')){
            answer = num1 + num2 ;
        } else {
            answer = num1 + num2;
        }
        
        return answer;
    }
    
    @Override
    public String determineOutcome(Integer userAnswer, Integer correctAnswer) {
        String outcome = "Wrong answer!";
        
        if(userAnswer.equals(correctAnswer)){
            outcome = "Correct Answer!";
        }
        
        return outcome;
    }
    
    @Override
    public Boolean isAnswerCorrect(Integer userAnswer, Integer correctAnswer) throws InvalidAnswerException {
        if(isUserAnswerValid(userAnswer)){
            if(userAnswer.equals(correctAnswer)){
                return true;
            } else {
                return false;
            }
        } else {
            throw new InvalidAnswerException(ERR_MSG);
        } 
    }
    
    private boolean isUserAnswerValid(Integer userAnswer){
        boolean isValid = true;
        
        if(userAnswer < THRESHOLD){
            isValid = false;
        }
        
        return isValid;
    }
}
