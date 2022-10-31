<%-- 
    Document   : index
    Created on : 07-Oct-2022, 10:59:21 PM
    Author     : harshal
--%>

<%@page import="com.quizz.entites.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp" %>


<%
    Recruiters rec = (Recruiters) session.getAttribute("currentRecruiter");
    Users usr = (Users) session.getAttribute("currentUser");

    if (rec != null) {
        response.sendRedirect("Quiz.jsp");
    }

    if (usr != null) {
        response.sendRedirect("User.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Show</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        body
        {
            padding: 0;
            margin: 0;
            background-image: url("img/background.eps");
        }
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
        .sub-card{
            border-radius: 4px;
            background: #fff;
            box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
            transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
            /*padding: 44px 80px 18px 36px;*/
            cursor: pointer;
        }

        .sub-card:hover{
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
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

            <div id="lg-card" class="lg-card">
                <!--welcome card-->
                <div id="welcome-card" class="container text-center my-4 " style="display: block">
                    <div class="card my-4" style="padding: 10px;">
                        <h1 class="my-4">Welcome to Quiz Maker</h1>
                        <p>You can create a quiz for student or you can solve the quiz.</p>
                        <div class="container my-4">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card sub-card">
                                            <div class="card-body">
                                                <h3 class="fs-4 text-center text-success"> <img src="img/Recruiter.svg" alt="alt"/> For Recruiter</h3>
                                                <hr>
                                                <ul class="text-start">
                                                    <li>We have a confession to make: we absolutely love taking online quizzes; they’re really fun.</li>
                                                    <li>Creating those tests? Ugh, that can be a lot less fun when you’re not using the right tool.</li>
                                                    <li>We believe building your own quiz should be a breeze, not a chore. It should be a matter of clicks, drags, and drops, not rocket science. It shouldn’t eat up your precious time, and it should definitely not waste your energy. OK, we might be total form and quiz nerds, but we truly believe that creating quizzes should be just as fun as taking them.</li>
                                                    <li>Whether you’re a teacher looking to create online quizzes for the classroom, an HR manager searching for an online quiz creator for employee engagement, or a social media manager looking to keep your audience interested, Quiz buzz provides everything you need to make a fun quiz quickly and enjoy the process.</li>
                                                </ul>
                                                <hr>
                                                <h3 class="my-4 fs-5 text-primary">Want to create Quiz ?</h3>
                                                <div class="my-4">
                                                    <button type="button" class="btn btn-outline-dark sub-card" data-bs-toggle="modal" data-bs-target="#exampleModal">Create Quiz</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card sub-card">
                                            <div class="card-body">
                                                <h3 class="fs-4 text-center text-success"><img src="img/Student.svg" alt="alt"/> For Student</h3>
                                                <hr>
                                                <ul class="text-start">
                                                    <li>Want to know what your study and social behaviors say about you as a student? Take this quiz to find out what kind of student you are</li>
                                                    <li>Take Our Student Quiz to Know Yourself Better</li>
                                                    <li>Our thoughts and preferences about studying say a lot about us as students. Whether it’s deciding on a place to study or picking which social events to attend outside of class, you can learn to get to know you and your friends a little bit better when you take our “What type of student are you” student quiz!</li>
                                                    <li>It’s all about where and how you like to study, plus what motivates you to take home the top grades. We all learn in different ways, so it’s important to recognize these differences so that we can play to our strengths and develop our weaknesses. Plus, it’s good for teachers to know how their students learn best as well. That way they can tailor their teaching methods to the specific needs of their students.</li>
                                                    <br>
                                                </ul>
                                                <hr>
                                                <h3 class="my-4 fs-5 text-primary">Please Login or Register</h3>
                                                <div class="my-4">
                                                    <button onclick="signIn()" class="btn btn-outline-dark me-2 sub-card" >Sign In</button>
                                                    <a onclick="register()" class="btn btn-outline-dark sub-card    " aria-current="page" href="#">Register</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="container bg-light text-start px-md-5">
                        <h3 class="my-4 fs-3 text-center text-primary pt-4">ABOUT</h3>
                        <hr>
                        <div>
                            <h3 class="my-4 fs-5 text-success"> MCQ Quiz Generator Software</h3>
                            <p class="offset-1">Nowadays, e-Learning makes learning personal, convenient, simpler and more effective. The online quiz is an integral part of e-Learning that offers instant feedback to the students and at the same time, provide them feedback on improvement areas. Online quizzes are interesting, engaging and informative. Moreover, Quiz building software helps to create assessments so as to check on student’s performance faster and easier. It plays a significant role in the learning space especially in the e-learning domain because it offers a series of benefits to learners and trainers both.</p>
                            <p class="offset-1"> Today, there are so many quizzes building software in the market. But here, we discuss only the top 5 popular quiz building software.</p>
                            <h6 class="offset-1">1.Conduct Exam: </h6>
                            <p class="offset-1">It is very easy and simple to create quizzes by using online exam software quiz building software. This online software is a remarkable solution for schools/colleges and other educational institutes.The quiz building software can be run using web from any place and any time. The administrator of an online quiz system can create an online quiz system at any point in time. It generates questions in a few minutes. Question Paper Generator Software</p>
                            <br>
                            <p class="offset-1">The software allows adding the complexity of question-level using a multitude question like single choice, multiple choice, fill in the blanks, matcha with b, true-false, matrix match. The software allows exporting questions to PDF format after quizzes generated.</p>
                            <p class="offset-1">This software permits multiple users to share and modify quiz content at the same time. Students can choose the desired time slot. The users can give online quiz software any place and any time where they have the necessary equipment.</p>
                            <br>
                        </div>
                        <div>
                            <h3 class="my-4 fs-5 text-success"> Benefits  quiz building software</h3>
                            <ul class="offset-1">
                                <li>Create high-quality quizzes as per requirement</li>
                                <li>Conducting quizzes easier</li>
                                <li>Full freedom to create quiz at any point in time</li>
                                <li>Multiple types of question papers</li>
                                <li>Language-wise question papers</li>
                                <li>Sequence wise question paper</li>
                                <li>Module wise marks</li>
                                <li>Quizzes can be shared all users of the system</li>
                                <li>Instant scorecard</li>
                                <li>Result graded automatically</li>
                                <li>Opportunity to improve performance at home</li>
                            </ul>
                            <br>
                        </div>
                        <div>
                            <h3 class="my-4 fs-5 text-success"> Benefits  quiz building software</h3>
                            <p class="offset-1">Class Marker`s quiz building software works across all major operating systems, web browsers and devices. Institutes can easily create Quizzes with online assessment tool which can be taken by students across all popular platforms.</p>
                            <ul class="offset-1">
                                <li>Desktop: Windows, Linux, Chrome OS</li>
                                <li>Browsers: Internet Explorer, Firefox, Opera, Safari, Chrome</li>
                                <li>Portable: iPhone, iPad, Android and more</li>
                            </ul>
                            <br>
                        </div>
                        <div>
                            <h3 class="my-4 fs-5 text-success"> Test the Best</h3>
                            <p class="offset-1">We find amazing online quizzes created by users around the world. It has millions of learning resources created by teachers and students from around the world. We can easily search for quizzes in any subject we can think of, at any level we want.</p>                                
                            <p class="offset-1">This helps in the improvement of final exam performance. It helps to study the concepts, as well as to learn how to take the exam. It helps to monitor our progress and improve our planning. It makes creating, discovering and sharing quizzes easier.</p>
                            <br>
                        </div>
                    </div>
                </div>
                <!--end of welcome card-->



                <div class="container">
                    <div class="row">

                        <!--Login-->
                        <div id="login-card" class="col-md-6 text-center py-xl-5 offset-3" style="display: none" >
                            <div class="card sub-card">
                                <div class="card-header wrapper">
                                    <h4><img src="img/login.svg" alt="alt"/> Sign In</h4>
                                </div>

                                <%                                    String m = (String) session.getAttribute("msg");
                                    if (m != null) {
                                %>
                                <script>

                                    alert("Invalid Details")
                                    window.location = 'index.jsp'
                                </script>
                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>

                                <form action="LoginServlet" method="post">
                                    <div class="card-body">
                                        <img src="img/Login1.gif" alt="alt" style="height: 100px;"/>

                                        <div class="form-group my-4 px-md-5">
                                            <input type="email" id="email" name="loginemail" class="form-control" placeholder="Enter Email" required/>
                                        </div>
                                        <div class="form-group my-4 px-md-5">
                                            <input type="password" id="password" name="loginpassword" class="form-control" placeholder="Enter Password" required/>
                                        </div>
                                        <button type="submit" onclick="loginLoader()" id="loginbtn" class="btn wrapper my-2 sub-card">Submit</button>

                                    </div>
                                </form>
                                <div class="card-footer">
                                    <p>Don't have an account? <a onclick="register()" href="#">Register</a></p>
                                </div>
                            </div>
                        </div>

                        <!--end of login-->

                        <!--Register-->
                        <div id="register-card" class="col-md-6 text-center py-xl-5 offset-3" style="display: none">
                            <div class="card sub-card">

                                <div class="card-header table-bg">
                                    <h4><img src="img/reg.svg" alt="alt"/> Register</h4>
                                </div>
                                <div class="card-body">
                                    <img src="img/signup.gif" style="height: 100px;" alt="alt"/>
                                    <form id="regform" action="RegisterServlet" method="post">

                                        <div class="form-group my-4">
                                            <input type="text" id="uname" name="name" class="form-control" placeholder="Enter name" required autocomplete="off"/>
                                        </div>

                                        <div class="form-group my-4">
                                            <input type="email" id="uemail" name="email" class="form-control" placeholder="Enter Email" required/>
                                        </div>

                                        <div class="form-group my-4">
                                            <input type="text" id="umobile" name="mobile" class="form-control" placeholder="Enter Mobile" required/>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group ">
                                                    <input type="number" id="uage" name="age" class="form-control" placeholder="Enter Age" required/>
                                                </div>

                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group text-start">
                                                    <label>Select Gender</label>
                                                    &nbsp;&nbsp;&nbsp; 
                                                    <input type="radio" id="mgender" name="gender" value="Male"/> Male   &nbsp;&nbsp;&nbsp; 
                                                    <input type="radio" id="fgender" name="gender" value="Female"/> Female <br/>   
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group my-2 text-start">
                                            <label class="my-2">Address</label><br>
                                            <input type="text" id="uaddress" name="address" class="form-control" placeholder="Street Address" required/>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <input type="text" id="ucity" name="city" class="form-control" placeholder="Enter City" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" id="ustate" name="state" class="form-control" placeholder="Enter State" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group my-2">
                                                    <input type="text" id="ucountry" name="country" class="form-control" placeholder="Enter Country" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group my-2">
                                                    <input type="text" id="uzipcode" name="zipcode" class="form-control" placeholder="Enter Postal Code" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group my-2 text-end">
                                            <input type="password" id="upassword" name="password" class="form-control"  placeholder="Enter Password" required/>
                                            <label id="message"></label>
                                        </div>

                                        <div class="form-group my-2 text-end">
                                            <input type="password" id="uconfirmpassword" name="confirmpassword" class="form-control" style="" placeholder="Confirm Password" disabled required/>
                                            <label id="message2" style="color: red"></label>
                                        </div>


                                        <button type="submit" id="regbtn" class="btn table-bg my-2 disabled">Submit</button>


                                    </form>
                                </div>
                                <div class="card-footer">
                                    <p>If you already have an account <a onclick="signIn()" href="#">Sign In</a></p>
                                </div>

                            </div>
                        </div>

                        <!--end of Register-->

                        <div class="col-md-6 text-center py-xl-5 offset-3">
                            <div id="loader" class="card loader text-center border-0">
                                <div class="card-body">
                                    <div class="d-flex justify-content-center">
                                        <div class="spinner-border" role="status" style="width: 10rem; height: 10rem;">
                                            <span class="visually-hidden" style="height: 200px">Loading...</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer start-->

        <%@include file="Footer.jsp" %>


        <!--Login Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="RecruiterLoginServlet" method="post">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Login for Recruiter</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div id="loginmodal" class="modal-body">
                            <%                                    String msg = (String) session.getAttribute("msgmodal");
                                if (msg != null) {
                            %>
                            <script>

                                alert("Invalid Details")
                                window.location = 'index.jsp'
                            </script>
                            <%
                                    session.removeAttribute("msgmodal");

                                }
                            %>
                            <div class="card-body">
                                <div class="form-group my-4 px-md-5">
                                    <input type="email" id="rcemail" name="rcemail" class="form-control" placeholder="Enter Email" required/>
                                </div>
                                <div class="form-group my-4 px-md-5">
                                    <input type="password" id="rcpassword" name="rcpassword" class="form-control" placeholder="Enter Password" required/>
                                </div>
                            </div>
                            <p>Don't have an account? <a href="#!" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModal1">Register</a></p>
                        </div>
                        <div id="rloader" class="my-4">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status" style="width: 5rem; height: 5rem;">
                                    <span class="visually-hidden" style="height: 100px">Loading...</span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" onclick="rcloginLoader()" id="rcbtn" class="btn wrapper my-2">Login</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>





        <!-- Modal -->
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="rform" action="RecruiterRegisterServlet" method="post">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create an account</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div id="regmodal" class="modal-body">
                            <div class="card-body">
                                <div class="form-group my-4">
                                    <input type="text" id="rname" name="rname" class="form-control" placeholder="Enter name" required autocomplete="off"/>
                                </div>

                                <div class="form-group my-4">
                                    <input type="email" id="remail" name="remail" class="form-control" placeholder="Enter Email" required autocomplete="off"/>
                                </div>

                                <div class="form-group my-4">
                                    <input type="text" id="rmobile" name="rmobile" class="form-control" placeholder="Enter Mobile" required autocomplete="off"/>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">

                                        <div class="form-group ">
                                            <input type="number" id="rage" name="rage" class="form-control" placeholder="Enter Age" required autocomplete="off"/>
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group text-center">
                                            <label>Select Gender</label><br/> 
                                            &nbsp;&nbsp;&nbsp; 
                                            <input type="radio" id="mrgender" name="rgender" value="Male" required autocomplete="off"/> Male   &nbsp;&nbsp;&nbsp; 
                                            <input type="radio" id="frgender" name="rgender" value="Female" required autocomplete="off"/> Female   
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group my-2 text-end">
                                    <input type="password" id="rpassword" name="rpassword" class="form-control"  placeholder="Enter Password" required/>
                                </div>
                            </div>
                            <p>Already have an account? <a href="#!" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModal">Login</a></p>

                        </div>
                        <div id="regloader" class="my-4">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status" style="width: 5rem; height: 5rem;">
                                    <span class="visually-hidden" style="height: 100px">Loading...</span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button onclick="rcregLoader()" type="submit" id="rbtn" class="btn wrapper my-2">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--javascript-->




        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <!--Register--> 
        <script>
                                $(document).ready(function () {


                                    $("#loader").hide();
                                    $("#rloader").hide();
                                    $("#regloader").hide();

                                    $("#regform").on('submit', function (event)
                                    {
                                        event.preventDefault();

                                        var f = $(this).serialize();
//                                                let f = new FormData(this);
                                        $("#register-card").hide();
                                        $("#loader").show();

                                        $.ajax({
                                            url: "RegisterServlet",
                                            data: f,
                                            type: 'POST',
                                            success: function (data, textStatus, jqXHR) {
                                                $("#register-card").show();
                                                $("#loader").hide();
                                                if (data.trim() === 'done')
                                                {
                                                    console.log(data);
                                                    swal("Successfully Registered !", "We are Redirecting to Login page...!", "success")
                                                            .then((value) => {
//                                                window.location = "index.jsp";

                                                                var fields = document.getElementsByTagName('input'),
                                                                        length = fields.length;
                                                                while (length--) {
                                                                    if (fields[length].type === 'text') {
                                                                        fields[length].value = '';
                                                                    } else
                                                                    if (fields[length].type === 'email') {
                                                                        fields[length].value = '';
                                                                    } else
                                                                    if (fields[length].type === 'password') {
                                                                        fields[length].value = '';
                                                                    } else
                                                                    if (fields[length].type === 'number') {
                                                                        fields[length].value = '';
                                                                    } else
                                                                    if (fields[length].type === 'radio') {
                                                                        fields[length].checked = false;
                                                                    }
                                                                }

                                                                document.getElementById("message").innerHTML = '';
                                                                document.getElementById("uconfirmpassword").setAttribute("disabled", "")
                                                                document.getElementById('message2').innerHTML = "";

                                                                var wel = document.getElementById('welcome-card');
                                                                var login = document.getElementById('login-card');
                                                                var reg = document.getElementById('register-card');

                                                                wel.style.display = 'none';
                                                                login.style.display = 'block';
                                                                reg.style.display = 'none';
                                                            });
                                                } else
                                                {
                                                    swal(data);
                                                }

                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                                $("#register-card").show();
                                                $("#loader").hide();
                                                swal("Something Went Wrong, try again...!!!");
                                            },
                                            processData: false
                                        })
                                    })

                                });
        </script>

        <!--Recruiter register-->
        <script>
            $(document).ready(function () {



                $("#rform").on('submit', function (event)
                {
                    event.preventDefault();

                    var f = $(this).serialize();
//                                                let f = new FormData(this);
                    $.ajax({
                        url: "RecruiterRegisterServlet",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'done')
                            {
                                console.log(data);
                                swal("Successfully Registered !", "We are Redirecting to Login page...!", "success")
                                        .then((value) => {

//                                                document.getElementById('rbtn').setAttribute("data-bs-dismiss","modal")
                                            window.location = "index.jsp";
                                        });
                            } else
                            {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("Something Went Wrong, try again...!!!");
                        },
                        processData: false
                    })
                })

            });
        </script>

        <!--check password-->
        <script>
            $(document).ready(function ()
            {
                console.log("page is ready..");


                //check Password
                $('#upassword').keyup(function () {
                    if ($(this).val().length >= 4)
                    {
                        document.getElementById("message").style.color = 'green';
                        document.getElementById("uconfirmpassword").removeAttribute("disabled")

                        document.getElementById('message').innerHTML = "Strong Password !";
                    } else
                    {
                        document.getElementById("message").style.color = 'red';
                        $('#regbtn').addClass('disabled');
                        document.getElementById('message').innerHTML = "Weak Password !";
                        document.getElementById("uconfirmpassword").setAttribute("disabled", "")

                    }
                })


                //check Confirm password

                $('#uconfirmpassword').keyup(function () {
                    if ($(this).val() == $('#upassword').val())
                    {
                        document.getElementById("message2").style.color = 'green';

                        document.getElementById('message2').innerHTML = "Password match !";
                        $('#regbtn').removeClass('disabled');
                    } else
                    {
                        document.getElementById("message2").style.color = 'red';

                        document.getElementById('message2').innerHTML = "Passowrd does not match !";
                    }
                });







            });
        </script>



        <!--loader-->
        <script>

            function loginLoader()
            {
                $('#login-card').hide();
                $('#loader').show();
            }

            function rcloginLoader()
            {
                $('#loginmodal').hide();
                $('#rloader').show();
            }

            function rcregLoader()
            {
                $('#regmodal').hide();
                $('#regloader').show();
            }
        </script>
    </body>
</html>
