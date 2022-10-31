/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.quizz.servlets;

import com.quizz.dao.QuizDao;
import com.quizz.entites.Answer;
import com.quizz.entites.Options;
import com.quizz.entites.Questions;
import com.quizz.entites.Quiz;
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
public class QuestionsServlet extends HttpServlet {

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
            int count = 0;
            HttpSession s = request.getSession();

            Quiz quiz = (Quiz) s.getAttribute("currentAllQuiz");

            int no = quiz.getTotalque();
            int eid = quiz.getEid();
            int qno;
            try {
                for (int i = 0; i < no; i++) {
                    String Ans = "0";
                    String FinalAns = "";
                    qno = i + 1;

                    String qu = "q" + i;
                    String q = request.getParameter(qu);

                    String op1 = "op1" + i;
                    String option1 = request.getParameter(op1);

                    String op2 = "op2" + i;
                    String option2 = request.getParameter(op2);

                    String op3 = "op3" + i;
                    String option3 = request.getParameter(op3);

                    String op4 = "op4" + i;
                    String option4 = request.getParameter(op4);

                    String r = "rop" + i;

                    String ro = request.getParameter(r);

                    if ("1".equals(ro)) {
                        Ans = "1";
                        FinalAns = option1;

                    } else {
                    }
                    if ("2".equals(ro)) {
                        Ans = "2";
                        FinalAns = option2;
                    }
                    if ("3".equals(ro)) {
                        Ans = "3";
                        FinalAns = option3;
                    }
                    if ("4".equals(ro)) {
                        Ans = "4";
                        FinalAns = option4;
                    }
                    int ans = Integer.parseInt(Ans);
                    QuizDao dao = new QuizDao(ConnectionProvider.getConnection());

                    Questions question = new Questions(eid, qno, FinalAns,q);
                    Answer answer = new Answer(qno,Integer.parseInt(Ans),eid);

                    Options option;
                    option = new Options(option1, qno,eid);
                    dao.saveOption(option);
                    option = new Options(option2, qno,eid);
                    dao.saveOption(option);
                    option = new Options(option3, qno,eid);
                    dao.saveOption(option);
                    option = new Options(option4, qno,eid);
                    dao.saveOption(option);

                    if ((dao.saveQuetions(question)) && (dao.saveAnswer(answer))) {

                        count++;
                    } else {
                        count = 0;
                        break;
                    }
                }

                if (count > 0) {
                    out.print("done");
                    s.removeAttribute("currentQuiz");
                    s.removeAttribute("currentAllQuiz");
                    s.removeAttribute("currentAllQuiz");
                }
                else if(count == 0)
                {
                    out.print("error");
                }

            } catch (Exception e) {
                e.printStackTrace();
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
