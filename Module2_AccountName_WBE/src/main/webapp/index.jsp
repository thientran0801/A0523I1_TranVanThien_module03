<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<style>
    #head {
        width: 100%;
        height: 150px;
        background: lightblue;
        line-height: 50px;
        font-size: 2em;
        font-weight: bold;
        padding: 25px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .nav-item {
        width: 100px;
    }

    #main {
        width: 100%;
        min-height: 500px;
    }

    #left {
        width: 20%;
        background: lightgray;
        min-height: 500px;
        float: left;
        padding: 20px;

    }

    #content {
        width: 80%;
        background: lightyellow;
        min-height: 500px;
        float: left;
    }
</style>
<body>
<!--<a href="hello-servlet">Hello Servlet</a>-->

<div id="head">
    <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="LOGO" width="100px" height="100px">
    <span>Trần Văn Thiện</span>
</div>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/furama?action=listEmployee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/furama?action=lisCustomer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/furama?action=listService">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Contract</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div id="main">
    <div id="left">
        <p><a href="#"></a>Item one</p>
        <p><a href="#"></a>Item two</p>
        <p><a href="#"></a>Item three</p>
    </div>
    <div id="content">

    </div>
</div>

<footer style="background: grey;">
    <h3 align="center">Footer</h3>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>