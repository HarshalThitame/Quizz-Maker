<%-- 
    Document   : Rank
    Created on : 17-Oct-2022, 10:05:30 PM
    Author     : harshal
--%>

<%@page import="com.quizz.dao.UserDao"%>
<%@page import="com.quizz.dao.QuizDao"%>
<%@page import="java.util.List"%>
<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.HistoryDao"%>
<%@page import="com.quizz.entites.Recruiters"%>
<%@page import="com.quizz.entites.History"%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>

<%
    Recruiters rec = (Recruiters) session.getAttribute("currentRecruiter");

    if (rec == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>

    </head>
    <style>
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
    </style>
    <body>
        <div class="home pb-4">
            <div class="table-bg">
                <%@include file="navbar.jsp" %>
                <hr>
            </div>
                
            <div class="row">
                <div class="col-md-2">
                    <div class="d-flex align-items-center justify-content-center" style="height: 100%;align-content: center;">
                        <img class="my-4" src="Study_Img/study6.png" alt="alt" style="height: 300px;" />
                    </div>
                </div>
                <div class="col-md-10">

                    <div class="container m-0">
                        <h2 class="text-center fs-1 py-4"><img src="img/historyname.svg" alt="alt"/>History</h2>

                        <div class="bg1 rounded">                            
                            <h2 class="text-center fs-1 my-4 text-primary "><img src="img/Rank.svg" alt="alt"/>Ranking</h2>
                        </div>
                        <div class="sub-card table-wrapper-scroll-y my-custom-scrollbar">

                            <%
                                QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());
                                List<Quiz> qList = qDao.getAllQuiz();
                                for (Quiz quiz : qList) {
                            %>
                            <div class="bg2 m-4">
                                <h2 class="fs-4 px-md-5">Quiz Title : <label class="fs-4 py-2 text-primary"><%= quiz.getTitle()%></label></h2>
                            </div>

                            <table class="table table-bg text-center table-bordered table-striped mb-4 m-0 p-0">
                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th scope="col">Rank</th>
                                        <th scope="col">Student Name</th>
                                        <th scope="col">Quiz Introduction</th>
                                        <th scope="col">Total Questions</th>
                                        <th scope="col">Right Answer</th>
                                        <th scope="col">Wrong Answer</th>
                                        <th scope="col">Total Score</th>
                                        <th scope="col">Percentage</th>
                                        <th scope="col">Time</th>
                                        <th scope="col">Date</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        int i = 1;
                                        HistoryDao dao = new HistoryDao(ConnectionProvider.getConnection());
                                        List<History> list = dao.getUsersHistoryByQuizId(quiz.getEid());
                                        for (History h : list) {

                                            //                                QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());
                                            //                                Quiz quiz = qDao.getQuizByQuizId(h.getEid());
                                            UserDao uDao = new UserDao(ConnectionProvider.getConnection());
                                            Users user = uDao.getUserByUserId(h.getUid());
                                    %>
                                    <tr>

                                        <th scope="row" class="bg-light"><%= i%></th>
                                        <td><%= user.getUname()%></td>
                                        <td><%= quiz.getIntro()%></td>
                                        <td><%= quiz.getTotalque()%></td>
                                        <td><%= h.getRight()%></td>
                                        <td><%= h.getWrong()%></td>
                                        <td><%= h.getScore()%></td>
                                        <td class="bg-light text-primary"><%= h.getPercentage()%> %</td>
                                        <td><%= quiz.getTime()%> Min</td>
                                        <td><%= h.getHdate().toLocalDateTime().toLocalDate().toString()%></td>


                                        <%
                                                i++;
                                            }
                                        %>
                                    </tr>
                                </tbody>
                            </table>
                            <hr>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <script>
            function deletebtn(hid)
            {
                //    console.log(pid+ " , "+uid);


                const d = {
                    hid: hid
                }

                $.ajax({
                    url: "HistoryDeleteServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() == 'done')
                        {
                            swal("Deleted !", "Successfully Deleted !!!", "warning")
                                    .then((value) => {
                                        location.reload();
                                    });

                        } else
                        {
                            swal("Sorry!", "Something went wrong !!!", "Error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Sorry!", "Something went wrong !!!", "Error");
                    }

                })
            }
        </script>
    </body>
</html>
