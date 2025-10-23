/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ac.za.tut.bl;

import ac.za.tut.entity.Message;
import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author user
 */
@Stateless
public class MessageFacade extends AbstractFacade<Message> implements MessageFacadeLocal {

    @PersistenceContext(unitName = "ReverseEncryptionEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MessageFacade() {
        super(Message.class);
    }
    @RolesAllowed("teacher")
    @Override
    public Message longestMessage() {
        Query query = em.createQuery("SELECT m FROM Message m  WHERE  m.msgLength = " + 
                                     "(SELECT MAX(msg.msgLength) FROM Message msg)");
        List<Message> messages = query.getResultList();
        Message message = messages.get(0);
        
        return message;
    }
    
}
