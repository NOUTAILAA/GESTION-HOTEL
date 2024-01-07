<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>NOUTIYAFH RESERVATION</title>
    <link rel="stylesheet" type="text/css" href="formdeux.css">
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
    <li><a href="gallery.jsp" >Galerie</a></li>
    <li><a class="active" href="reservation.jsp" >Reservations</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    <li><a href="timeline2.jsp">About</a></li>
    <li style="float:right"><a href="index2.jsp">NOUTIYAFH HOTEL</a></li>
</ul>

<div class="container">
     <form method="post" action="processformdeux.jsp">
        <div class="card">
             
            <a class="singup">Formulaire De Réservation</a>
            <div class="inputBox1">
                <input type="text" name="cin" required="required">
                <span class="user">CIN</span>
            </div>

            <div class="inputBox">
                <input type="text" name="nomclient" required="required">
                <span>Nom Complet</span>
            </div>

            <div class="inputBox">
                <input type="date" name = "date_debut" required="required">
                <span>DATE DEBUT JJ/MM/AAAA</span>
            </div>
            <div class="inputBox">
                <input type="date" name = "date_fin" required="required">
                <span>DATE FIN</span>
            </div>
            <div class="inputBox">
                <input type="text" name = "nbr_chambres" required="required">
                <span>Nombre de chambres</span>
            </div>
          
<div class="inputBox">
    <select class="form-select" name = "type_chambre" required="required">
        <option selected disabled hidden></option>
        <option value="suite duplex">Suite Duplex</option>
        <option value="chambre de luxe">Chambre De Luxe  </option>
        <option value="chambre superieur">Chambre Supérieur</option>
        <option value="chambre classique">Chambre Classique</option>
    </select>
    <span>Type de chambre</span>
</div>


            

            <button class="enter">Reserver</button>

        </div>
         </form>
    </div>
    </body>
</html>