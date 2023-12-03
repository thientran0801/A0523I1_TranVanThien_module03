
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
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
<h1>Delete product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>

<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
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
            <tr><td colspan="2"><input type="submit" value="Confirm"></td></tr>
        </table>
    </fieldset>
</form>
</body>
</html>
