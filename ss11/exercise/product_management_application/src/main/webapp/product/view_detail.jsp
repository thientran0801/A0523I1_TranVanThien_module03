<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<style>
    * {
        background: pink;
    }
    td {
        background: yellow;
    }
</style>
<body>
<h1>
    Product detail:
</h1>
<p>
    <a href="/product">Bach to product list...</a>
</p>
<table>
    <tr>
        <td width="150px">Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Producer: </td>
        <td>${product.getProducer()}</td>
    </tr>
</table>
</body>
</html>
