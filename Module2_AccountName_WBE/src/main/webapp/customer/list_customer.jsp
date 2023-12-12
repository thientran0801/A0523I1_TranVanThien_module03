<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/11/2023
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>
<h1 align="center">Customer Infomation table</h1>
<hr>
<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">IDcard</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Type</th>
<%--        <th scope="col" colspan="2">Update</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="c" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${c.name}</td>
            <td>${c.birthday}</td>
            <td>${c.gender}</td>
            <td>${c.idCard}</td>
            <td>${c.phone}</td>
            <td>${c.email}</td>
            <td>${c.address}</td>
            <td>${c.customerType.customerType}</td>
            <td><button type="button" class="btn btn-danger"><a href="/furama?action=update&id=${c.id}">Delete</a></button></td>
            <td><button type="button" class="btn btn-warning"><a href="/furama?action=delete&id=${c.id}">Edit</a></button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
