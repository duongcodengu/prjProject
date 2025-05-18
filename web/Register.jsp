

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style.css">
    </head>
    <body >
        <form action="register" method="post">
        < <h3>Register</h3>

    <label for="username">User name:</label>
    <input type="text" placeholder="Email or Phone" id="username" name="username" value="${user.name}" required />
    <p style="color: red">${ms}</p>
    <label for="password">Enter password:</label>
    <input type="password" placeholder="Password" id="password" name="password" required />

    <label for="name">Full Name:</label>
    <input type="text" placeholder="Nguyen Van A" id="name" name="name" required />

    <label for="phone">Enter Phone number:</label>
    <input type="text" placeholder="Phone number" id="phone" name="phone" pattern="[0-9]+" required />

    <label for="role">Select Role:</label>
    <select id="role" name="role" required>
        <option value="seller">Seller</option>
        <option value="buyer">Buyer</option>
    </select>
    <button type="submit">Register</button>
    

</form>
</body>
</html>
