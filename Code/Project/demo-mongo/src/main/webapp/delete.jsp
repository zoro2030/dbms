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
    	<%@ page import="com.mongodb.*" %>
        <%
            String ID = request.getParameter("ID");

            try {
            	MongoClient mongo = new MongoClient("localhost", 27017);
    			DB db = mongo.getDB("demo");
        		DBCollection coll = db.createCollection("new", null);
        		BasicDBObject delete = new BasicDBObject("ID",ID);
				coll.remove(delete);
                
        %>
        <p class="result-message">Done - Data with ID <%= ID %> has been deleted.</p>
        <%
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