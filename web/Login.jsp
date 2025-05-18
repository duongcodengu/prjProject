

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form action="login" method="post">
            <h3>Login Here</h3>
           <p style="color: red">${ms}</p>
            <label for="username">Username</label>
            <input type="text" placeholder="Email or Phone" id="username" name="username">

            <label for="password">Password</label>
            <input type="password" placeholder="Password" id="password" name="password">

            <button>Log In</button>
            <p class="social-text"> Login with a social media account</p>
            <div class="social-icons">
                <button class="social-icon fb"><i class="fa-brands fa-facebook"></i></button>
                <button class="social-icon tw"><i class="fa-brands fa-twitter"></i></button>
                <button class="social-icon in"><i class="fa-brands fa-instagram"></i></button>
            </div>
                
            <p class="social-text">  <a href="Register.jsp">   Register </a></p>
        </form>
    </body>
</html>
