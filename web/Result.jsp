<%-- 
    Document   : Result
    Created on : 16-Oct-2022, 9:57:30 PM
    Author     : harshal
--%>

<%@page import="com.quizz.dao.HistoryDao"%>
<%@page import="com.quizz.helper.ConnectionProvider"%>
<%@page import="com.quizz.dao.QuizDao"%>
<%@page import="com.quizz.entites.Users"%>
<%@page import="com.quizz.entites.History"%>
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
    HttpSession s = request.getSession();
    s.getAttribute("marks");
%>
<%
    int Qid = (int) s.getAttribute("quizId");

    QuizDao dao = new QuizDao(ConnectionProvider.getConnection());
    Quiz quiz = dao.getQuizByQuizId(Qid);

    HistoryDao hDao = new HistoryDao(ConnectionProvider.getConnection());
    History history = hDao.getHistoryByUserIdAndQuizId(user.getUid(), Qid);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    </head>
    <style>
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
        .blink {

            transform: translate(-50%, -50%);
        }

        .italic {
            font-size: 5em;
            font-family: serif;
            color: #008000;
            animation: animate
                3s linear infinite;
        }
        table{
            width: 100%;
            font-family: "Times New Roman", Times, serif;
            font-style: italic;
        }

        @keyframes animate {
            0% {
                opacity: 0;
            }

            20% {
                opacity: 0.7;
            }

            80% {
                opacity: 0.7;
            }

            100% {
                opacity: 0;
            }
        }
    </style>    
    <body>
        <div class="home">
            <div class="table-bg">
                <%@include file="navbar.jsp" %>
                <hr>
            </div>
            <div class="container">
                <div class="row py-xl-5">
                    <div class="col-md-6 offset-3">
                        <div class="card sub-card">

                            <div class="card-body">

                                <h2 class="text-center"><img src="img/Result.svg"><br>Congratulations</h2>
                                <hr>

                                <p class="text-center">You have successfully completed the Test.</p>
                                <div class="row">
                                    <div class="col-md-8 offset-2">
                                        <div class="card">
                                            <div class="card-body">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>Time</td>
                                                            <td><%= quiz.getTime()%> Min</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total Questions:</td>
                                                            <td><%= quiz.getTotalque()%> </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Marks per Question:</td>
                                                            <td><%= quiz.getMarkforeach()%></td>
                                                        </tr>
                                                        <tr class="text-success">
                                                            <td>Right Answer:</td>
                                                            <td><%= history.getRight()%></td>
                                                        </tr>
                                                        <tr class="text-danger">
                                                            <td>Wrong Answer:</td>
                                                            <td><%= history.getWrong()%></td>
                                                        </tr>
                                                        <tr class="text-primary">
                                                            <td>Marks Obtained:</td>
                                                            <td><%= (int) s.getAttribute("marks")%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <em class="fs-5">See your Result <a href="ShowAnswer.jsp?quiz_id=<%= quiz.getEid()%>">Result</a></em>  
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <p class="text-center">Redirecting to Home page in 
                                    <label  id="time"></label></p>

                                <div class="text-center">
                                    <a href="User.jsp" class="btn btn-outline-dark sub-card">Home</a>
                                </div>
                                <hr>
                                <div class="text-end mt-4 blink">
                                    <em class="fs-5 italic"> <img src="img/feedback.svg" alt="alt"/> Feel free to drop us your <a href="Feedback.jsp?quizid=<%= quiz.getEid()%>">feedback</a></em>  <br>
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

        <script>
            $(document).ready(function () {
                $('#displayUserHistory').show();
            })
        </script>
        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..");
                CreateTimer("timer", 150);
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
                    window.location = "User.jsp";
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

                if (sec < 5)
                {
                    document.getElementById('time').style.color = 'red';
                }
                document.getElementById('time').innerHTML = sec + " Sec";
            }
        </script>
    </body>
</html>
