/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.model;

/**
 *
 * @author user
 */
public class ConversationManager implements ConversationInterface {

    @Override
    public String generateTitle(String gender) {
        String title = "Mr";
        
        if(gender.equals("Female")){
            title = "Mrs";
        }

        return title;
    }

    @Override
    public String generateComment(String supportedTeam) {
        String message = "Supporting any teams other than Orlando Pirates is a bad choice, You will be miserable for life.";
        
        if(supportedTeam.equals("Pirates")){
            message = "Supporting Orlando Pirates is a good choice, you will be happy for life";
        }
        return message;
        
    }
    
}
