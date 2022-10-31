/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import com.quizz.entites.Answer;
import com.quizz.entites.Options;
import com.quizz.entites.Quiz;
import com.quizz.entites.Questions;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harshal
 */
public class QuizDao {

    private Connection con;

    public QuizDao(Connection con) {
        this.con = con;
    }

    public boolean saveQuiz(Quiz quiz) {
        boolean f = false;

        try {
            String query = "insert into quiz(title,markforeach,totalque,time,intro,rid) values(?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, quiz.getTitle());
            ps.setInt(2, quiz.getMarkforeach());
            ps.setInt(3, quiz.getTotalque());
            ps.setString(4, quiz.getTime());
            ps.setString(5, quiz.getIntro());
            ps.setInt(6, quiz.getRid());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean saveQuetions(Questions questions) {
        boolean f = false;

        try {
            String query = "insert into questions(eid,qno,ans,question) values(?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setInt(1, questions.getEid());
            ps.setInt(2, questions.getQno());
            ps.setString(3, questions.getAns());
            ps.setString(4, questions.getQuestion());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean saveAnswer(Answer answer) {
        boolean f = false;

        try {
            String query = "insert into answer(queNo,optionNo,eid) values(?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setInt(1, answer.getQueno());
            ps.setInt(2, answer.getOptionNo());
            ps.setInt(3, answer.getEid());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean saveOption(Options option) {
        boolean f = false;

        try {
            String query = "insert into options(`option`,`qno`,`eid`) values(?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, option.getOption());
            ps.setInt(2, option.getQno());
            ps.setInt(3, option.getEid());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Quiz getQuizByTitleAndIntro(String title, String intro) {

        Quiz quiz = null;
        try {
            Thread.sleep(2000);

            String query = "select * from quiz where title = ? and intro = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, intro);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                quiz = new Quiz();

                String qtitle = set.getString("title");
                quiz.setTitle(qtitle);

                quiz.setEid(set.getInt("eid"));
                quiz.setMarkforeach(set.getInt("markforeach"));
                quiz.setTotalque(set.getInt("totalque"));
                quiz.setTime(set.getString("totalque"));
                quiz.setIntro(set.getString("intro"));
                quiz.setDate(set.getTimestamp("date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return quiz;
    }

    public List<Quiz> getAllQuiz(int id) {
        List<Quiz> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from quiz where rid = ?");
            ps.setInt(1, id);

            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int eid = set.getInt("eid");
                String title = set.getString("title");
                int markforeach = set.getInt("markforeach");
                int totalque = set.getInt("totalque");
                String time = set.getString("time");
                String intro = set.getString("intro");
                Timestamp date = set.getTimestamp("date");
                int rid = set.getInt("rid");

                Quiz quiz = new Quiz(eid,title, markforeach, totalque, time, intro, date, rid);
                list.add(quiz);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List<Quiz> getAllQuiz() {
        List<Quiz> list = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("select * from quiz");

            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int eid = set.getInt("eid");
                String title = set.getString("title");
                int markforeach = set.getInt("markforeach");
                int totalque = set.getInt("totalque");
                String time = set.getString("time");
                String intro = set.getString("intro");
                Timestamp date = set.getTimestamp("date");
                int rid = set.getInt("rid");

                Quiz quiz = new Quiz(eid,title, markforeach, totalque, time, intro, date, rid);
                list.add(quiz);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    public boolean deleteQuiz(int id)
    {
        boolean f = false;
        
        try {
            String q = "delete from quiz where eid = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            
            ps.executeUpdate();
            f = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public Quiz getQuizByQuizId(int q_id)
    {
        Quiz quiz = null;
        String q = "select * from quiz where eid = ?";
        try 
        {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, q_id);
            ResultSet set = p.executeQuery();
            
            if(set.next())
            {
                int eid = set.getInt("eid");
                String title = set.getString("title");
                int markforeach = set.getInt("markforeach");
                int totalque = set.getInt("totalque");
                String time = set.getString("time");
                String intro = set.getString("intro");
                Timestamp date = set.getTimestamp("date");
                int rid = set.getInt("rid");
                
                 quiz = new Quiz(eid, title, markforeach, totalque, time, intro, date, rid);
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return quiz;
    }
    

}
