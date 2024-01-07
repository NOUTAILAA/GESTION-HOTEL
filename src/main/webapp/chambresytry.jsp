<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>NOUTIYAFH RESERVATION</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="chambresytry.css">
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>

<%
    String reservationSuccess = (String) session.getAttribute("reservationSuccess");
    String reservationError = (String) session.getAttribute("reservationError");

    if (reservationSuccess != null) {
        if (reservationSuccess.equals("true")) {
%>
            <script>
                showAlert("Réservation réussie !");
            </script>
<%
        } else {
%>
            <script>
                showAlert("Échec de la réservation. Veuillez réessayer.");
            </script>
<%
        }
        session.removeAttribute("reservationSuccess");
        session.removeAttribute("reservationError");
    }
%>

<ul>
    <li><a href="index2.jsp">Home</a></li>
    <li><a href="Chambres3.jsp">Chambres</a></li>
    <li><a href="gallery.jsp" onclick="redirectToGallery()">Galerie</a></li>
    <li><a class="active" href="reservation.jsp" onclick="redirectToReservation()">Reservations</a></li>µ
      <li><a href="contact.jsp">Contact</a></li>
    <li><a href="timeline2.jsp">About</a></li>
    <li style="float:right"><a href="index2.jsp">NOUTIYAFH HOTEL</a></li>
</ul>

<div id="booking" class="section">
    <div class="section-center">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-md-push-5">
                    <div class="booking-cta">
                        <h1>Make your reservation</h1>
                        <p>Bienvenue chez NOUTIYAFH ! Réservez dès maintenant pour vivre une expérience de séjour exceptionnelle. Nos chambres élégantes et notre service attentionné vous garantissent un moment inoubliable. Ne manquez pas l'opportunité de vous offrir une escapade parfaite. Réservez aujourd'hui et laissez-nous créer des souvenirs mémorables pour vous!
                        </p>
                    </div>
                </div>
                <div class="col-md-4 col-md-pull-7">
                    <div class="booking-form">
                        <form method="post" action="processformdeux.jsp">
                            <div class="form-group">
                                <span class="form-label">CIN</span>
                                <input class="form-control" placeholder="CIN" type="text" name="cin" required="required">
                            </div>
                            <div class="form-group">
                                <span class="form-label">Nom Complet</span>
                                <input class="form-control" type="text" placeholder="Nom" name="nomclient" required="required">
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Check In</span>
                                        <input class="form-control" type="date" required="" name="date_debut">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <span class="form-label">Check out</span>
                                        <input class="form-control" type="date" required="" name="date_fin">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <span class="form-label">Nombre chambres</span>
                                        <select class="form-control" name="nbr_chambres">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                        <span class="select-arrow"></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <span class="form-label">Type de Chambre</span>
                                        <select class="form-control" name="type_chambre">
                                            <option>Suite Duplex</option>
                                            <option>Chambre De Luxe</option>
                                            <option>Chambre Supérieur</option>
                                            <option>Chambre Classique</option>
                                        </select>
                                        <span class="select-arrow"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-btn">
                                <button class="submit-btn">Reserver</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
