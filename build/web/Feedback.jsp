<%-- 
    Document   : Feedback
    Created on : 20-Oct-2022, 12:14:38 PM
    Author     : harshal
--%>

<%@page import="com.quizz.entites.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page errorPage="ErrorPage.jsp" %>
<%
    Users user = (Users) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>How To Create Feedback Form With Star Rating HTML</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>

    </head>
    <style>
        .home{
            min-height: 900px;
        }
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
    </style>    <style>
        /*        * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: arial;
                }*/
        .star-rating form {
            display: none;
        }
        .star-rating .thanks-msg {
            display: none;
            font-size: 20px;
            margin: 40px auto;
            color: #4caf50;
            background-color: rgba(76, 175, 80, 0.1411764705882353);
            padding: 8px 20px;
            border-left: 3px solid #4caf50;
            border-radius: 20px;
        }
        .star-rating input {
            /*display: none;*/
        }
        .star-rating {
            margin: 50px auto;
            display: table;
            width: 350px;
        }
        .star-rating label {
            padding: 10px;
            float: right;
            font-size: 44px;
            color: #eee;
        }
        .star-rating input:not(:checked) ~ label:hover,
        .star-rating input:not(:checked) ~ label:hover ~ label {
            color: #ffc107;
        }
        .star-rating input:checked ~ label {
            color: #ffc107;
        }
        .star-rating form .rating-reaction:before {
            width: 100%;
            float: left;
            color: #ffc107;
        }
        .star-rating #rating-1:checked ~ form .rating-reaction:before {
            content: "I hate it";
        }
        .star-rating #rating-2:checked ~ form .rating-reaction:before {
            content: "I don't like it";
        }
        .star-rating #rating-3:checked ~ form .rating-reaction:before {
            content: "It is good";
        }
        .star-rating #rating-4:checked ~ form .rating-reaction:before {
            content: "I like it";
        }
        .star-rating #rating-5:checked ~ form .rating-reaction:before {
            content: "I love it";
        }
        .star-rating input:checked ~ form {
            border-top: 1px solid #ddd;
            width: 100%;
            padding-top: 15px;
            margin-top: 15px;
            display: inline-block;
        }
        .star-rating form .rating-reaction {
            font-size: 24px;
            float: left;
            text-transform: capitalize;
        }
        .star-rating form .submit-rating {
            border: none;
            outline: none;
            background: #795548;
            color: #ffc107;
            font-size: 18px;
            border-radius: 4px;
            padding: 5px 15px;
            cursor: pointer;
            float: right;
        }
        form .submit-rating:hover {
            background-color: #333;
        }

    </style>
    <body>
        <form id="feedbackForm" action="FeedbackServlet" method="post">

            <div class="container mt-4">
                <div class="card sub-card">
                    <div class="card-body">
                        <h3 class="my-4 fs-2 text-primary text-center"> Send us your feedback...</h3>
                        <hr>
                        <div class="star-rating">
                            <div class="thanks-msg">Thanks for your feedback !!!</div>
                            <div class="star-input">
                                <input type="radio" name="rating" id="rating-5" value="5" style="display: none">
                                <label for="rating-5" class="fas fa-star"></label>
                                <input type="radio" name="rating" id="rating-4" value="4" style="display: none">
                                <label for="rating-4" class="fas fa-star"></label>
                                <input type="radio" name="rating" id="rating-3" value="3" style="display: none">
                                <label for="rating-3" class="fas fa-star"></label>
                                <input type="radio" name="rating" id="rating-2" value="2" style="display: none">
                                <label for="rating-2" class="fas fa-star"></label>
                                <input type="radio" name="rating" id="rating-1" value="1" style="display: none">
                                <label for="rating-1" class="fas fa-star"></label>

                                <!-- Rating Submit Form -->
                                <div class="container my-4">
                                    <span class="rating-reaction my-4"></span>

                                    <div class="form-group">
                                        <input class="form-control my-4" type="text" name="subject" id="subject" placeholder="Enter Subject">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="quizid" value=<%= Integer.parseInt(request.getParameter("quizid"))%>>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control my-4" id="message" name="message" rows="5" placeholder="Do you have any suggestions to make our website better ?"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-outline-primary  sub-card submit-rating">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<%@include file="Footer.jsp" %>--%>
        </form>



        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <script>
            $(document).ready(function () {

                $("#feedbackForm").on('submit', function (event)
                {
                    event.preventDefault();

                    var f = $(this).serialize();
//                    

                    $.ajax({
                        url: "FeedbackServlet",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR)
                        {
                            $("#quizloader").hide();
                            if (data.trim() === 'done')
                            {
                                console.log(data);
                                swal("Thank you for the Feedback !", "We are Redirecting to Home page...!", "success")
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
                            swal("Something Went Wrong, try again...!!!");
                        },
                        processData: false
                    })
                })

            });
        </script>


        <script>
            const btn = document.querySelector(".submit-rating");
            const thanksmsg = document.querySelector(".thanks-msg");
            const starRating = document.querySelector(".star-input");
            // Success msg show/hide
            //            btn.onclick = () => {
            //                starRating.style.display = "none";
            //                thanksmsg.style.display = "table";
            //                return false;
            //            };
        </script>
    </body>
</html>
