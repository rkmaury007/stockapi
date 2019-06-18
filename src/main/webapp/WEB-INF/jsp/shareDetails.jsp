<%@ taglib prefix="cdata" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
  
<head>
    <meta charset="UTF-8"/>
    <title>List of Stocks</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
</head>
  
<body style="background-color:powderblue;">
    <%--<table border="1"><center><h1>Share List</h1></center></table>--%>
<div class="container">
    <div class="page-header">
        <center><h1>All Stock List</h1></center>
    </div>
</div>   
<div>
    <table border="1" class="table table-striped" style="background-color: khaki">
        <tr>
            <%--<th>Share ID</th>--%>
            <th>Stock Name</th>
            <th>Stock Price</th>
            <th>Unit</th>
            <th>Total Price</th>
            <th>Created Date</th>
        </tr>
        <cdata:forEach items="${shares}" var="share">
        <tr>
           <%--<td>${share._Id}</td>--%>
           <td>${share.name}</td>
           <td>${share.stockPrice}</td>
           <td>${share.numOfStock}</td>
           <td>${share.stockPrice*share.numOfStock}</td>
           <td>${share.now}</td>
        </tr>
        </cdata:forEach>
    </table>
</div>
  
</body>
  
</html>