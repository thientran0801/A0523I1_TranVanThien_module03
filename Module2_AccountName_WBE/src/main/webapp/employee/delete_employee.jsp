<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1 style="color: red;" align="center"> Are you sure you want to delete this emplyee ?</h1>
<hr>
<form action="/furama?action=deleteEmployee&id=${employee.id}" method="post">
  <table align="center" style="border: 1px solid black; background:yellow;">
    <tr>
      <td>ID:</td>
      <td>${String.format("KH-%04d", employee.id)}</td>
    </tr>
    <tr>
      <td>name:</td>
      <td>${employee.name}</td>
    </tr>
    <tr>
      <td>Birthday:</td>
      <td>${employee.birthday}</td>
    </tr>
    <tr>
      <td>ID card:</td>
      <td>${employee.idCard}</td>
    </tr>
    <tr>
      <td>Phone:</td>
      <td>${employee.phone}</td>
    </tr>
    <tr>
      <td>Email:</td>
      <td>${employee.email}</td>
    </tr>
    <tr>
      <td>Address:</td>
      <td>${employee.address}</td>
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
        <a href="/furama?action=listEmployee">Back to list employee</a>
      </td>
    </tr>

  </table>
</form>
</body>
</html>
