/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

import java.sql.Timestamp;

/**
 *
 * @author harshal
 */
public class Feedback {
   private int id;
   private int eid;
   private int uid;
   private String name;
   private String email;
   private String subject;
   private String feedback;
   private int rating;
   private Timestamp date;

    public Feedback() {
    }

    public Feedback(int eid, int uid, String name, String email, int rating) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.rating = rating;
    }
    

    public Feedback(int eid, int uid, String name, String email, String feedback, int rating) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.feedback = feedback;
        this.rating = rating;
    }
    
    

    public Feedback(int eid, int uid, String name, String email, String subject, String feedback, int rating) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.feedback = feedback;
        this.rating = rating;
    }

    public Feedback(int id, int eid, int uid, String name, String email, String subject, String feedback, int rating, Timestamp date) {
        this.id = id;
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.feedback = feedback;
        this.rating = rating;
        this.date = date;
    }

    public Feedback(int eid, int uid, String name, String email, String subject, String feedback, int rating, Timestamp date) {
        this.eid = eid;
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.feedback = feedback;
        this.rating = rating;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
   
   
   
}
