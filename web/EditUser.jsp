<%-- 
    Document   : EditUser
    Created on : 30-Oct-2022, 12:20:48 PM
    Author     : harshal
--%>

<%@page import="com.quizz.entites.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <title>Edit Profile</title>
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
    </style>    
    <body>
        <div class="home">
            <div class="table-bg">
                <%@include file="navbar.jsp" %>
                <hr>
            </div>
            <!--Register-->
            <div id="register-card" class="col-md-6 text-center py-xl-5 offset-3">
                <div class="card sub-card">

                    <div class="card-body">
                        <img src="img/signup.gif" style="height: 100px;" alt="alt"/>
                        <h3><img src="img/reg.svg" alt="alt"/> Edit Profile</h3>
                        <em>Please Edit Carefully !!!</em>
                        <form id="regform" action="EditProfileServlet" method="post">

                            <div class="form-group my-4">
                                <input type="hidden" id="id" name="id" class="form-control"value="<%= user.getUid()%>" />
                            </div>

                            <div class="form-group my-4">
                                <input type="text" id="uname" name="name" class="form-control" placeholder="Enter name" value="<%= user.getUname()%>" required autocomplete="off"/>
                            </div>

                            <div class="form-group my-4">
                                <input type="email" id="uemail" name="email" class="form-control" placeholder="Enter Email" value="<%= user.getUemail()%>" required/>
                            </div>

                            <div class="form-group my-4">
                                <input type="text" id="umobile" name="mobile" class="form-control" placeholder="Enter Mobile" value="<%= user.getUmobile()%>" required/>
                            </div>

                            <div class="row">
                                <div class="col-md-6">

                                    <div class="form-group ">
                                        <input type="number" id="uage" name="age" class="form-control" placeholder="Enter Age" value="<%= user.getUage()%>" required/>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group text-start">
                                        <label>Select Gender</label>
                                        &nbsp;&nbsp;&nbsp; 
                                        <input type="radio" id="mgender" name="gender" value="Male" required/> Male   &nbsp;&nbsp;&nbsp; 
                                        <input type="radio" id="fgender" name="gender" value="Female" required/> Female <br/>   
                                    </div>
                                </div>
                            </div>

                            <div class="form-group my-2 text-start">
                                <label class="my-2">Address</label><br>
                                <input type="text" id="uaddress" name="address" class="form-control" placeholder="Street Address"  value="<%= user.getUaddress()%>" required/>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group ">
                                        <input type="text" id="ucity" name="city" class="form-control" placeholder="Enter City"  value="<%= user.getUcity()%>" required/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" id="ustate" name="state" class="form-control" placeholder="Enter State" value="<%= user.getUstate()%>"  required/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group my-2">
                                        <input type="text" id="ucountry" name="country" class="form-control" placeholder="Enter Country"  value="<%= user.getUcountry()%>" required/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group my-2">
                                        <input type="text" id="uzipcode" name="zipcode" class="form-control" placeholder="Enter Postal Code" value="<%= user.getUzipcode()%>"  required/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group my-2 text-end">
                                <input type="password" id="upassword" name="password" class="form-control"  placeholder="Enter Password"  value="<%= user.getUpassword()%>"  required/>
                                <label id="message"></label>
                            </div>

                            <div class="form-group my-2 text-end">
                                <input type="password" id="uconfirmpassword" name="confirmpassword" class="form-control" style="" placeholder="Confirm Password"  value="<%= user.getUpassword()%>" required/>
                                <label id="message2" style="color: red"></label>
                            </div>
                            <button type="submit" id="regbtn" class="btn table-bg my-2">Submit</button>
                        </form>
                    </div>
                </div>
            </div>

            <!--end of Register-->
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
                        url: "EditProfileServlet",
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
                                                window.location = "User.jsp";

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


    </body>
</html>
