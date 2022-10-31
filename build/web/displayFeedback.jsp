<%-- 
    Document   : displayFeedback
    Created on : 22-Oct-2022, 10:23:54 PM
    Author     : harshal
--%>

<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.FeedbackDao"%>
<%@page import="java.util.List"%>
<%@page import="com.quizz.dao.QuizDao"%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page import="com.quizz.entites.Recruiters"%>
<%@page import="com.quizz.entites.Feedback"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>
<%
    Recruiters rec = (Recruiters) session.getAttribute("currentRecruiter");
    Quiz qz = (Quiz) session.getAttribute("currentAllQuiz");

    if (rec == null) {
        response.sendRedirect("index.jsp");
    } else if (qz != null) {
        response.sendRedirect("QuestionPaper.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    </head>
    <style>
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
        tbody{
            height:200px;
            overflow-y:auto;
            width: 100%;
        }


    </style>
    <body>
        <div class="home">
            <div class="table-bg">
                <%@include file="navbar.jsp" %>
                <hr>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="d-flex align-items-center justify-content-center" style="height: 100%;align-content: center;">
                        <img class="my-4" src="Study_Img/study5.png" alt="alt" style="height: 300px;" />
                    </div>
                </div>
                <div class="col-md-10">

                    <div class="container m-0">
                        <h2 class="text-center fs-1 py-4"><img src="img/feedback2.svg" alt="alt"/> Feedback</h2>

                        <div class="sub-card table-wrapper-scroll sub-card-y my-custom-scrollbar">


                            <table class="table table-bg text-center table-bordered table-striped mb-0 m-0 p-0">
                            <thead>
                                <tr class="bg-dark text-white">
                                    <!--<th scope="col">Quiz Id</th>-->
                                    <th scope="col">Quiz Title</th>
                                    <th scope="col">Student Name</th>
                                    <th scope="col">Student Email</th>
                                    <th scope="col">Subject</th>
                                    <th scope="col">Feedback</th>
                                    <th scope="col">Rating</th>
                                    <th scope="col">Date</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <%
                                        int id = rec.getRid();
                                        QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());
                                        List<Quiz> qList = qDao.getAllQuiz(id);

                                        for (Quiz quiz : qList) {

                                            FeedbackDao fDao = new FeedbackDao(ConnectionProvider.getConnection());
                                            List<Feedback> list = fDao.getAllFeedback(quiz.getEid());
                                            //                            out.print(quizlist.size());
                                            for (Feedback q : list) {
                                                int rating = q.getRating();
                                    %>
                                    <tr>

                            <!--<th scope="row"><%= q.getEid()%></th>-->
                                        <td><%= quiz.getTitle()%></td>
                                        <td><%= q.getName()%></td>
                                        <td><%= q.getEmail()%></td>
                                        <td><%= q.getSubject()%></td>
                                        <td><%= q.getFeedback()%></td>
                                        <%
                                            if (rating == 0) {
                                        %>
                                        <td>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating > 0 && rating < 1) {
                                        %>
                                        <td>
                                            <i class='fas fa-star-half-alt' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating == 1) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating > 1 && rating < 2) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star-half-alt' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating == 2) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating > 2 && rating < 3) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star-half-alt' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating == 3) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating > 3 && rating < 4) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star-half-alt' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating == 4) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='far fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating > 4 && rating < 5) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star-half-alt' style='font-size:15px'></i>
                                        </td>
                                        <%
                                        } else if (rating == 5) {
                                        %>
                                        <td>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                            <i class='fas fa-star' style='font-size:15px'></i>
                                        </td>
                                        <%              }
                                        %>
                                        <td><%= q.getDate().toLocalDateTime().toLocalDate().toString()%></td>


                                        <%
                                                }
                                            }
                                        %>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    



            <!--Javascript-->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            <script src="myjs.js" type="text/javascript"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
