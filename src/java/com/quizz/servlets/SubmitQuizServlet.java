/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.quizz.servlets;

import com.quizz.dao.AnswerDao;
import com.quizz.dao.HistoryDao;
import com.quizz.dao.QuestionDao;
import com.quizz.dao.QuizDao;
import com.quizz.entites.History;
import com.quizz.entites.Questions;
import com.quizz.entites.Users;
import com.quizz.entites.Quiz;
import com.quizz.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class SubmitQuizServlet extends HttpServlet {

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
            int qid = Integer.parseInt(request.getParameter("q_id"));
            int marks = 0;
            int right = 0;
            int wrong = 0;
            HttpSession s = request.getSession();

//            out.print(qid);
            QuestionDao qDao = new QuestionDao(ConnectionProvider.getConnection());
            List<Questions> qList = qDao.getQuestionsByQno(qid);
//            out.println(qList.);
            ArrayList<String> option = new ArrayList<>();
            for (Questions q : qList) {
                String qno = "op1" + q.getQno();
                String o1 = request.getParameter(qno);
//                out.print(o1);
                String Ans = "";

                for (int i = 1; i <= 4; i++) {

                    if ("1".equals(o1)) {
                        Ans = "1";
                    } else if ("2".equals(o1)) {
                        Ans = "2";
                    } else if ("3".equals(o1)) {
                        Ans = "3";
                    } else if ("4".equals(o1)) {
                        Ans = "4";
                    }
                    else
                    {
                        Ans = "0";
                    }
                }
                    option.add(Ans);
//                out.print(Ans+"<br>");

                AnswerDao dao = new AnswerDao(ConnectionProvider.getConnection());
                int correctAns = (dao.getAnswerByQnoAndEid(q.getQno(), qid));

                if (correctAns == Integer.parseInt(Ans)) {
                    marks++;
                    right++;
                } else {
                    wrong++;
                }
            }
                s.setAttribute("Options", option);

            QuizDao dao = new QuizDao(ConnectionProvider.getConnection());
            Quiz quiz = dao.getQuizByQuizId(qid);

           
            Users user = (Users) s.getAttribute("currentUser");
            marks = marks * quiz.getMarkforeach();
            float totalmarks = quiz.getMarkforeach()*quiz.getTotalque();
           
            float percentage = (float)(marks / totalmarks) * 100;
//            out.print(per);
            HistoryDao hdao = new HistoryDao(ConnectionProvider.getConnection());
            
            int uid = user.getUid();
            History history = new History(uid, qid, marks, right, wrong,percentage);
            hdao.saveHistory(history);

            s.setAttribute("marks", marks);
            s.setAttribute("quizId", qid);

            if (marks >= 0) {
                out.print("done");
            } else {
                out.print("Error");
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
