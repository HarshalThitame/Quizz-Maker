<%-- 
    Document   : StartQuiz
    Created on : 14-Oct-2022, 6:17:34 PM
    Author     : harshal
--%>

<%@page import="com.quizz.dao.HistoryDao"%>
<%@page import="com.quizz.entites.History"%>
<%@page import="com.quizz.dao.AnswerDao"%>
<%@page import="com.quizz.dao.QuestionDao"%>
<%@page import="java.util.List"%>
<%@page import="com.quizz.entites.Options"%>
<%@page import="com.quizz.dao.OptionDao"%>
<%@page import="com.quizz.entites.Questions"%>
<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.QuizDao"%>
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
    int Qid = Integer.parseInt(request.getParameter("quiz_id"));
    QuizDao dao = new QuizDao(ConnectionProvider.getConnection());
    Quiz quiz = dao.getQuizByQuizId(Qid);
    List option = (List) session.getAttribute("Options");

    HistoryDao hDao = new HistoryDao(ConnectionProvider.getConnection());
    History history = hDao.getHistoryByUserIdAndQuizId(user.getUid(), Qid);
//    out.println(option);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Paper</title>
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
        <div class="home">
            <div class="table-bg">
                <%@include file="navbar.jsp" %>
                <hr>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card sub-card my-4">
                            <div class="card-header text-center bg3">
                                <h3><img src="img/Question.svg"> Question Paper with Answer</h3>
                                <div class="row">
                                    <div class="col-md-6 text-start">
                                        <p class=""><%= quiz.getTitle()%>
                                        <hr>
                                        <h6>Read the instructions carefully.</h6>
                                        <ul>
                                            <li>Read the questions carefully.</li>
                                            <li>Consider the answer choices carefully</li>
                                            <li>All Questions are compulsory.</li>
                                            <li>Each question carries <%= quiz.getMarkforeach()%> marks</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 text-end">
                                        <p>Time : <%= quiz.getTime()%> Min<br>
                                        <hr>
                                        <h6>Total Questions : <%= quiz.getTotalque()%></h6>
                                        <!--<h6>Marks for each question : <%= quiz.getMarkforeach()%></h6>-->
                                        <h6>Total Marks : <%= quiz.getTotalque() * quiz.getMarkforeach()%></h6>
                                        <h6 class="text-success">Right Answer : <%= history.getRight()%></h6>
                                        <h6 class="text-danger">Wrong Answer : <%= history.getWrong()%></h6>
                                        <h6 class="text-primary">Marks Obtained : <%= (int) session.getAttribute("marks")%></h6>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body bg-light">
                                <div class="row">
                                    <input type="hidden" name="q_id" value=<%= String.valueOf(Qid)%>>

                                    <%
                                        QuestionDao qDao = new QuestionDao(ConnectionProvider.getConnection());
                                        List<Questions> qList = qDao.getQuestionsByQno(Qid);

                                    %>
                                    <div class="col-md-12">
                                        <%                                                int j = 0;

                                            for (Questions q : qList) {
                                                AnswerDao aDao = new AnswerDao(ConnectionProvider.getConnection());

                                                int correctAns = (aDao.getAnswerByQnoAndEid(q.getQno(), Qid));

                                        %>                                        
                                        <div class="que">
                                            <div class="form-group my-2">
                                                <h5><%= q.getQno()%>.&nbsp;&nbsp; <%= q.getQuestion()%></h5><br>
                                            </div>
                                        </div>
                                        <div class="option">
                                            <%
                                                OptionDao oDao = new OptionDao(ConnectionProvider.getConnection());
                                                List<Options> list = oDao.getOptionsByQno(q.getQno(), Qid);
//                                                                                                    out.print(list);
                                                int i = 1;
                                                int op = Integer.parseInt(option.get(j).toString());
                                                for (Options o : list) {
//                                                        out.println(j);

                                                    if (correctAns == i) {
                                            %>

                                            <h6 style="background-color: lightgreen;padding: 5px;"><input type="radio"checked disabled name="op1<%= o.getQno()%>" value=<%= i%>>&nbsp;&nbsp;<%= o.getOption()%></h6>
                                                <%
                                                } else if (op == i) {

                                                %>

                                            <h6 style="background-color: lightcoral;padding: 5px;"><input type="radio" name="op1<%= o.getQno()%>" disabled value=<%= i%>>&nbsp;&nbsp;<%= o.getOption()%></h6>
                                                <%
                                                } else {
                                                %>

                                            <h6><input type="radio" name="op1<%= o.getQno()%>" disabled value=<%= i%>>&nbsp;&nbsp;<%= o.getOption()%></h6>
                                                <%
                                                        }
                                                        i++;

                                                    }

                                                    if (correctAns == op) {
                                                %>
                                            <div class="bg2  px-md-5 fs-5">
                                                <label><img src="Study_Img/emoji1.png" alt="alt" style="height: 30px"/> Correct</label>
                                            </div>    
                                            <%
                                            } else {
                                            %>
                                            <div class="bg1  px-md-5 fs-5">
                                                <label><img src="Study_Img/emoji2.png" alt="alt" style="height: 30px"/> Incorrect</label>
                                            </div>    
                                            <%
                                                }
                                            %>
                                        </div>               
                                        <hr>
                                        <%j++;
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="text-center">     
                                    <a class="btn btn-outline-primary" href="Result.jsp">Result</a>
                                    <a class="btn btn-outline-primary" href="index.jsp">Home</a>
                                </div>
                            </div>
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


        <!--        <script>
                    $(document).ready(function () {
        
        
                        //                    $("#quizloader").hide();
                        //            $("#displayAllQuiz").show();
        
                        $("#submitform").on('submit', function (event)
                        {
                            event.preventDefault();
                            var f = $(this).serialize();
                            //                                                let f = new FormData(this);
                            //            $("#quizbody").hide();
                            //            $("#quizloader").show();
                            $.ajax({
                                url: "SubmitQuizServlet",
                                data: f,
                                type: 'POST',
                                success: function (data, textStatus, jqXHR)
                                {
                                    $("#quizloader").hide();
                                    if (data.trim() === 'done')
                                    {
                                        console.log(data);
                                        swal("Question Paper Submitted !", "We are Redirecting to Result page...!", "success")
                                                .then((value) =>
                                                {
                                                    window.location = "Result.jsp";
                                                });
                                    } else
                                    {
                                        swal(data);
                                    }
        
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    $("#quizbody").show();
                                    $("#quizloader").hide();
                                    swal("Something Went Wrong, try again...!!!");
                                },
                                processData: false
                            })
                        })
        
                    });
                </script>-->

        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..");
            });
        </script>

    </body>
</html>
