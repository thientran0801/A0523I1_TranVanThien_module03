<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/29/2023
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>
    table {

        border-collapse: collapse;
        text-align: center;
    }

    th, td {
        height: 50px;
        width: 200px;
        border: 1px solid black;
        padding: 8px;
    }
</style>
<body>
<table>
    <thead>
    <tr>
        <th colspan="4">Danh sách khách hàng</th>
    </tr>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>

    <tbody>

    </tbody>

    <c:forEach items="${list}" var="c" varStatus="loop">
        <tr>
            <td>${c.name}</td>
            <td>${c.dob}</td>
            <td>${c.address}</td>
            <td><img src="${c.image}" alt="Avatar..." width="50px" height="50px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

<%--<td>${loop.count}</td>--%>
<%--<td><c:out value="${s.name}"/></td>--%>


<%--&lt;%&ndash;            Giới tính&ndash;%&gt;--%>
<%--<c:if test="${s.gender == true}">--%>
<%--    <td>Nam</td>--%>
<%--</c:if>--%>
<%--<c:if test="${s.gender == false}">--%>
<%--    <td>Nữ</td>--%>
<%--</c:if>--%>


<%--&lt;%&ndash;            Điểm&ndash;%&gt;--%>
<%--<td>${s.point}</td>--%>
<%--<c:choose>--%>
<%--    <c:when test="${s.point >= 7}">--%>
<%--        <td>Loại giỏi</td>--%>
<%--    </c:when>--%>
<%--    <c:when test="${s.point >= 6}">--%>
<%--        <td>Loại khá</td>--%>
<%--    </c:when>--%>
<%--    <c:when test="${s.point >= 5}">--%>
<%--        <td>Loại trung bình</td>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <td>Loại yếu</td>--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>
