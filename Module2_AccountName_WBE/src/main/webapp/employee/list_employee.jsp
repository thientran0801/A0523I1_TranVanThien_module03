<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List employee</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body style="padding: 20px">
<h1 align="center">Empployee Infomation table</h1>
<hr>
<a href="/furama?action=createEmployee" style="text-align:right;">Create new employee</a>
<hr>
<form action="/furama?action=findEmployeeByName" method="post">
    <table>
        <tr>
            <td><input type="text" name="kw" placeholder="Search"></td>
            <td><input type="submit" value="Search"></td>
        </tr>
    </table>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">IDcard</th>

        <th scope="col">Salary</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>

        <th scope="col">Position</th>
        <th scope="col">Education</th>
        <th scope="col">Division</th>
        <th scope="col">User</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="e" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${e.name}</td>
            <td>${e.birthday}</td>
            <td>${e.idCard}</td>

            <td>${e.salary}</td>
            <td>${e.phone}</td>
            <td>${e.email}</td>
            <td>${e.address}</td>
            <td>${e.position}</td>
            <td>${e.educationDegree}</td>
            <td>${e.division}</td>
            <td>${e.user}</td>
            <td><button type="button" class="btn btn-warning"><a href="/furama?action=editEmployee&id=${e.id}">Edit</a></button></td>
            <td><button type="button" class="btn btn-danger"><a href="/furama?action=deleteEmployee&id=${e.id}">Delete</a></button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
