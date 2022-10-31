/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

/**
 *
 * @author harshal
 */
public class Users {

    private int uid;
    private String uname;
    private String uemail;
    private String umobile;
    private String uage;
    private String ugender;
    private String uaddress;
    private String ucity;
    private String ustate;
    private String ucountry;
    private String uzipcode;
    private String upassword;

    public Users() {
    }

    public Users(int uid, String uname, String uemail, String umobile, String uage, String ugender, String uaddress, String ucity, String ustate, String ucountry, String uzipcode, String upassword) {
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.umobile = umobile;
        this.uage = uage;
        this.ugender = ugender;
        this.uaddress = uaddress;
        this.ucity = ucity;
        this.ustate = ustate;
        this.ucountry = ucountry;
        this.uzipcode = uzipcode;
        this.upassword = upassword;
    }

    public Users(String uname, String uemail, String umobile, String uage, String ugender, String uaddress, String ucity, String ustate, String ucountry, String uzipcode, String upassword) {
        this.uname = uname;
        this.uemail = uemail;
        this.umobile = umobile;
        this.uage = uage;
        this.ugender = ugender;
        this.uaddress = uaddress;
        this.ucity = ucity;
        this.ustate = ustate;
        this.ucountry = ucountry;
        this.uzipcode = uzipcode;
        this.upassword = upassword;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUmobile() {
        return umobile;
    }

    public void setUmobile(String umobile) {
        this.umobile = umobile;
    }

    public String getUage() {
        return uage;
    }

    public void setUage(String uage) {
        this.uage = uage;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    public String getUcity() {
        return ucity;
    }

    public void setUcity(String ucity) {
        this.ucity = ucity;
    }

    public String getUstate() {
        return ustate;
    }

    public void setUstate(String ustate) {
        this.ustate = ustate;
    }

    public String getUcountry() {
        return ucountry;
    }

    public void setUcountry(String ucountry) {
        this.ucountry = ucountry;
    }

    public String getUzipcode() {
        return uzipcode;
    }

    public void setUzipcode(String uzipcode) {
        this.uzipcode = uzipcode;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    
}
