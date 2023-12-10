<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    td {
        width: 200px;
        height: 30px;
        text-align: center;
    }
</style>
<body style="background: yellow;">
<h1 align="center">Are you sure to delete this user?:</h1>
<form action="/users?action=delete&id=${user.id}" method="post">
    <table align="center" border="1">
        <tr>
            <td colspan="2">User Info:</td>
        </tr>
        <tr>
            <td>Name:</td>
            <td>${user.name}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td>Country :</td>
            <td>${user.country}</td>
        </tr>
        <tr>
            <td colspan="2">
                <button>Delete</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
