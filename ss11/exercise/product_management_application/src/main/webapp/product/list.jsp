<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body {
        background: lightblue;
    }
    th {
        background: red;
    }
    td {
        background: lightgrey;
    }
</style>
<body>
<%--<%!--%>
<%--    private String formatCurrency(double amount) {--%>
<%--        // Tạo một đối tượng NumberFormat để định dạng số tiền theo Locale.DEFAULT--%>
<%--        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.getDefault());--%>

<%--        // Định dạng số tiền và trả về kết quả dưới dạng chuỗi--%>
<%--        return currencyFormatter.format(amount);--%>
<%--    }--%>
<%--%>--%>
<h1>product</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<p>
    <a href="/product?action=find">Find product</a>
</p>
<table border="1" style="text-align: center">
    <tr>
        <th>STT</th>
        <th width="200px">Name</th>
        <th width="150px">Price</th>
        <th width="200px">Description</th>
        <th>Producer</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach items= "${list}" var="p" varStatus="productLoop">
        <tr>
            <td>${productLoop.count}</td>
            <td style="text-align: left"><a href="/product?action=view&id=${p.getId()}">${p.getName()}</a></td>
            <td style="text-align: right">${p.getPrice()}</td>
<%--            <td style="text-align: right">${formatCurrency(p.getPrice())}</td>--%>
            <td style="text-align: right">${p.getDescription()}</td>
            <td>${p.getProducer()}</td>
            <td><a href="/product?action=edit&id=${p.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${p.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
