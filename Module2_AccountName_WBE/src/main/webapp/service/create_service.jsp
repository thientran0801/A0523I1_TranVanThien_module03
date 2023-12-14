<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">--%>

<html>
<head>
    <title>Create Service</title>
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


<h1>Create new service</h1>
<hr>
<form action="/furama?action=createService" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Area:</td>
            <td><input type="text" name="area"></td>
        </tr>
        <tr>
            <td>Cost:</td>
            <td><input type="text" name="cost"></td>
        </tr>
        <tr>
            <td>Max people:</td>
            <td><input type="text" name="maxPeople"></td>
        </tr>
        <tr>
            <td>Standard:</td>
            <td><input type="text" name="standard"></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><input type="text" name="description"></td>
        </tr>
        <tr>
            <td>Pool:</td>
            <td><input type="text" name="pool"></td>
        </tr>
        <tr>
            <td>Floor:</td>
            <td><input type="text" name="floor"></td>
        </tr>
        <tr>
            <td>Rent type:</td>
            <td><select name="rent">
                <option value="1">Year</option>
                <option value="2">Month</option>
                <option value="3">Date</option>
                <option value="4">Hour</option>
            </select> </td>
        </tr>
        <tr>
            <td>Service type:</td>
            <td><select name="type">
                <option value="1">Villa</option>
                <option value="2">House</option>
                <option value="3">Room</option>
            </select> </td>
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
