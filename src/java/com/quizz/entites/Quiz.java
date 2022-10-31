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
public class Quiz {
    private int eid;
    private String title;
    private int markforeach;
    private int totalque;
    private String time;
    private String intro;
    private Timestamp date;
    private int rid;

    public Quiz() {
    }

    public Quiz(int eid, String title, int markforeach, int totalque, String time, String intro, Timestamp date,int rid) {
        this.eid = eid;
        this.title = title;
        this.markforeach = markforeach;
        this.totalque = totalque;
        this.time = time;
        this.intro = intro;
        this.date = date;
        this.rid = rid;
    }

    public Quiz(String title, int markforeach, int totalque, String time, String intro, Timestamp date, int rid) {
        this.title = title;
        this.markforeach = markforeach;
        this.totalque = totalque;
        this.time = time;
        this.intro = intro;
        this.date = date;
        this.rid = rid;
    }

    public Quiz(String title, int markforeach, int totalque, String time, String intro,int rid) {
        this.title = title;
        this.markforeach = markforeach;
        this.totalque = totalque;
        this.time = time;
        this.intro = intro;
        this.rid = rid;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMarkforeach() {
        return markforeach;
    }

    public void setMarkforeach(int markforeach) {
        this.markforeach = markforeach;
    }

    public int getTotalque() {
        return totalque;
    }

    public void setTotalque(int totalque) {
        this.totalque = totalque;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }
    
    
    
}
