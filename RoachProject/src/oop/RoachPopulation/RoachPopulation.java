/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oop.RoachPopulation;

/**
 *
 * @author user
 */
public class RoachPopulation {
    
    private int population;

    public RoachPopulation() {
        population = 3;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public int getPopulation() {
        return population;
    }
    
    public void doubling(){
        
        population = population*2;
    }
    
    public void spray(){
        
        if(population <= 20){
            
            population = 0;
        }
        else{
            double half = population * 0.5;
            population = population - (int)half;
        }
    }
    
}
