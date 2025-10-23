/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.util.ArrayList;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.SoftBevelBorder;
import javax.swing.border.TitledBorder;
import za.ac.tut.membership.Member;

/**
 *
 * @author user
 */
public class GymMemberFrame extends JFrame {
   private JPanel headingPnl;
   private JPanel clientPnl;
   private JPanel namePnl;
   private JPanel surnamePnl;
   private JPanel idNoPnl;
   private JPanel genderPnl;
   private JPanel contractsPnl;
   private JPanel personalTrainerOptPnl;
   private JPanel membershipPnl;
   private JPanel commentsPnl;
   private JPanel btnsPnl;
   private JPanel headingClientCombinedPnl;
   private JPanel membershipCommentsCombinedPnl;
   private JPanel mainPnl;
   
   private JLabel headingLbl;
   private JLabel nameLbl;
   private JLabel surnameLbl;
   private JLabel idNoLbl;
   private JLabel genderLbl;
   private JLabel personalTrainerLbl;
   private JLabel contractTypeLbl;
   
   private JTextField nameTxtFld;
   private JTextField surnameTxtFld;
   private JTextField idNoTxtFld;
   
   private JComboBox genderComboBox;
   
   private JRadioButton monthTomonthRadBtn;
   private JRadioButton sixMonthsRadBtn;
   private JRadioButton annualRadBtn;
   
   private JCheckBox personalTrainerChkBx;
   
   private ButtonGroup btnGrp;
   
   private JTextArea commentsArea;
   
   private JScrollPane scrollableTxtArea;
   
   private JButton registerBtn;
   private JButton clearBtn;
   private JButton exitBtn;
   private JButton searchBtn;
   private JButton removeBtn;
   private JButton updateBtn;
   private JButton displayBtn;
   
   private ArrayList<Member> members;

