/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.quizz.dao;

import com.quizz.entites.Quiz;
import com.quizz.entites.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 *
 * @author harshal
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(Users user) {
        boolean f = false;
        try {

            Thread.sleep(2000);
            String query = "insert into users(uname,uemail,umobile,uage,ugender,uaddress,ucity,ustate,ucountry,uzipcode,upassword) values(?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, user.getUname());
            ps.setString(2, user.getUemail());
            ps.setString(3, user.getUmobile());
            ps.setString(4, user.getUage());
            ps.setString(5, user.getUgender());
            ps.setString(6, user.getUaddress());
            ps.setString(7, user.getUcity());
            ps.setString(8, user.getUstate());
            ps.setString(9, user.getUcountry());
            ps.setString(10, user.getUzipcode());
            ps.setString(11, user.getUpassword());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean updateUserProfile(Users user) {
        boolean f = false;
        try {

            Thread.sleep(2000);
            String query = "update users set uname = ?,uemail = ?,umobile = ?,uage = ?,ugender = ?,uaddress = ?,ucity = ?,ustate = ?,ucountry = ?,uzipcode = ?,upassword = ? where uid = ?";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, user.getUname());
            ps.setString(2, user.getUemail());
            ps.setString(3, user.getUmobile());
            ps.setString(4, user.getUage());
            ps.setString(5, user.getUgender());
            ps.setString(6, user.getUaddress());
            ps.setString(7, user.getUcity());
            ps.setString(8, user.getUstate());
            ps.setString(9, user.getUcountry());
            ps.setString(10, user.getUzipcode());
            ps.setString(11, user.getUpassword());
            ps.setInt(12, user.getUid());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Users getUserByEmailAndPassword(String email, String pass) {

        Users user = null;
        try {
            Thread.sleep(2000);

            String query = "select * from users where uemail = ? and upassword = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet set = ps.executeQuery();

            if (set.next()) {
                user = new Users();

                String name = set.getString("uname");
                user.setUname(name);

                user.setUid(set.getInt("uid"));
                user.setUemail(set.getString("uemail"));
                user.setUmobile(set.getString("umobile"));
                user.setUage(set.getString("uage"));
                user.setUgender(set.getString("ugender"));
                user.setUaddress(set.getString("uaddress"));
                user.setUcity(set.getString("ucity"));
                user.setUstate(set.getString("ustate"));
                user.setUcountry(set.getString("ucountry"));
                user.setUzipcode(set.getString("uzipcode"));
                user.setUpassword(set.getString("upassword"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public Users getUserByUserId(int u_id)
    {
        Users user = null;
        String q = "select * from users where uid = ?";
        try 
        {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, u_id);
            ResultSet set = p.executeQuery();
            
            if(set.next())
            {
                int uid = set.getInt("uid");
                String uname = set.getString("uname");
                String email = set.getString("uemail");
                String mobile = set.getString("umobile");
                String age = set.getString("uage");
                String gender = set.getString("ugender");
                String address = set.getString("uaddress");
                String city = set.getString("ucity");
                String state = set.getString("ustate");
                String country = set.getString("ucountry");
                String zipcode = set.getString("uzipcode");
                String password = set.getString("upassword");

                user = new Users(uid, uname, email, mobile, age, gender, address, city, state, country, zipcode, password);
                
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return user;
    }
    
    public Users getUserByUserId(int u_id,int e_id)
    {
        Users user = null;
        String q = "select * from users where uid = ? and eid = ?";
        try 
        {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, u_id);
            p.setInt(2, e_id);
            ResultSet set = p.executeQuery();
            
            if(set.next())
            {
                int uid = set.getInt("uid");
                String uname = set.getString("uname");
                String email = set.getString("uemail");
                String mobile = set.getString("umobile");
                String age = set.getString("uage");
                String gender = set.getString("ugender");
                String address = set.getString("uaddress");
                String city = set.getString("ucity");
                String state = set.getString("ustate");
                String country = set.getString("ucountry");
                String zipcode = set.getString("uzipcode");
                String password = set.getString("upassword");

                user = new Users(uid, uname, email, mobile, age, gender, address, city, state, country, zipcode, password);
                
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return user;
    }
    

}
