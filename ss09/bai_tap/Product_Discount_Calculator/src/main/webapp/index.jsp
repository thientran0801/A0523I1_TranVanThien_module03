<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculation</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<br/>
<form action="/display-discount" method="post">
    <label for="des">Description: </label> <br>
    <input id="des" type="text" name="description" placeholder="Product Description: "/>
    <hr>
    <label for="pri">List Price:</label><br>
    <input id="pri" type="text" name="price" placeholder="List Price: "/>
    <hr>
    <label for="per">Discount Percent:</label> <br>
    <input id="per" type="text" name="percent" placeholder="Discount Percent: "/>
    <br>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>