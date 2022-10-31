/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.quizz.servlets;

import com.quizz.dao.QuizDao;
import com.quizz.entites.Quiz;
import com.quizz.entites.Recruiters;
import com.quizz.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author harshal
 */
public class QuetionPaperServlet extends HttpServlet {

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
            String title = request.getParameter("qTitle");
            int markforeach = Integer.parseInt(request.getParameter("qMarkEach"));
            int noq = Integer.parseInt(request.getParameter("qTotalQue"));
            String time = request.getParameter("qTime");
            String intro = request.getParameter("qIntro");
            HttpSession s = request.getSession();

            Recruiters r1 =  (Recruiters) s.getAttribute("currentRecruiter");
            
            int rid = r1.getRid();
            
            Quiz quiz = new Quiz(title, markforeach, noq, time, intro, rid);

            QuizDao dq = new QuizDao(ConnectionProvider.getConnection());

            if (dq.saveQuiz(quiz)) {
//                out.print("done");
                s.setAttribute("currentQuiz", quiz);
                RequestDispatcher rd = request.getRequestDispatcher("/QuestionPaperServlet2");
                rd.forward(request, response);
            } else {
                out.print("error");
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
