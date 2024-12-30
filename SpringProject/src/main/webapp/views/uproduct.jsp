<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">
    <title>Product List</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand img {
            height: 50px;
        }
        table {
            margin-top: 20px;
        }
        table img {
            border-radius: 5px;
        }
        .btn-buy {
            font-size: 0.9rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img th:src="@{/images/logo.png}" src="../static/images/logo.png" alt="Brand Logo"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/adminhome">Home Page</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h2 class="text-center my-4">Product List</h2>
    <table class="table table-striped table-hover table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Serial No.</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Preview</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Weight</th>
            <th scope="col">Description</th>
            <th scope="col">Buy</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                String url = "jdbc:mysql://localhost:3306/springproject";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "Murugesan@123");
                Statement stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td>
                <%
                    int categoryid = rs.getInt(4);
                    ResultSet rs2 = stmt2.executeQuery("SELECT * FROM categories WHERE categoryid = " + categoryid);
                    if (rs2.next()) {
                        out.print(rs2.getString(2));
                    }
                %>
            </td>
            <td>
                <img src="https://th.bing.com/th/id/R.fd048601910e87d09c670b696ed153a0?rik=MCuRFnBGgWZPjA&riu=http%3a%2f%2fimages2.fanpop.com%2fimages%2fphotos%2f7300000%2fSlice-of-Pizza-pizza-7383219-1600-1200.jpg&ehk=Nr%2f8Tpc4Z3p5bgSOdOEWHlN1XJS1y7jol5%2bkS6qXCpE%3d&risl=&pid=ImgRaw&r=0"
                     height="80" width="80" alt="Product Image">
            </td>
            <td><%= rs.getInt(5) %></td>
            <td>$<%= rs.getInt(6) %></td>
            <td><%= rs.getInt(7) %>g</td>
            <td><%= rs.getString(8) %></td>
            <td>
                <form action="/buy" method="get">
                    <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
                    <button type="submit" class="btn btn-info btn-buy">Buy</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception ex) {
                out.println("<tr><td colspan='9' class='text-danger text-center'>Error: " + ex.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
