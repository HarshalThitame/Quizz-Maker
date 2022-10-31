<%@page import="com.quizz.entites.Recruiters"%>
<%@page import="com.quizz.entites.Users"%>
<%
    Users ur = (Users) session.getAttribute("currentUser");
    Recruiters r = (Recruiters) session.getAttribute("currentRecruiter");
%>
<link href="mystyle.css" rel="stylesheet" type="text/css"/>
<link href="style.css" rel="stylesheet" type="text/css"/>
<style>

</style>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src="img/dashboard.svg"> Quizz Show</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><img src="img/home.svg">Home</a>
                </li>

                <li class="nav-item dropdown" style="display: none">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Subject
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="#">C</a></li>
                        <li><a class="dropdown-item" href="#">C++</a></li>
                        <li><a class="dropdown-item" href="#">Java</a></li>
                        <li><a class="dropdown-item" href="#">Python</a></li>
                        <li><a class="dropdown-item" href="#">.Net</a></li>
                        <li><a class="dropdown-item" href="#">Scala</a></li>
                        <li><a class="dropdown-item" href="#">MySQL</a></li>
                        <li><a class="dropdown-item" href="#">SQL Server</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown" style="display: none">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Difficulty Level
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="#">EASY</a></li>
                        <li><a class="dropdown-item" href="#">MEDIUM</a></li>
                        <li><a class="dropdown-item" href="#">HARD</a></li>

                    </ul>
                </li>
                <li id="displayAllQuiz" class="nav-item" style="display: none">
                    <a class="nav-link active" aria-current="page" href="QuizList.jsp"><img src="img/list.svg" alt="alt"/>All Quiz</a>
                </li>
                <li id="displayUserHistory" class="nav-item " style="display: none">
                    <a class="nav-link active" aria-current="page" href="UserHistory.jsp"><img src="img/history.svg" alt="alt"/>History</a>
                </li>
                <li id="displayRank" class="nav-item " style="display: none">
                    <a class="nav-link active" aria-current="page" href="Rank.jsp"><img src="img/rank.svg" alt="alt"/>Rank</a>
                </li>
                <li id="displayFeedback" class="nav-item " style="display: none">
                    <a class="nav-link active" aria-current="page" href="displayFeedback.jsp"><img src="img/feedback1.svg" alt="alt"/>Feedback</a>
                </li>
            </ul>

            <%
                if (ur != null) {
            %>


            <div class="nav-item dropdown">
                <a class="btn btn-light-dark dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="img/profile.svg" class="rotate" alt="alt"/>  &nbsp;&nbsp;  <%= ur.getUname()%>
                </a>
                <ul class="dropdown-menu table-bg" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item" href="EditUser.jsp">Edit Profile</a></li>
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>

            <%
            } else if (r != null) {
            %>
            <div class="nav-item dropdown">
                <a class="btn btn-light-dark dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="img/profile.svg" class="rotate" alt="alt"/>  &nbsp;&nbsp;  <%= r.getRname()%>
                </a>
                <ul class="dropdown-menu wrapper" aria-labelledby="navbarScrollingDropdown">
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </div>

            <%
            } else {
            %>
            <li class="d-flex">
                <button type="button" class="btn btn-outline-dark me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Recruiter ?</button>
                <!--                <a onclick="signIn()" class="btn btn-outline-dark me-2" aria-current="page" href="#">Sign In</a>
                                <a onclick="register()" class="btn btn-outline-dark" aria-current="page" href="#">Register</a>-->
            </li>
            <%
                }%>
        </div>
    </div>
</nav>