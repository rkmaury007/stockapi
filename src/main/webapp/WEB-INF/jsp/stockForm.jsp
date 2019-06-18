<%--
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
--%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stock Form Handling</title>
    <%--<script type="text/javascript" src="validation.js"></script>--%>
    <script type="text/javascript">
        function validate()
        {
            var name = document.getElementById("name");
            var stockPrice = document.getElementById("stockPrice");
            var numOfStock = document.getElementById("numOfStock");
            /*var a = document.getElementById("stockPrice");*/
            var c = document.getElementById("stockPrice").value;
            var d = document.getElementById("numOfStock").value;
            var valid = true;
            if(name.value.length<=0)
            {
                alert("Name field is mandatory");
                valid = false;
            }
            else if(stockPrice.value.length<=0)
            {
                alert("Stock Price field is mandatory");
                valid = false;
            }
            else if(numOfStock.value.length<=0)
            {
                alert("Stock Unit field is mandatory");
                valid = false;
            }
            else{
                if(isNaN(c)){
                    alert("Enter a number in stock price field");
                    valid = false;
                }
                else if(isNaN(d)){
                    alert("Enter a number in stock unit field");
                    valid = false;
                }
            }
            return valid;
        };
    </script>
</head>

<body style="background-color:powderblue;">
<h2>Add Stock Information</h2>
<%--<form:form method = "POST" action = "/addStock">--%>
<form method="Post" action="addStock" onsubmit="return validate()">
    <table>
        <tr>
            <td>Name</td>
            <td><input id="name" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Stock Price</td>
            <td><input id="stockPrice" name="stockPrice" id="stockPrice"></td>
        </tr>
        <%-- <tr>
             <td>Total Value</td>
             <td><input id="totalValue" name="totalValue"></td>
         </tr>--%>
        <tr>
            <td>Stock Units</td>
            <td><input id="numOfStock" name="numOfStock" id="numOfStock"></td>
        </tr>
        <%--<tr>
            <td>Current Date</td>
            <td><input id="now" name="now"></td>
        </tr>--%>
        <tr>
            <td>
                <input type="submit" value="Submit"/>
                <input type="reset" value="Reset"/>
            </td>
        </tr>
    </table>
    <%--</form:form>--%>
</form>
</body>
</html>
