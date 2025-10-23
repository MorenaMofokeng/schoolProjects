package ac.za.tut.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-08-11T15:46:45")
@StaticMetamodel(Message.class)
public class Message_ { 

    public static volatile SingularAttribute<Message, Integer> agentID;
    public static volatile SingularAttribute<Message, String> ciphertext;
    public static volatile SingularAttribute<Message, Byte> msgLength;
    public static volatile SingularAttribute<Message, Long> id;
    public static volatile SingularAttribute<Message, Date> timestamp;

}