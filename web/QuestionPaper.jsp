<%-- 
    Document   : QuestionPaper
    Created on : 12-Oct-2022, 12:03:43 PM
    Author     : harshal
--%>

<%@page import="com.quizz.servlets.QuestionsServlet"%>
<%@page import="com.quizz.entites.Recruiters"%>
<%@page errorPage="ErrorPage.jsp" %>

<%
    Recruiters rec = (Recruiters) session.getAttribute("currentRecruiter");
    Quiz quiz = (Quiz) session.getAttribute("currentAllQuiz");
    
    if (rec == null) {
        response.sendRedirect("index.jsp");
    }
    
    if (quiz == null) {
        response.sendRedirect("quiz.jsp");
    }
%>
<%@page import="com.quizz.entites.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Paper</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>

    </head>
    <style>
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
    </style>
    <body>
        <div class="wrapper banner-background">
            <%@include file="navbar.jsp" %>
            <hr>
            <div class="col-md-6 text-center py-xl-5">
                <h2><img src="img/quiz.svg"> Quizz Buzz</h2>
                <p>ssd dsf sdf sd fds f sd f sd f  sdfsd fsdfds fdsdsfs dfdsfds fds.</p>
            </div>
        </div>
        

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form id="queform" action="QuestionsServlet" method="post">
                        <div id="quizbody" class="card">
                            <div class="card-header text-center wrapper">
                                <h2>Create Quetion Paper</h2>
                                <p class="text-start"><%= quiz.getIntro()%></p>

                            </div>
                            <div class="card-body">
                                <div class="my-4">
                                    <div id="container"/>
                                </div>
                                <button type="submit" id="generatebtn" class="btn btn-outline-dark" >Submit</button>
                            </div>

                        </div>
                        <div id="quizloader" class="my-4">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status" style="width: 5rem; height: 5rem;">
                                    <span class="visually-hidden" style="height: 100px">Loading...</span>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">

                        </div>
                </div>
                </form>
            </div>
        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="myjs.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    <script>
        $(document).ready(function () {
            
            
            $("#quizloader").hide();
//            $("#displayAllQuiz").show();
            
            $("#queform").on('submit', function (event)
            {
                event.preventDefault();
                
                var f = $(this).serialize();
//                                                let f = new FormData(this);
                $("#quizbody").hide();
                $("#quizloader").show();
                
                $.ajax({
                    url: "QuestionsServlet",
                    data: f,
                    type: 'POST',
                    success: function (data, textStatus, jqXHR)
                    {
                        $("#quizloader").hide();
                        if (data.trim() === 'done')
                        {
                            console.log(data);
                            swal("Question Paper successfully created !", "We are Redirecting to Home page...!", "success")
                                    .then((value) =>
                                    {
                                        window.location = "Quiz.jsp";
                                        
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
        $(document).ready(function () {
            $('#generatebtn').show();
            
            // Generate a dynamic number of inputs
            var number = <%= quiz.getTotalque()%>;
            
            console.log(number);
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
                fg0.classList.add("my-3", "text-end");
                fg0.appendChild(document.createElement("br"));
                
                var l = document.createElement("input");
                l.classList.add("disabled");
                l.name = "que" + i;
                l.value = i + 1;
                l.style.width = "30px";
                l.style.border = "none";
                l.setAttribute("disabled", "");
                fg0.appendChild(l);
                
                var fg1 = document.createElement("div");
                fg1.classList.add("form-group");
                
                
                var r1 = document.createElement("input");
                r1.type = "radio";
                r1.classList.add("my-3");
                r1.name = "rop" + i;
                r1.value = "1";
                r1.setAttribute("required", "");
                fg1.appendChild(r1);
                
                var fg2 = document.createElement("div");
                fg2.classList.add("form-group");
                
                var r2 = document.createElement("input");
                r2.type = "radio";
                r2.classList.add("my-3");
                r2.name = "rop" + i;
                r2.value = "2";
                r2.setAttribute("required", "");
                
                fg2.appendChild(r2);
                
                
                var fg3 = document.createElement("div");
                fg3.classList.add("form-group");
                
                var r3 = document.createElement("input");
                r3.type = "radio";
                r3.classList.add("my-3");
                r3.name = "rop" + i;
                r3.value = "3";
                r3.setAttribute("required", "");
                
                fg3.appendChild(r3);
                
                
                var fg4 = document.createElement("div");
                fg4.classList.add("form-group");
                
                var r4 = document.createElement("input");
                r4.type = "radio";
                r4.classList.add("my-3");
                r4.name = "rop" + i;
                r4.value = "4";
                r4.setAttribute("required", "");
                
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
                o1.setAttribute("required", "");
                
                fgo1.appendChild(o1);
                
                var fgo2 = document.createElement("div");
                fgo2.classList.add("form-group");
                var o2 = document.createElement("input");
                o2.type = "text";
                o2.classList.add("form-control");
                o2.classList.add("my-2");
                o2.setAttribute("placeholder", "Enter Option 2 here..");
                o2.name = "op2" + i;
                o2.setAttribute("required", "");
                fgo2.appendChild(o2);
                
                var fgo3 = document.createElement("div");
                fgo3.classList.add("form-group");
                var o3 = document.createElement("input");
                o3.type = "text";
                o3.classList.add("form-control");
                o3.classList.add("my-2");
                o3.setAttribute("placeholder", "Enter Option 3 here..");
                o3.name = "op3" + i;
                o3.setAttribute("required", "");
                fgo3.appendChild(o3);
                
                var fgo4 = document.createElement("div");
                fgo4.classList.add("form-group");
                var o4 = document.createElement("input");
                o4.type = "text";
                o4.classList.add("form-control");
                o4.classList.add("my-2");
                o4.setAttribute("placeholder", "Enter Option 4 here..");
                o4.name = "op4" + i;
                o4.setAttribute("required", "");
                fgo4.appendChild(o4);
                
                //End form froup 2
                
                col.appendChild(fg0);
                col.appendChild(fg1);
                col.appendChild(fg2);
                col.appendChild(fg3);
                col.appendChild(fg4);
                
                
                
                mydiv.appendChild(document.createTextNode("Question " + (i + 1)));
                mydiv.appendChild(q);
                mydiv.appendChild(fgo1);
                mydiv.appendChild(fgo2);
                mydiv.appendChild(fgo3);
                mydiv.appendChild(fgo4);
                
                
                
                
                container.appendChild(row);
                // Append a line break 
                container.appendChild(document.createElement("br"));
                
            }
        });
    </script>
</body>
</html>
