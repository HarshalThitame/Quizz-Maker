/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.quizz.servlets;

import com.mysql.cj.exceptions.ConnectionIsClosedException;
import com.quizz.dao.FeedbackDao;
import com.quizz.entites.Feedback;
import com.quizz.entites.Users;
import com.quizz.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author harshal
 */
public class FeedbackServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            int rating = Integer.parseInt(request.getParameter("rating"));
            int qid = Integer.parseInt(request.getParameter("quizid"));

            HttpSession s = request.getSession();
            Users user = (Users) s.getAttribute("currentUser");

            if (subject == "" && message == "") {
                Feedback fd1 = new Feedback(qid, user.getUid(), user.getUname(), user.getUemail(), rating);

                FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());

                if (dao.saveFeedbackWithoutSubFeedback(fd1)) {
                    out.print("done");
                } else {
                    out.print("error");
                }
            } else if (subject == "") {
                Feedback fd2 = new Feedback(qid, user.getUid(), user.getUname(), user.getUemail(), message, rating);

                FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());

                if (dao.saveFeedbackWithoutSubject(fd2)) {
                    out.print("done");
                } else {
                    out.print("error");
                }
            } else if (message == "") {
                Feedback fd3 = new Feedback();
                fd3.setEid(qid);
                fd3.setUid(user.getUid());
                fd3.setName(user.getUname());
                fd3.setEmail(user.getUemail());
                fd3.setSubject(subject);
                fd3.setRating(rating);

                FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());

                if (dao.saveFeedbackWithoutFeedback(fd3)) {
                    out.print("done");
                } else {
                    out.print("error");
                }
            } else {

//            out.print(name+" "+email+" "+message + " " + rating+" " +qid);
                Feedback feedback = new Feedback(qid, user.getUid(), user.getUname(), user.getUemail(), subject, message, rating);

                FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());

                if (dao.saveFeedback(feedback)) {
                    out.print("done");
                } else {
                    out.print("error");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
