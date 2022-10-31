/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

/**
 *
 * @author harshal
 */
public class Answer {
    
    private int ansid;
    private int queno;
    private int optionNo;
    private int eid;

    public Answer() {
    }

    public Answer(int ansid, int queno, int optionNo, int eid) {
        this.ansid = ansid;
        this.queno = queno;
        this.optionNo = optionNo;
        this.eid = eid;
    }

    public Answer(int queno, int optionNo, int eid) {
        this.queno = queno;
        this.optionNo = optionNo;
        this.eid = eid;
    }

    public int getAnsid() {
        return ansid;
    }

    public void setAnsid(int ansid) {
        this.ansid = ansid;
    }

    public int getQueno() {
        return queno;
    }

    public void setQueno(int queno) {
        this.queno = queno;
    }

    public int getOptionNo() {
        return optionNo;
    }

    public void setOptionNo(int optionNo) {
        this.optionNo = optionNo;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }
    
    
    
}


