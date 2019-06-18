<%@ taglib prefix="cdata" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
  
<head>
    <meta charset="UTF-8"/>
        <title>Share List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
        var files=${json};
    </script>  
</head>
  
<body style="background-color:powderblue;">
<center><h1>Stocks List</h1></center>
<div>
    <table border="1" class="table table-striped">
        <tr>
            <%--<th>Share ID</th>--%>
            <th>Stock Name</th>
            <th>Stock Price</th>
            <th>Unit</th>
            <th>Total Price</th>
            <th>Created Date</th>
        </tr>
                <%--<cdata:forEach items="${shares}" var="share">--%>
                
        <tr>
            <td>${name}</td>
            <td>${stockPrice}</td>
            <td>${numOfStock}</td>
            <td>${stockPrice*numOfStock}</td>
            <%--<td>curDate</td>--%>
            <td><%= (new java.util.Date()).toString()%>
            </td>
        </tr>
               <%-- </cdata:forEach>--%>
    </table>
</div>
<div>${json}</div>
<div>
    <button><a href="shareDetails">View All Stocks</a></button>
</div>
</body>
  
</html>