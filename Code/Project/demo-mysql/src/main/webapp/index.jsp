<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoro.to</title>
<link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
<!-- Add Bootstrap CSS link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
    /* Custom styles for centering content and adding background image */
    body {
        background-image: url('https://media.giphy.com/media/9az09tlYyYNfq/giphy.gif'); /* Replace with your image URL */
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }

    .center-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent white background for better readability */
        padding: 20px;
        border-radius: 10px;
    }

    /* Additional styling for the result message */
    .result-message {
        margin-top: 20px;
        font-size: 18px;
        font-weight: bold;
    }
</style>

</head>
<body>
    <div class="container center-content">
    	<%@ page import="java.sql.*" %>
        <%
            String ID = request.getParameter("ID");
            String Name = request.getParameter("Name");
            String Branch = request.getParameter("Branch");
            String Percent = request.getParameter("Percent");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_student", "root", "");
                Statement stmt = con.createStatement();

                String query = "INSERT INTO data VALUES ('" + ID + "','" + Name + "','" + Branch + "','" + Percent + "');";
                stmt.executeUpdate(query);
        %>
        <p class="result-message">Done - Data has been inserted for <%= Name %> with ID <%= ID %>.</p>
        <%
                con.close();
            } catch (Exception e) {
        %>
        <p class="result-message">Error - <%= e.getMessage() %></p>
        <%
            }
        %>
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
