<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body style="padding: 10px">
<h1>Furama Resort</h1>
<hr>
<h3 align="center">List Service</h3>
<table class="table table-striped table-hover">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>MP</th>
        <th>Standard</th>
        <th>Pool</th>
        <th>NF</th>
        <th>Rent</th>
        <th>Type</th>
        <th>Des</th>
    </tr>
    <c:forEach items="${list}" var="s" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${s.name}</td>
            <td>${s.area}</td>
            <td>${s.cost}</td>
            <td>${s.maxPeople}</td>
            <td>${s.standardRoom}</td>
            <td>${s.areaPool}</td>
            <td>${s.floor}</td>
            <td>${s.rentType.rentType}</td>
            <td>${s.serviceType.serviceType}</td>
            <td>${s.description}</td>
        </tr>
    </c:forEach>
</table>

<h5><a href="/furama?action=createService">Create a new service</a></h5>
</body>
</html>