/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ac.za.tut.bl;

/**
 *
 * @author user
 */
public class Decryption {
    private String message;

    public Decryption(String message) {
        this.message = decryptMsg(message);
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public String decryptMsg(String message){
        message = message.replace("1", "a");
        message = message.replace("2", "e");
        message = message.replace("3", "i");
        message = message.replace("4", "o");
        message = message.replace("5", "u");
        
        return message;
    }
}
