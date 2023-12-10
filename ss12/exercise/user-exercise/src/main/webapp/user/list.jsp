<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    th {
        border: 1px solid black;
        width: 200px;
    }
</style>
<body>
<h1>List User:</h1>
<h3><a href="/users?action=create">Create new user</a></h3>
<h3><a href="/users?action=sort">Sort the list by name</a></h3>
<hr>
<p>Find by country:</p>
<form action="/users?action=findbycountry" method="post">
<table>
    <tr>
        <td><input type="text" name="key" placeholder="Enter a country..."></td>
        <td><input type="submit"></td>
    </tr>
</table>
</form>
<table border="1">
    <thead>
    <tr>
        <th width="50px">Number</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2">Update</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="user" varStatus="loop">
        <tr>
            <td align="center">${loop.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/users?action=update&id=${user.id}">Edit</a></td>
            <td><a href="/users?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
