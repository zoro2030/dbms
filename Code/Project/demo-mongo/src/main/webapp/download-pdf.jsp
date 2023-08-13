<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zoro.to</title>
	<link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            text-align: center;
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

        .output-message {
            margin-top: 20px;
            font-size: 18px;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container center-content">
        <h1 class="mb-4">Export Data to File</h1>
        <%@ page import="com.mongodb.*" %>
	    <%@ page import="java.io.*" %>
	    <%@ page import="java.util.*" %>
        <%

        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("C:/Tomcat/output/op2.txt"));
            MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("demo");
    		DBCollection coll = db.createCollection("new", null);
    		
    		DBCursor cur = coll.find();
			while(cur.hasNext()) {
				BasicDBObject document = (BasicDBObject) cur.next();
				String id = document.getString("ID");
                String n = document.getString("Name");
                String b = document.getString("Branch");
                String p = document.getString("Percent");
    
                bw.write(id+ "\t" + n + "\t" + b + "\t" + p + "\n");
            }
            bw.close();
            out.print("<div class='output-message'>Data exported to op.txt successfully.</div>");
        } catch (Exception e) {
            out.print("<div class='output-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
        }
        %>
        
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
