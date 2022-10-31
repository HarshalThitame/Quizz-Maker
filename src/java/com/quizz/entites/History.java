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
public class History {

    private int hid;
    private int uid;
    private int eid;
    private int score;
    private int right;
    private int wrong;
    private float percentage;
    private Timestamp hdate;

    public History() {
    }

    public History(int hid, int uid, int eid, int score, int right, int wrong, float percentage, Timestamp hdate) {
        this.hid = hid;
        this.uid = uid;
        this.eid = eid;
        this.score = score;
        this.right = right;
        this.wrong = wrong;
        this.percentage = percentage;
        this.hdate = hdate;
    }

    public History(int uid, int eid, int score, int right, int wrong,float percentage) {
        this.uid = uid;
        this.eid = eid;
        this.score = score;
        this.right = right;
        this.wrong = wrong;
        this.percentage = percentage;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getRight() {
        return right;
    }

    public void setRight(int right) {
        this.right = right;
    }

    public int getWrong() {
        return wrong;
    }

    public void setWrong(int wrong) {
        this.wrong = wrong;
    }

    public Timestamp getHdate() {
        return hdate;
    }

    public void setHdate(Timestamp hdate) {
        this.hdate = hdate;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }
    

}
