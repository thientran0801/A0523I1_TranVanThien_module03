<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    th {
        width: 200px;
    }
</style>
<body>
<h1>List User:</h1>
<table border="1">
    <tr>
        <th>Number</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach items="${list}" var="user" varStatus="userloop">
        <tr>
            <td><c:out value="${user.getId}"/></td>
            <td><c:out value="${user.getName}"/></td>
            <td><c:out value="${user.getEmail}"/></td>
            <td><c:out value="${user.getCountry}"/></td>
                <%--            <td>${userloop.count}</td>
                            <td>${user.getName}</td>
                            <td>${user.getEmail}</td>
                            <td>${user.getCountry}</td>--%>
        </tr>
    </c:forEach>
</table>
</body>
</html>
