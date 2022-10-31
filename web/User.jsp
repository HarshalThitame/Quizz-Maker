<%-- 
    Document   : User
    Created on : 14-Oct-2022, 2:21:33 PM
    Author     : harshal
--%>

<%@page import="com.quizz.dao.FeedbackDao"%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.QuizDao"%>
<%@page import="com.quizz.entites.Users"%>
<%@page import="com.quizz.entites.Feedback"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>
<%
    Users user = (Users) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    </head>
    <style>
        .home{
            min-height: 100%;
        }
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
        .container{
            background-image: url('img/background.eps');
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
                        <img class="my-4" src="Study_Img/study2.png" alt="alt" style="height: 300px;" />
                    </div>
                </div>
                <div class="col-md-10">

                    <div class="container m-0">
                        <h2 class="text-center fs-1 py-4"><img src="img/quiz.svg" alt="alt"/> Start Your Quiz...</h2>
                        <div class="sub-card table-wrapper-scroll-y my-custom-scrollbar sub-card">

                            <table class="table table-bg rounded text-center table-bordered table-striped mb-0 m-0 p-0">
                                <thead>
                                    <tr class="bg-dark text-white">
                                        <!--<th scope="col">Quiz Id</th>-->
                                        <th scope="col">Title</th>
                                        <th scope="col">Mark</th>
                                        <th scope="col">Total Questions</th>
                                        <th scope="col">Time</th>
                                        <th scope="col">Introduction</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Rating</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        //                            int id = rec.getRid();
                                        QuizDao dao = new QuizDao(ConnectionProvider.getConnection());
                                        List<Quiz> quizlist = dao.getAllQuiz();
                                        //                            out.print(quizlist.size());
                                        for (Quiz q : quizlist) {
                                            FeedbackDao fDao = new FeedbackDao(ConnectionProvider.getConnection());
                                            Feedback feedback = fDao.getFeedback(q.getEid());
                                            List list = fDao.getRating(q.getEid());
                                            //                                out.print(list);

                                            int sum = (int) list.get(0);
                                            int count = (int) list.get(1);
                                            //                                
                                            //                                float rating = (float)(sum) / (float)(count);
                                            float rating = (float) 0.0;
                                            //                                out.print(sum+"<br>");
                                            //                                out.print(count+"<br>");
                                            if (sum == 0 || count == 0) {
                                                rating = (float) 0;
                                            } else {
                                                rating = (float) sum / count;

                                            }
                                            //                                out.print(rating + " " + sum + " " + count + "\n");
%>
                                    <tr>

                            <!--<th scope="row"><%= q.getEid()%></th>-->
                                        <td><%= q.getTitle()%></td>
                                        <td><%= q.getMarkforeach()%></td>
                                        <td><%= q.getTotalque()%></td>
                                        <td><%= q.getTime()%></td>
                                        <td><%= q.getIntro()%></td>
                                        <td><%= q.getDate().toLocalDateTime().toLocalDate().toString()%></td>

                                        <%
                                            if (feedback != null) {
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
                                        <%
                                            }
                                        } else {
                                        %>
                                        <td>No Rating</td>
                                        <%
                                            }
                                        %>
                                        <td>
                                            <a href="Instruction.jsp?quiz_id=<%= q.getEid()%>" class="float-right btn btn-primary btn-sm "><img src="img/start.svg"> Start </a>

                                        </td>

                                        <%
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

        <%@include file="Footer.jsp" %>


        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $('#displayUserHistory').show();

            })
        </script>

    </body>
</html>
