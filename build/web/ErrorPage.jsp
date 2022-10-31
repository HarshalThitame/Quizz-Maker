<%-- 
    Document   : ErrorPage
    Created on : 23-Oct-2022, 11:17:31 AM
    Author     : harshal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="mystyle.css" rel="stylesheet" type="text/css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <style>
        .banner-background{
            clip-path: polygon(0 1%, 100% 0, 100% 90%, 80% 100%, 60% 91%, 40% 100%, 20% 91%, 0 100%);
            margin: 10px;
            min-height: 400px;
        }
        body{
            font-family: 'Nunito', sans-serif;
            padding: 50px;
        }
        .card{
            border-radius: 4px;
            background: #fff;
            box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
            transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
            padding: 44px 80px 18px 36px;
            cursor: pointer;
        }

        .card:hover{
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
        }

        .card h3{
            font-weight: 600;
        }

        .card img{
            position: absolute;
            top: 20px;
            right: 15px;
            max-height: 120px;
        }

        .card-1{
            background-image: url(https://ionicframework.com/img/getting-started/ionic-native-card.png);
            background-repeat: no-repeat;
            background-position: right;
            background-size: 80px;
        }

        
        .multicolor-text {
            text-align: center;
            font-size: 150px;
            font-weight: bold;
            background: linear-gradient(to left,
                violet,
                indigo,
                blue,
                green,
                yellow,
                orange,
                red);
            -webkit-background-clip: text;
            color: transparent;
        }

        @media(max-width: 990px){
            .card{
                margin: 20px;
            }
        }
        h1{
            font-size: 60px;
        }
        em{
            font-size: 40px;
        }

    </style>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-1">
                        <div class="multicolor-text">
                            404
                        </div>
                        <h1 class="text-center fw-bold">Ooopss ! Page Not Found.</h1>
                        <hr>
                        <em class="bg-light text-center">Sorry,  the page you're looking for doesn't exist. If you think something is broken , report a problem.</em>



                        <br>
                        <br>
                        <br>
                        <br>
                      
                        <div class="text-center">
                            <a class="btn btn-outline-primary fw-bold btn-lg" style="margin-right: 20px;" href="index.jsp" title="Home">Return Home</a>
                            <a class="btn btn-primary text-white fw-bold btn-lg" style="margin-left: 20px;" href="index.jsp">Report Problem</a>
                        </div>
                          <br>
                        <br>
                        <br>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
