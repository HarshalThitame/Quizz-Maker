/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

/**
 *
 * @author harshal
 */
public class Questions {
    private int qid;
    private int eid;
    private int qno;
    private String ans;
    private String question;

    public Questions() {
    }

    public Questions(int qid, int eid,int qno, String ans, String question) {
        this.qid = qid;
        this.eid = eid;
        this.qno = qno;
        this.ans = ans;
        this.question = question;
    }

    public Questions(int eid,int qno, String ans, String question) {
        this.eid = eid;
        this.qno = qno;
        this.ans = ans;
        this.question = question;
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public int getQid() {
        return qid;
    }

    public void setQid(int qid) {
        this.qid = qid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
    
    
    
    
    
}
