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
<body style="background: lightgreen;">
<h1 align="center">Edit information of user:</h1>
<form action="/users?action=update&id=${user.id}" method="post">
    <table align="center" border="1">
        <tr>
            <td colspan="2">User Info:</td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input style="border: none" type="text" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input style="border: none" type="text" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <td>Country :</td>
            <td><input style="border: none" type="text" name="country" value="${user.country}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <button>Update now</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
