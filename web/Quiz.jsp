<%-- 
    Document   : Recruiter
    Created on : 10-Oct-2022, 12:25:15 AM
    Author     : harshal
--%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page errorPage="ErrorPage.jsp" %>

<%
    Recruiters rec = (Recruiters) session.getAttribute("currentRecruiter");
    Quiz qz = (Quiz) session.getAttribute("currentAllQuiz");

    if (rec == null) {
        response.sendRedirect("index.jsp");
    } else if (qz != null) {
        response.sendRedirect("QuestionPaper.jsp");
    }
%>
<%@page import="com.quizz.entites.Recruiters"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz</title>
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
            <div class="table-bg banner-background">
                <%@include file="navbar.jsp" %>
                <hr>
                <div class="row">
                    <div class="col-md-6 text-center py-xl-5">
                        <h2><img src="img/quiz.svg"> Multiple Choice Question's</h2>
                        <p>Use this test maker to create a multiple choice test and inspire learning in a fun and engaging way</p>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="Study_Img/study3.png" style="height: 300px;">
                    </div>
                </div>
            </div>
        </div>

        <div class="que">
            <div class="container py-xl-5">
                <form id="quizform" action="QuetionPaperServlet" method="post">
                    <div class="col-md-6 offset-3">
                        <div class="card sub-card">
                            <div class="card-header text-center bg2">
                                <img src="img/Createnewquiz.svg" alt="alt"/>
                                <h3>Create New Quiz</h3>
                            </div>
                            <div id="quizbody" class="quizbody">
                                <div class="card-body  px-md-5">
                                    <div class="form-group my-4">
                                        <input type="text" class="form-control" placeholder="Quizz title" name="qTitle" required>
                                    </div>

                                    <div class="form-group my-4">
                                        <input type="text" class="form-control" placeholder="Marks for each question" name="qMarkEach" required>
                                    </div>

                                    <div class="form-group my-4">
                                        <input type="number" class="form-control" placeholder="Time for Quizz" name="qTime" required>
                                    </div>

                                    <div class="form-group my-4">
                                        <input type="text" class="form-control" placeholder="Introduction" name="qIntro" required>
                                    </div>


                                    <div class="form-group my-4">
                                        <input type="text" id="qTotalQue" class="form-control" name="qTotalQue" placeholder="Total Number of questions" value="" required>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" id="gQuiz" class="btn btn-outline-dark">Generate</button>
                                    </div>
                                </div>
                            </div>
                            <div id="quizloader" class="my-4">
                                <div class="d-flex justify-content-center">
                                    <div class="spinner-border" role="status" style="width: 5rem; height: 5rem;">
                                        <span class="visually-hidden" style="height: 100px">Loading...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!--javascript-->


        <%                Recruiters rc = (Recruiters) session.getAttribute("currentRecruiter");
            if (rc != null) {
        %><script>
            //var user = document.getElementById('lg-card').style.display = 'none';
            //var content = document.getElementById('content-card').style.display = 'block';
        </script><%
            }
        %>

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $('#generatebtn').hide()
            })
        </script>

        <script>
            $(document).ready(function () {


                $("#quizloader").hide();
                $("#displayAllQuiz").show();
                $('#displayRank').show();
                $('#displayFeedback').show();

                $("#quizform").on('submit', function (event)
                {
                    event.preventDefault();

                    var f = $(this).serialize();
//                                                let f = new FormData(this);
                    $("#quizbody").hide();
                    $("#quizloader").show();

                    $.ajax({
                        url: "QuetionPaperServlet",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR)
                        {
                            $("#quizloader").hide();
                            if (data.trim() === 'done')
                            {
                                console.log(data);
                                swal("Quiz successfully created !", "We are Redirecting to Login page...!", "success")
                                        .then((value) =>
                                        {
                                            window.location = "QuestionPaper.jsp";

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

        <!--<script>
        
            function addFields() {
        
                $('#generatebtn').show()
        
                // Generate a dynamic number of inputs
                var number = document.getElementById("qTotalQue").value;
                // Get the element where the inputs will be added to
                var container = document.getElementById("container");
                // Remove every children it had before
                while (container.hasChildNodes()) {
                    container.removeChild(container.lastChild);
                }
                for (i = 0; i < number; i++) {
                    // Append a node with a random text
                    // Create an <input> element, set its type and name attributes
                    var cont = document.createElement("div");
                    cont.classList = "container";
        
                    var row = document.createElement("div");
                    row.classList = "row";
        
                    var col = document.createElement("div");
                    col.classList.add("col-md-1", "text-end");
        
                    var mydiv = document.createElement("div");
                    mydiv.classList.add("col-md-11");
        
        
        //Form group 1
                    var fg0 = document.createElement("div");
                    fg0.classList.add("form-group", "my-3");
                    fg0.appendChild(document.createElement("br"));
        
                    var l = document.createElement("label");
                    l.classList.add("form-group");
                    l.innerHTML = i + 1;
                    fg0.appendChild(l);
        
                    var fg1 = document.createElement("div");
                    fg1.classList.add("form-group");
        
        
                    var r1 = document.createElement("input");
                    r1.type = "radio";
                    r1.classList.add("my-3");
                    r1.name = "rop1" + i;
                    fg1.appendChild(r1);
        
                    var fg2 = document.createElement("div");
                    fg2.classList.add("form-group");
        
                    var r2 = document.createElement("input");
                    r2.type = "radio";
                    r2.classList.add("my-3");
                    r2.name = "rop2" + i;
                    fg2.appendChild(r2);
        
        
                    var fg3 = document.createElement("div");
                    fg3.classList.add("form-group");
        
                    var r3 = document.createElement("input");
                    r3.type = "radio";
                    r3.classList.add("my-3");
                    r3.name = "rop3" + i;
                    fg3.appendChild(r3);
        
        
                    var fg4 = document.createElement("div");
                    fg4.classList.add("form-group");
        
                    var r4 = document.createElement("input");
                    r4.type = "radio";
                    r4.classList.add("my-3");
                    r4.name = "rop4" + i;
                    fg4.appendChild(r4);
        
        
        // End Form group 1
        
        
                    cont.appendChild(row);
                    row.appendChild(col);
                    row.appendChild(mydiv);
        
        
        
        //start form froup 2
                    row.style.border = '1px solid black';
                    row.style.padding = "10px";
        
                    var q = document.createElement("div");
                    q.classList.add("form-group");
                    var que = document.createElement("input");
                    que.type = "text";
                    que.classList.add("form-control");
                    que.classList.add("my-2");
                    que.setAttribute("placeholder", "Write Question here..");
                    que.name = "q" + i;
                    q.appendChild(que);
        
        
        
                    var fgo1 = document.createElement("div");
                    fgo1.classList.add("form-group");
                    var o1 = document.createElement("input");
                    o1.type = "text";
                    o1.classList.add("form-control");
                    o1.classList.add("my-2");
                    o1.setAttribute("placeholder", "Enter Option 1 here..");
                    o1.name = "op1" + i;
                    fgo1.appendChild(o1);
        
                    var fgo2 = document.createElement("div");
                    fgo2.classList.add("form-group");
                    var o2 = document.createElement("input");
                    o2.type = "text";
                    o2.classList.add("form-control");
                    o2.classList.add("my-2");
                    o2.setAttribute("placeholder", "Enter Option 2 here..");
                    o2.name = "op1" + i;
                    fgo2.appendChild(o2);
        
                    var fgo3 = document.createElement("div");
                    fgo3.classList.add("form-group");
                    var o3 = document.createElement("input");
                    o3.type = "text";
                    o3.classList.add("form-control");
                    o3.classList.add("my-2");
                    o3.setAttribute("placeholder", "Enter Option 3 here..");
                    o3.name = "op1" + i;
                    fgo3.appendChild(o3);
        
                    var fgo4 = document.createElement("div");
                    fgo4.classList.add("form-group");
                    var o4 = document.createElement("input");
                    o4.type = "text";
                    o4.classList.add("form-control");
                    o4.classList.add("my-2");
                    o4.setAttribute("placeholder", "Enter Option 4 here..");
                    o4.name = "op1" + i;
                    fgo4.appendChild(o4);
        
        //End form froup 2
        
                    col.appendChild(fg0)
                    col.appendChild(fg1)
                    col.appendChild(fg2)
                    col.appendChild(fg3)
                    col.appendChild(fg4)
        
        
        
                    mydiv.appendChild(document.createTextNode("Question " + (i + 1)));
                    mydiv.appendChild(q)
                    mydiv.appendChild(fgo1)
                    mydiv.appendChild(fgo2)
                    mydiv.appendChild(fgo3)
                    mydiv.appendChild(fgo4)
        
        
        
        
                    container.appendChild(row);
                    // Append a line break 
                    container.appendChild(document.createElement("br"));
        
                }
            }
        
        
        </script>-->
    </body>
</html>
