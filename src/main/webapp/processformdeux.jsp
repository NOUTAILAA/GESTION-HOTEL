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
</head>
<body>

<%
    String cin = request.getParameter("cin");
    String nomclient = request.getParameter("nomclient");
    String date_debut = request.getParameter("date_debut");
    String date_fin = request.getParameter("date_fin");
    String nbr_chambres = request.getParameter("nbr_chambres");
    String type_chambre = request.getParameter("type_chambre");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Chargement du driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Connexion à la base de données
        String url = "jdbc:mysql://localhost:3306/bdbd3";
        String username = "root";
        String password = "1234";
        conn = DriverManager.getConnection(url, username, password);

        // Récupérer le nombre de chambres déjà réservées pour le type sélectionné
        String checkAvailabilityQuery = "SELECT SUM(nbr_chambres) AS count FROM reservations WHERE type_chambre = ?";
        PreparedStatement checkAvailabilityStmt = conn.prepareStatement(checkAvailabilityQuery);
        checkAvailabilityStmt.setString(1, type_chambre);
        ResultSet resultSet = checkAvailabilityStmt.executeQuery();

        int reservedRooms = 0;

        if (resultSet.next()) {
            reservedRooms = resultSet.getInt("count");
        }

        // Vérifier si le nombre de chambres disponibles est suffisant
        int availableRooms = 10;  // Supposons que le nombre total de chambres disponibles est initialement 10

        if (availableRooms - reservedRooms >= Integer.parseInt(nbr_chambres)) {
            // Requête SQL pour insérer les données
            String sql = "INSERT INTO reservations (cin, nomclient, date_debut, date_fin, nbr_chambres, type_chambre) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cin);
            stmt.setString(2, nomclient);
            stmt.setString(3, date_debut);
            stmt.setString(4, date_fin);
            stmt.setString(5, nbr_chambres);
            stmt.setString(6, type_chambre);

            // Exécution de la requête
            int rowsAffected = stmt.executeUpdate();

            // Mise à jour de la base de données avec le nouveau nombre de chambres réservées
            reservedRooms += Integer.parseInt(nbr_chambres);

            // Vérifiez si l'insertion a réussi
            if (rowsAffected > 0) {
                session.setAttribute("reservationSuccess", "true");
            } else {
                session.setAttribute("reservationSuccess", "false");
            }

            response.sendRedirect("chambresytry.jsp");
        } else {
            // Informer l'utilisateur que le nombre de chambres demandées n'est pas disponible
            session.setAttribute("reservationSuccess", "false");
            session.setAttribute("reservationError", "Le nombre de chambres demandées n'est pas disponible. Veuillez réessayer avec un nombre inférieur.");
            response.sendRedirect("chambresytry.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Fermeture des ressources
        try { if (stmt != null) stmt.close(); } catch (Exception e) { }
        try { if (conn != null) conn.close(); } catch (Exception e) { }
    }
%>

</body>
</html>
