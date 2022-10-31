function signIn()
{
    var wel = document.getElementById('welcome-card');
    var login = document.getElementById('login-card');
    var reg = document.getElementById('register-card');

    wel.style.display = 'none';
    login.style.display = 'block';
    reg.style.display = 'none';
}

function register()
{
    var wel = document.getElementById('welcome-card');
    var login = document.getElementById('login-card');
    var reg = document.getElementById('register-card');

    wel.style.display = 'none';
    login.style.display = 'none';
    reg.style.display = 'block';
}

function chkUser()
{
    alert("het")
    var user = document.getElementById('lg-card');
    var content = document.getElementById('content-card');
    content.style.display = 'block';
    user.style.display = 'none';


}

function invaliddetails()
{
    alert("hey")
}
//
//function addNewHBField() {
//  // console.log("Adding new fiield")
//
//  let newNode = document.createElement("input");
//  newNode.classList.add("form-control");
//  newNode.classList.add("hbField");
//  newNode.classList.add("mt-2");
//  newNode.setAttribute("placeholder", "Enter here");
//
//  let hbob = document.getElementById("hb");
//  let hbAddButtonob = document.getElementById("hbAddButton");
//
//  hbob.insertBefore(newNode, hbAddButtonob);
//}

