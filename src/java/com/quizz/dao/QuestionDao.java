/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import com.quizz.entites.Options;
import com.quizz.entites.Questions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class QuestionDao {

    private Connection con;

    public QuestionDao(Connection con) {
        this.con = con;
    }

    public List<Questions> getQuestionsByQno(int e_id) {
        List<Questions> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from questions where eid = ?");
            ps.setInt(1, e_id);

            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int eid = set.getInt("eid");
                int qid = set.getInt("qid");
                String que = set.getString("question");
                int qno = set.getInt("qno");
                String ans = set.getString("ans");

                Questions question = new Questions(qid, eid, qno, ans, que);
                list.add(question);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
