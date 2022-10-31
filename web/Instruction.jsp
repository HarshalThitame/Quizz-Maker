<%-- 
    Document   : Instruction
    Created on : 18-Oct-2022, 10:07:13 PM
    Author     : harshal
--%>

<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.QuizDao"%>
<%@page import="com.quizz.entites.Users"%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>

<%
    Users user = (Users) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    int qid = Integer.parseInt(request.getParameter("quiz_id"));
    QuizDao dao = new QuizDao(ConnectionProvider.getConnection());
    Quiz quiz = dao.getQuizByQuizId(qid);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructions</title>
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
        <div class="container text-center py-xl-4">
            <h2>Assessment Info</h2>
            <h3 class="table-bg py-xl-2"><%= quiz.getTitle()%></h3>

            <div class="card">
                <div class="card-body">
                    <h4 class="text-info py-3">Instructions</h4>
                    <hr>
                    <div class="text-start fs-5">
                        <em class="text-success">Read the instructions carefully before starting assessment.</em>
                    </div>
                    <ol class="text-start h6 py-4" type="1">
                        <li>The examination will comprise of Objective type Multiple Choice Questions (MCQ's).</li>
                        <li>This assessment has a total of <%= quiz.getTotalque()%> questions.</li>
                        <li>All questions are compulsory and each carries <%= quiz.getMarkforeach()%> marks</li>
                        <li>This assessment takes about <%= quiz.getTime()%> Minutes to complete.</li>
                        <li>Please complete this assessment in one continuous browser session. You cannot pause restart or re-take it once you start the assessment.</li>
                        <li>This assessment takes about <%= quiz.getTime()%> to complete.</li>
                        <li>The total number of questions, duration of examination, will be different based on the course, the detail is available on your screen.</li>
                        <li>There will be NO NEGATIVE MARKING for the wrong answers..</li>
                    </ol>
                    <hr>

                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 offset-3">
                                <h4 class="text-info">Assessment Details</h4>
                                <hr>
                                <div class="row">
                                    <div class="col-md-4 text-start offset-2">
                                        <h6>Time</h6>
                                        <h6>Total Questions </h6>
                                        <h6>Marks for each question </h6>
                                        <h6>Total Marks </h6>

                                    </div>
                                    <div class="col-md-4 text-start offset-2">
                                        <div class="text-start h6">
                                            <h6><%= quiz.getTime()%> Min</h6>
                                            <h6><%= quiz.getTotalque()%></h6>
                                            <h6><%= quiz.getMarkforeach()%></h6>
                                            <h6><%= quiz.getTotalque() * quiz.getMarkforeach()%></h6>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <label class="text-muted"><input type="checkbox" name="condition" id="condition" onchange="document.getElementById('send').disabled = !this.checked;">  I agree to take this assessment based only on my immediate abilities also agree not to participate in any malpractice by copying taking external help, or using any additional resources to improve my performance</label>
                    <form action="StartQuiz.jsp">
                        <div class="form-group py-3">
                            <input type="hidden" id="Qid" name="quiz_id" value=<%= quiz.getEid()%>>
                            <button id="startbtn" class="btn btn-primary btn-lg" disabled>Start</button>
                        </div>
                    </form>
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
                        var checker = document.getElementById('condition');
                        var sendbtn = document.getElementById('startbtn');
                        checker.onchange = function () {
                            sendbtn.disabled = !this.checked;
                        };
        </script>
    </body>
</html>
