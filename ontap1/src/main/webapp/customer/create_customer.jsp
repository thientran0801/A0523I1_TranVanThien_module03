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


<h1>Create new Customer</h1>
<hr>
<form action="/CustomerServlet?action=createCustomer" method="post">
  <table>
    <%--        <tr>
                <td>ID:</td>
                <td><input type="text" name="id"></td>
            </tr>--%>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="name" required></td>
    </tr>`
    <tr>
      <td>Birthday:</td>
      <td><input type="date" name="dob" required></td>
    </tr>
    <tr>
      <td>Gender:</td>
      <td>
        <label><input width="100px" type="radio" name="gender" value="true" checked>Nam</label>
        <label><input width="100px " type="radio" name="gender" value="false">Nữ</label>
      </td>
    </tr>
    <tr>
      <td>ID card:</td>
      <td><input type="text" name="idcard" pattern="^\d{9}(\d{3})?$" title="ID Card include 9 or 12 numbers"
                 required></td>
    </tr>
    <tr>
      <td>Phone:</td>
      <td><input type="text" pattern="^0\d{9}$" name="phone" required title="Format: 0XXXXXXXXX"></td>
    </tr>
    <tr>
      <td>Address:</td>
      <td><input type="text" name="address" required></td>
    </tr>
    <tr>
      <td>Email:</td>
      <td><input type="text" name="email" pattern="^.*@gmail.com" title="******@gmail.com" required></td>
    </tr>
    <tr>
      <td>Customer type:</td>
      <td>
        <select name="typeID">
          <c:forEach items="${customerTypes}" var="t" varStatus="loop">
            <option value="${t.id}">${t.type}</option>
          </c:forEach>
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
