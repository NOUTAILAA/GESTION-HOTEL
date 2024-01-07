<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>NOUTIYAFH RESERVATION</title>
    <link rel="stylesheet" type="text/css" href="reservation.css">
    <style>
        center {
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
    </style>
</head>
<body>
<ul>
    <li><a href="index2.jsp">Home</a></li>
    <li><a href="Chambres3.jsp">Chambres</a></li>
    <li><a href="gallery.jsp" onclick="redirectToGallery()">Galerie</a></li>
    <li><a class="active" href="reservation.jsp" onclick="redirectToReservation()">Reservations</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    <li><a href="timeline2.jsp">About</a></li>
    <li style="float:right"><a href="index2.jsp">NOUTIYAFH HOTEL</a></li>
</ul>
<center>
    <form class="form" method="post" action="processReservation.jsp">
        <p class="title">Register</p>
        <p class="message">Signup now and get full access to our app.</p>

        <label>
            <input class="input" type="text" name="cin" placeholder="" required="">
            <span>Cin</span>
        </label>

        <div class="flex">
            <label>
                <input class="input" type="text" name="firstname" placeholder="" required="">
                <span>Firstname</span>
            </label>

            <label>
                <input class="input" type="text" name="lastname" placeholder="" required="">
                <span>Lastname</span>
            </label>
        </div>

        <label>
            <input class="input" type="email" name="email" placeholder="" required="">
            <span>Email</span>
        </label>

        <label>
            <input class="input" type="password" name="password" placeholder="" required="">
            <span>Password</span>
        </label>

        <label>
            <input class="input" type="password" name="confirmPassword" placeholder="" required="">
            <span>Confirm password</span>
        </label>

        <label>
            <input class="input" type="text" name="telephone" placeholder="" required="">
            <span>Téléphone</span>
        </label>

        <button class="submit" type="submit">Submit</button>
        <p class="signin">Already have an account? <a href="Connexion.jsp">Signin</a></p>

        <!-- Display error message if any -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.println("<p style='color: red;'>" + errorMessage + "</p>");
            }
        %>
    </form>
</center>
</body>
</html>
