/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

/**
 *
 * @author harshal
 */
public class Recruiters {
    
    private int rid;
    private String rname;
    private String remail;
    private String rmobile;
    private String rage;
    private String rgender;
    private String rpassword;

    public Recruiters() {
    }

    public Recruiters(String rname, String remail, String rmobile, String rage, String rgender, String rpassword) {
        this.rname = rname;
        this.remail = remail;
        this.rmobile = rmobile;
        this.rage = rage;
        this.rgender = rgender;
        this.rpassword = rpassword;
    }

    public Recruiters(int rid, String rname, String remail, String rmobile, String rage, String rgender, String rpassword) {
        this.rid = rid;
        this.rname = rname;
        this.remail = remail;
        this.rmobile = rmobile;
        this.rage = rage;
        this.rgender = rgender;
        this.rpassword = rpassword;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRemail() {
        return remail;
    }

    public void setRemail(String remail) {
        this.remail = remail;
    }

    public String getRmobile() {
        return rmobile;
    }

    public void setRmobile(String rmobile) {
        this.rmobile = rmobile;
    }

    public String getRage() {
        return rage;
    }

    public void setRage(String rage) {
        this.rage = rage;
    }

    public String getRgender() {
        return rgender;
    }

    public void setRgender(String rgender) {
        this.rgender = rgender;
    }

    public String getRpassword() {
        return rpassword;
    }

    public void setRpassword(String rpassword) {
        this.rpassword = rpassword;
    }
    
    
    
}
