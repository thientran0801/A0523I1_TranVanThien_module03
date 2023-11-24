<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculator-servlet" method="post">
    Số thứ nhất <input type="number" name="firstNum">
    Số thứ hai <input type="number" name="secondNum">
    <input type="submit" value="Tổng">
</form>
Result: ${resul}
</body>
</html>