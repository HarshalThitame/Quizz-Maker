/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import java.sql.Connection;
import com.quizz.entites.Recruiters;
import com.quizz.entites.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author harshal
 */
public class RecruiterDao {

    private Connection con;

    public RecruiterDao(Connection con) {
        this.con = con;
    }

    public boolean saveRecruiter(Recruiters rc) {
        boolean f = false;
        try {
            Thread.sleep(2000);

            String query = "insert into recruiters(rname,remail,rmobile,rage,rgender,rpassword) values(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, rc.getRname());
            ps.setString(2, rc.getRemail());
            ps.setString(3, rc.getRmobile());
            ps.setString(4, rc.getRage());
            ps.setString(5, rc.getRgender());
            ps.setString(6, rc.getRpassword());

            ps.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Recruiters getRecruiterByEmailAndPassword(String email, String pass) {

        Recruiters rc = null;
        try {
            Thread.sleep(2000);

            String query = "select * from recruiters where remail = ? and rpassword = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                rc = new Recruiters();

                String name = set.getString("rname");
                rc.setRname(name);

                rc.setRname(set.getString("rname"));
                rc.setRid(set.getInt("rid"));
                rc.setRemail(set.getString("remail"));
                rc.setRmobile(set.getString("rmobile"));
                rc.setRage(set.getString("rage"));
                rc.setRgender(set.getString("rgender"));
                rc.setRpassword(set.getString("rpassword"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rc;
    }
}
