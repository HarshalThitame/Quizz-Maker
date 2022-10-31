/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import java.sql.Connection;
import com.quizz.entites.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class FeedbackDao {

    private Connection con;

    public FeedbackDao(Connection con) {
        this.con = con;
    }

    public boolean saveFeedback(Feedback feedback) {
        boolean f = false;

        try {
            PreparedStatement ps = con.prepareStatement("insert into feedback(eid,uid,name,email,subject,feedback,rating) values(?,?,?,?,?,?,?)");
            ps.setInt(1, feedback.getEid());
            ps.setInt(2, feedback.getUid());
            ps.setString(3, feedback.getName());
            ps.setString(4, feedback.getEmail());
            ps.setString(5, feedback.getSubject());
            ps.setString(6, feedback.getFeedback());
            ps.setInt(7, feedback.getRating());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public boolean saveFeedbackWithoutSubFeedback(Feedback feedback) {
        boolean f = false;

        try {
            PreparedStatement ps = con.prepareStatement("insert into feedback(eid,uid,name,email,rating) values(?,?,?,?,?)");
            ps.setInt(1, feedback.getEid());
            ps.setInt(2, feedback.getUid());
            ps.setString(3, feedback.getName());
            ps.setString(4, feedback.getEmail());
            ps.setInt(5, feedback.getRating());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public boolean saveFeedbackWithoutSubject(Feedback feedback) {
        boolean f = false;

        try {
            PreparedStatement ps = con.prepareStatement("insert into feedback(eid,uid,name,email,feedback,rating) values(?,?,?,?,?,?)");
            ps.setInt(1, feedback.getEid());
            ps.setInt(2, feedback.getUid());
            ps.setString(3, feedback.getName());
            ps.setString(4, feedback.getEmail());
            ps.setString(5, feedback.getFeedback());
            ps.setInt(6, feedback.getRating());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public boolean saveFeedbackWithoutFeedback(Feedback feedback) {
        boolean f = false;

        try {
            PreparedStatement ps = con.prepareStatement("insert into feedback(eid,uid,name,email,subject,rating) values(?,?,?,?,?,?)");
            ps.setInt(1, feedback.getEid());
            ps.setInt(2, feedback.getUid());
            ps.setString(3, feedback.getName());
            ps.setString(4, feedback.getEmail());
            ps.setString(5, feedback.getSubject());
            ps.setInt(6, feedback.getRating());

            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public Feedback getFeedback(int q_id) {
        Feedback feedback = null;

        try {
            PreparedStatement ps = con.prepareStatement("select * from feedback where eid = ?");
            ps.setInt(1, q_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                feedback = new Feedback();

                feedback.setId(rs.getInt("id"));
                feedback.setEid(rs.getInt("eid"));
                feedback.setUid(rs.getInt("uid"));
                feedback.setName(rs.getString("name"));
                feedback.setEmail(rs.getString("email"));
                feedback.setSubject(rs.getString("subject"));
                feedback.setFeedback(rs.getString("feedback"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setDate(rs.getTimestamp("date"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedback;
    }
    
    public List getAllFeedback(int q_id) {
        List<Feedback> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from feedback where eid = ?");
            ps.setInt(1, q_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int eid = rs.getInt("eid");
                int uid = rs.getInt("uid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String subject = rs.getString("subject");
                String feedback = rs.getString("feedback");
                int rating = rs.getInt("rating");
                Timestamp date = rs.getTimestamp("date");
                
                Feedback fd = new Feedback(id, eid, uid, name, email, subject, feedback, rating, date);
                list.add(fd);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List getRating(int q_id) {
        List<Integer> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select sum(rating),count(id) from feedback where eid = ?");
            ps.setInt(1, q_id);

            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                list.add(rs.getInt(1));
                list.add(rs.getInt(2));
            }           
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
