/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import com.quizz.entites.History;
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
public class HistoryDao {

    private Connection con;

    public HistoryDao(Connection con) {
        this.con = con;
    }

    public boolean saveHistory(History history) {

        boolean f = false;

        try {
            String query = "insert into history(`uid`,`eid`,`score`,`right`,`wrong`,`percentage`) values(?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setInt(1, history.getUid());
            ps.setInt(2, history.getEid());
            ps.setInt(3, history.getScore());
            ps.setInt(4, history.getRight());
            ps.setInt(5, history.getWrong());
            ps.setFloat(6, history.getPercentage());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public History getHistoryByUserIdAndQuizId(int userId, int e_id) {
        History history = null;

        try {
            PreparedStatement ps = con.prepareStatement("select * from history where uid = ? and eid = ?");
            ps.setInt(1, userId);
            ps.setInt(2, e_id);

            ResultSet set = ps.executeQuery();

            while (set.next()) {
                history = new History();

                history.setHid(set.getInt("hid"));
                history.setUid(set.getInt("uid"));
                history.setEid(set.getInt("eid"));
                history.setScore(set.getInt("score"));
                history.setRight(set.getInt("right"));
                history.setWrong(set.getInt("wrong"));
                history.setHdate(set.getTimestamp("hdate"));
                history.setPercentage(set.getFloat("percentage"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return history;
    }

    public List<History> getUserHistory(int userId) {
        List<History> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from history where uid = ?");
            ps.setInt(1, userId);

            ResultSet set = ps.executeQuery();

            while (set.next()) {
                int hid = set.getInt("hid");
                int uid = set.getInt("uid");
                int eid = set.getInt("eid");
                int score = set.getInt("score");
                int right = set.getInt("right");
                int wrong = set.getInt("wrong");
                float percentage = set.getFloat("percentage");
                Timestamp hdate = set.getTimestamp("hdate");

                History history = new History(hid, uid, eid, score, right, wrong,percentage, hdate);
                list.add(history);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List<History> getUsersHistoryByQuizId(int e_id) {
        List<History> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM (SELECT * FROM `history` where eid = ? ORDER BY percentage DESC LIMIT 5) dt ORDER BY  dt.percentage DESC;");
            ps.setInt(1, e_id);

            ResultSet set = ps.executeQuery();

            while (set.next()) {
                int hid = set.getInt("hid");
                int uid = set.getInt("uid");
                int eid = set.getInt("eid");
                int score = set.getInt("score");
                int right = set.getInt("right");
                int wrong = set.getInt("wrong");
                float percentage = set.getFloat("percentage");
                Timestamp hdate = set.getTimestamp("hdate");

                History history = new History(hid, uid, eid, score, right, wrong,percentage, hdate);
                list.add(history);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<History> getAllUsersHistory() {
        List<History> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from history order by percentage DESC;");

            ResultSet set = ps.executeQuery();

            while (set.next()) {
                int hid = set.getInt("hid");
                int uid = set.getInt("uid");
                int eid = set.getInt("eid");
                int score = set.getInt("score");
                int right = set.getInt("right");
                int wrong = set.getInt("wrong");
                float percentage = set.getFloat("percentage");
                Timestamp hdate = set.getTimestamp("hdate");

                History history = new History(hid, uid, eid, score, right, wrong, percentage, hdate);
                list.add(history);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteHistory(int id) {
        boolean f = false;

        try {
            String q = "delete from history where hid = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
