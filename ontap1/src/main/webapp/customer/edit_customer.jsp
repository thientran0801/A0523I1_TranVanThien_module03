<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">--%>

<html>
<head>
    <title>Create Customer</title>
</head>
<style>
    input {
        width: 500px;
    }

    label input {
        width: auto;
    }
</style>
<body style="background: lightblue;">


<h1>Edit Customer</h1>
<hr>
<form action="/CustomerServlet?action=editCustomer&id=${customer.id}" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" value="${customer.name}"></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><input type="date" name="dob" value="${customer.dob}">
            </td>
        </tr>
        <tr>
            <td>Gender:</td>
            <c:if test="${customer.gender == true}">
                <td>
                    <label><input width="100px" type="radio" name="gender" value="true" checked>Nam</label>
                    <label><input width="100px " type="radio" name="gender" value="false">Nữ</label>
                </td>
            </c:if>
            <c:if test="${customer.gender == false}">
                <td>
                    <label><input width="100px" type="radio" name="gender" value="true">Nam</label>
                    <label><input width="100px " type="radio" name="gender" value="false" checked>Nữ</label>
                </td>
            </c:if>
        </tr>
        <tr>
            <td>ID card:</td>
            <td><input type="text" name="idcard" value="${customer.idCard}"></td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><input type="text" name="phone" value="${customer.phone}"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" name="address" value="${customer.address}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" value="${customer.email}"></td>
        </tr>
        <tr>
            <td>Customer type:</td>
            <td>
                <select name="typeCustomer">
                    <c:forEach items="${list}" var="type" varStatus="loop">
                        <option value="${type.id}">${type.type}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
    <hr>
    <button type="submit">Submit</button>
</form>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>--%>
</body>
</html>