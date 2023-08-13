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
            background-image: url('https://media.giphy.com/media/GRSnxyhJnPsaQy9YLn/giphy.gif'); /* Replace with your image URL */
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
    </style>
</head>
<body>
    <div class="container center-content">
        <h1 class="mb-4">Welcome to Zoro.to</h1>
        <table class="table table-bordered">
            <tr class="bg-primary text-white font-weight-bold">
                <td>ID</td>
                <td>Name</td>
                <td>Branch</td>
                <td>Percentage</td>
            </tr>
            <%@ page import="java.sql.*" %>
            <% 
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_student", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM data");
                    while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                        </tr>
                    <% }
                } catch (Exception e) {
                    out.print(e);
                }
            %>
        </table>
        <a href="download-pdf.jsp" class="btn btn-primary">Download PDF</a>
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
