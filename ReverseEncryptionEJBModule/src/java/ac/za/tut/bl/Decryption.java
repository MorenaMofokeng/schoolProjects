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
        this.message = decryptMsg(message).toLowerCase();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    private String decryptMsg(String message){
        StringBuilder decrypt = new StringBuilder(message);
        
        String decryptedText = decrypt.reverse().toString();
        
        return decryptedText;
    }
}
