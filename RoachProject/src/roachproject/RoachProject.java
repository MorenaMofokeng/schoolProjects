/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package roachproject;

import javax.swing.JOptionPane;
import oop.RoachPopulation.RoachPopulation;

/**
 *
 * @author user
 */
public class RoachProject {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        RoachPopulation myHouse = new RoachPopulation();
        
        myHouse.setPopulation(21);
        
        //myHouse.doubling();
        myHouse.spray();
        
        int thePopulation = myHouse.getPopulation();
        String message ="The roach population is " + thePopulation;
        JOptionPane.showMessageDialog(null, message);
        
    }
    
}
