<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Find user by country:</h1>
<h3>Enter a keyword to find:</h3>
<hr>
<form action="/users" method="post">
    <tr>
        <td><input type="text" name="key" placeholder="Enter a keyword..."></td>
        <td><input type="submit">Submit</td>
    </tr>
</form>
</body>
</html>
