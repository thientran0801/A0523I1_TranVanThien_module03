<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    td {
        width: 300px;
    }
</style>
<body style="background: lightyellow;">
<h1 style="color: red;" align="center"> Are you sure you want to delete this customer ?</h1>
<hr>
<form action="/CustomerServlet?action=deleteCustomer&id=${customer.id}" method="post">
    <table align="center" style="border: 1px solid black; background:yellow;">
        <tr>
            <td>ID:</td>
            <td>${String.format("KH-%04d", customer.id)}</td>
        </tr>
        <tr>
            <td>name:</td>
            <td>${customer.name}</td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>${customer.gender ? "Nam" : "Nữ"}</td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td>${customer.dob}</td>
        </tr>
        <tr>
            <td>ID card:</td>
            <td>${customer.idCard}</td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>${customer.phone}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${customer.email}</td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>${customer.address}</td>
        </tr>
        <tr>
            <td>Type customer:</td>
            <td>${customer.type}</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Confirm</button>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <a href="/CustomerServlet">Back to list customer</a>
            </td>
        </tr>

    </table>
</form>
</body>
</html>
