/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import javax.ejb.Local;

/**
 *
 * @author user
 */
@Local
public interface InvalidAnswerLocal {
   String ERR_MSG = "Invalid data";
   Integer THRESHOLD = 1;
}
