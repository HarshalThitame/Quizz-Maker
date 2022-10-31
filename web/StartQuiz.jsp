<%-- 
    Document   : StartQuiz
    Created on : 14-Oct-2022, 6:17:34 PM
    Author     : harshal
--%>

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
                                <h3><img src="img/Question.svg"> Question Paper</h3>
                                <div class="row">
                                    <div class="col-md-6 text-start">
                                        <p class=""><%= quiz.getTitle()%><br><%= quiz.getIntro()%></p>
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
                                            Remaining Time : <label  id="time" value="<%= quiz.getTime()%>"><%= quiz.getTime()%> Min</label></p>
                                        <hr>
                                        <h6>Total Questions : <%= quiz.getTotalque()%></h6>
                                        <h6>Marks for each question : <%= quiz.getMarkforeach()%></h6>
                                        <h6>Total Marks : <%= quiz.getTotalque() * quiz.getMarkforeach()%></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <form id="submitform" name="submitform" action="SubmitQuizServlet" method="post">
                                <div class="card-body bg-light">
                                    <div class="row">
                                        <input type="hidden" name="q_id" value=<%= String.valueOf(Qid)%>>

                                        <%
                                            QuestionDao qDao = new QuestionDao(ConnectionProvider.getConnection());
                                            List<Questions> qList = qDao.getQuestionsByQno(Qid);

                                        %>
                                        <div class="col-md-12">
                                            <%                                            for (Questions q : qList) {
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
                                                    for (Options o : list) {

                                                %>
                                                <h6><input type="radio" name="op1<%= o.getQno()%>" value=<%= i%>>&nbsp;&nbsp;<%= o.getOption()%></h6>
                                                    <%
                                                            i++;
                                                        }
                                                    %>
                                            </div>               
                                            <hr>
                                            <%                                            }
                                            %>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-outline-dark sub-card">Submit</button>
                                    </div>

                                </div>
                            </form>
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
        </script>

        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..");
                CreateTimer("timer", <%= Integer.parseInt(quiz.getTime())%> * 60);
            });
        </script>
        <script>
            var Timer;
            var TotalSeconds;
            function CreateTimer(TimerID, Time)
            {
                Timer = document.getElementById(time);
                TotalSeconds = Time;
                UpdateTimer()
                window.setTimeout("Tick()", 1000);
            }

            function Tick()
            {
                TotalSeconds -= 1;
                if (TotalSeconds == -1)
                {
                    alert("Time Up");
                    // Show alert Plus redirect any other page
                    document.submitform.submit();
                } else
                {
                    UpdateTimer()
                    window.setTimeout("Tick()", 1000);
                }
            }

            function UpdateTimer() {
                var totalmin = Math.trunc(TotalSeconds / 60);
                var sec = TotalSeconds % 60;
                if (sec < 10)
                {
                    sec = "0" + sec;
                }
                if (totalmin < 10)
                {
                    totalmin = "0" + totalmin;
                }
                if (totalmin < 5)
                {
                    document.getElementById('time').style.color = 'red';
                }
                document.getElementById('time').innerHTML = totalmin + " Min " + sec + " Sec";
            }
        </script>
    </body>
</html>
