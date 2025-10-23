/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.model.bl;

/**
 *
 * @author user
 */
public class InvalidAnswerException extends RuntimeException{
    public InvalidAnswerException(String errMsg) {
        super(errMsg);
    }
}
