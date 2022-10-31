/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import com.quizz.entites.Options;
import com.quizz.entites.Questions;
import com.quizz.entites.Quiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class OptionDao {

    private Connection con;

    public OptionDao(Connection con) {
        this.con = con;
    }

    public List<Options> getOptionsByQno(int q_no,int e_id) {
        List<Options> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from options where qno = ? and eid = ?");
            ps.setInt(1, q_no);
            ps.setInt(2, e_id);

            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int id = set.getInt("optionid");
                int qno = set.getInt("qno");
                String op = set.getString("option");
                int eid = set.getInt("eid");

                Options option = new Options(id, op, qno, eid);
                list.add(option);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
