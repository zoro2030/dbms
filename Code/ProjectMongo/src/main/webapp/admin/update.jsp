<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoro.to</title>
<link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
<!-- Add Bootstrap CSS link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="../new.html">
	      <img src="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
	      Zoro.to
	    </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="index.html">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="insert.html">Insert</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="display.jsp">Display</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="delete.html">Delete</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="update.html">Update</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
    <div class="container center-content">
   		<%@ page import="com.mongodb.*" %>
        <%
            String ID = request.getParameter("ID");
            String up_variable = request.getParameter("up_variable");
            String up_value = request.getParameter("up_value");

            try {
            	MongoClient mongo = new MongoClient("localhost", 27017);
            	DB db = mongo.getDB("demo");
            	
            	DBCollection coll;
            	BasicDBObject nem_change = new BasicDBObject("$set", new BasicDBObject(up_variable, up_value));
            	BasicDBObject searchQuery = new BasicDBObject("ID", ID);

            	if ("Password".equals(up_variable)) {
            		coll = db.getCollection("login");
            	} else {
            		coll = db.getCollection("info");
            	}
            	
            	WriteResult result = coll.update(searchQuery, nem_change);

            	if (result.getN() > 0) {
        %>
        <p class="result-message">Done - Updated <%= up_variable %> to <%= up_value %> for ID <%= ID %>.</p>
        <%
            	} else {
        %>
        <p class="result-message">Error - No records found for ID <%= ID %>.</p>
        <%
            	}
            	mongo.close();
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
