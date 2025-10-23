/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ac.za.tut.bl;

/**
 *
 * @author user
 */
public class Encryption {
    private String message;

    public Encryption(String message) {
        this.message = encryptMsg(message);
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public String encryptMsg(String message){
        message = message.replace("a", "1");
        message = message.replace("e", "2");
        message = message.replace("i", "3");
        message = message.replace("o", "4");
        message = message.replace("u", "5");
        
        return message;
    }
}