    public GymMemberFrame() {
        setTitle("Gym Membership");
        setSize(500,500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        JFrame.setDefaultLookAndFeelDecorated(true);
        
        members = new ArrayList<>();
        
        headingPnl = new JPanel(new FlowLayout(FlowLayout.CENTER));
        
        clientPnl = new JPanel(new GridLayout(4, 1, 1, 1));
        clientPnl.setBorder(new TitledBorder(new LineBorder(Color.BLACK,1),"Client Details"));
        
        namePnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        surnamePnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        idNoPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        genderPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        
        contractsPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        personalTrainerOptPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        
        membershipPnl = new JPanel(new GridLayout(2,1,1,1));
        membershipPnl.setBorder(new TitledBorder(new LineBorder(Color.BLACK,1),"Contact options"));
        
        commentsPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        
        btnsPnl = new JPanel(new FlowLayout(FlowLayout.LEFT));
        headingClientCombinedPnl = new JPanel(new BorderLayout());
        membershipCommentsCombinedPnl = new JPanel(new BorderLayout());
        mainPnl = new JPanel(new BorderLayout());
        
        headingLbl = new JLabel("Membership Form");
        headingLbl.setFont(new Font(Font.SANS_SERIF, Font.ITALIC + Font.BOLD,20));
        headingLbl.setForeground(Color.BLUE);
        headingLbl.setBorder(new SoftBevelBorder(SoftBevelBorder.RAISED));
        
        nameLbl = new JLabel("Name:       ");
        surnameLbl = new JLabel("Surname: ");
        idNoLbl = new JLabel("Id No:       ");
        genderLbl = new JLabel("Gender     ");
        contractTypeLbl = new JLabel("Type of contract: ");
        personalTrainerLbl = new JLabel("Select the checkbox if you need a personal trainer ");
        
        nameTxtFld = new JTextField(10);
        surnameTxtFld = new JTextField(10);
        idNoTxtFld = new JTextField(10);
        
        genderComboBox = new JComboBox();
        genderComboBox.addItem("Male");
        genderComboBox.addItem("Female");
        
        monthTomonthRadBtn = new JRadioButton("Month-to-month");
        sixMonthsRadBtn = new JRadioButton("Six months");
        annualRadBtn = new JRadioButton("Annual");
        
        personalTrainerChkBx = new JCheckBox();
        
        btnGrp = new ButtonGroup();
        btnGrp.add(monthTomonthRadBtn);
        btnGrp.add(sixMonthsRadBtn);
        btnGrp.add(annualRadBtn);
        
        commentsArea = new JTextArea(15,50);
        commentsArea.setEditable(false);
        commentsArea.setBorder(new TitledBorder(new LineBorder(Color.BLACK,1),"Member(s) details"));
        
        scrollableTxtArea = new JScrollPane(commentsArea, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
        
        registerBtn = new JButton("REGISTER");
        registerBtn.addActionListener(new RegisterBtnListener());
        
        searchBtn = new JButton("SEARCH");
        removeBtn = new JButton("REMOVE");
        updateBtn = new JButton("UPDATE");
        displayBtn = new JButton("DISPLAY ALL");
        clearBtn = new JButton("CLEAR");
        clearBtn.addActionListener(new ClearBtnListener());
        exitBtn = new JButton("EXIT");
        exitBtn.addActionListener(new ExitBtnListener());
        
        headingPnl.add(headingLbl);
        
        namePnl.add(nameLbl);
        namePnl.add(nameTxtFld);
        
        surnamePnl.add(surnameLbl);
        surnamePnl.add(surnameTxtFld);
        
        idNoPnl.add(idNoLbl);
        idNoPnl.add(idNoTxtFld);
        
        genderPnl.add(genderLbl);
        genderPnl.add(genderComboBox);
        
        clientPnl.add(namePnl);
        clientPnl.add(surnamePnl);
        clientPnl.add(idNoPnl);
        clientPnl.add(genderPnl);
        
        headingClientCombinedPnl.add(headingPnl, BorderLayout.NORTH);
        headingClientCombinedPnl.add(clientPnl, BorderLayout.CENTER);
        
        contractsPnl.add(contractTypeLbl);
        contractsPnl.add(monthTomonthRadBtn);
        contractsPnl.add(sixMonthsRadBtn);
        contractsPnl.add(annualRadBtn);
        
        personalTrainerOptPnl.add(personalTrainerLbl);
        personalTrainerOptPnl.add(personalTrainerChkBx);
        
        membershipPnl.add(contractsPnl);
        membershipPnl.add(personalTrainerOptPnl);
        
        commentsPnl.add(scrollableTxtArea);
        
        membershipCommentsCombinedPnl.add(membershipPnl, BorderLayout.NORTH);
        membershipCommentsCombinedPnl.add(commentsPnl, BorderLayout.CENTER);
        
        btnsPnl.add(registerBtn);
        btnsPnl.add(searchBtn);
        btnsPnl.add(updateBtn);
        btnsPnl.add(removeBtn);
        btnsPnl.add(displayBtn);
        btnsPnl.add(clearBtn);
        btnsPnl.add(exitBtn);
        
        mainPnl.add(headingClientCombinedPnl, BorderLayout.NORTH);
        mainPnl.add(membershipCommentsCombinedPnl, BorderLayout.CENTER);
        mainPnl.add(btnsPnl, BorderLayout.SOUTH);
        
        add(mainPnl);
        pack();
        setResizable(false);
        setVisible(true);
    }
    
    private class RegisterBtnListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            String name = nameTxtFld.getText();
            String surname = surnameTxtFld.getText();
            String idNo = idNoTxtFld.getText();
            String gender = (String) genderComboBox.getSelectedItem();
            Boolean isPersonalTrainerSelected = personalTrainerChkBx.isSelected();
            String contractType = "Month-to-month";
            
            if(sixMonthsRadBtn.isSelected()){
                contractType = "Six months";   
            }else {
                if(annualRadBtn.isSelected()){
                    contractType = "Annual";
                }
            }
            
            Member member = new Member(name, surname, idNo, gender, contractType,isPersonalTrainerSelected);
            
            members.add(member);
            
            commentsArea.setText("The member has been successfully added");
        }
        
    }
        private class DisplayBtnListener implements ActionListener {
            
        @Override
         public void actionPerformed(ActionEvent ae) {
            StringBuilder memberDetails = new StringBuilder();
        for (Member member : members) {
            memberDetails.append(member.toString()).append("\n");
        }
        commentsArea.setText(memberDetails.toString());
    }
}

   
    public class ClearBtnListener implements ActionListener{

        @Override
        public void actionPerformed(ActionEvent e) {
            
            nameTxtFld.setText("");
            surnameTxtFld.setText("");
            idNoTxtFld.setText("");
            personalTrainerChkBx.setSelected(false);
            btnGrp.clearSelection();
            commentsArea.setText("");
            
            nameTxtFld.setFocusable(true);
        }
        
    }
    
    private class ExitBtnListener implements ActionListener{

        @Override
        public void actionPerformed(ActionEvent e) {
            
            System.exit(1);
        }
        
    }
   
   
   
}
