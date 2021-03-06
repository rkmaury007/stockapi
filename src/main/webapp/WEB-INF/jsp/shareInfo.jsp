<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "cdata"%>
<%--<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h2>Basic Table</h2>
    <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
    <table class="table">
        <thead>
        <tr>
            <th>Share Name</th>
            <th>Share Price</th>
            <th>Total Price</th>
            <th>Unit</th>
            <th>Created Date</th>
        </tr>
        </thead>
        <tbody>
        <cdata:forEach items="${shares}" var="share">
                    <tr>
                       <%--<td>${share._Id}</td>--%>
                       <td>${share.name}</td>
            <td>${share.stockPrice}</td>
                      <td>${share.totalValue}</td>
            <td>${share.numOfStock}</td>
                       <td>${share.now}</td>
                    </tr>
        </cdata:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
