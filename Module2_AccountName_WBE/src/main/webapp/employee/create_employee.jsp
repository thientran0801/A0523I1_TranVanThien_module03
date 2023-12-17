
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">--%>
<html>
<head>
  <title>Create Employee</title>
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


<h1>Create new Employee</h1>
<hr>
<form action="/furama?action=createEmployee" method="post">
  <table>
    <tr>
      <td>Name:</td>
      <td><input type="text" name="name" required></td>
    </tr>
    <tr>
      <td>Birthday:</td>
      <td><input type="date" name="dob" required></td>
    </tr>
    <tr>
      <td>ID card:</td>
      <td><input type="text" name="idcard" required></td>
    </tr>
    <tr>
      <td>Salary:</td>
      <td><input type="number" name="salary" required></td>
    </tr>
    <tr>
      <td>Phone:</td>
      <td><input type="text" name="phone" required></td>
    </tr>
    <tr>
      <td>Address:</td>
      <td><input type="text" name="address" required></td>
    </tr>
    <tr>
      <td>Email:</td>
      <td><input type="text" name="email" required></td>
    </tr>
    <tr>
      <td>Position:</td>
      <td>
        <select name="position">
          <c:forEach items="${positions}" var="p" varStatus="loop">
            <option value="${p.id}">${p.position}</option>
          </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td>Education Degree:</td>
      <td>
        <select name="educationDegree">
          <c:forEach items="${educationDegrees}" var="e" varStatus="loop">
            <option value="${e.id}">${e.educationDegree}</option>
          </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td>Division:</td>
      <td>
        <select name="division">
          <c:forEach items="${divisions}" var="d" varStatus="loop">
            <option value="${d.id}">${d.division}</option>
          </c:forEach>
        </select>
      </td>
    </tr>
  </table>
  <hr>
  <table>
    <tr>
      <td>User name:</td>
      <td><input type="text" name="userName" required></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><input type="password" name="password" required></td>
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
