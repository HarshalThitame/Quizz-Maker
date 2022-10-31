/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author harshal
 */
public class AnswerDao {

    private Connection con;

    public AnswerDao(Connection con) {
        this.con = con;
    }

    public int getAnswerByQnoAndEid(int qno, int qid) {
        int ans = 0;
        try {
            String query = "select optionNo from answer where queNo = ? and eid = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, qno);
            ps.setInt(2, qid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ans = rs.getInt("optionNo");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;

    }

}
