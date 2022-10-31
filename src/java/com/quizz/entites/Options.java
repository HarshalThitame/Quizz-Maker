/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.entites;

/**
 *
 * @author harshal
 */
public class Options {

    private int optionid;
    private String option;
    private int qno;
    private int eid;

    public Options() {
    }

    public Options(int optionid, String option, int qno, int eid) {
        this.optionid = optionid;
        this.option = option;
        this.qno = qno;
        this.eid = eid;
    }

    public Options(String option, int qno,int eid) {
        this.option = option;
        this.qno = qno;
        this.eid = eid;
    }

    public int getOptionid() {
        return optionid;
    }

    public void setOptionid(int optionid) {
        this.optionid = optionid;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

}
