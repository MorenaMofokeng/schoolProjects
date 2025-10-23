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
        this.message = encryptMsg(message).toLowerCase();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    private String encryptMsg(String message){
        StringBuilder encrypt = new StringBuilder(message);
        
        String encryptedText = encrypt.reverse().toString();
        
        return encryptedText;
        
    }
    
}
