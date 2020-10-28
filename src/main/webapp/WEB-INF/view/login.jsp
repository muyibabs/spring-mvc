<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <link href="css/signin.css" rel="stylesheet">

    <script src="js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>

<div class="container">

    <form:form action="/login.do" modelAttribute="user" cssClass="form-signin">
    <!-- <form class="form-signin" action="login.do" method="post"> -->
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="username" class="sr-only">Username</label>
        <!-- <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus> -->
        <form:input path="username" cssClass="form-control" placeholder="Username" required="true" autofocus="true" />
        <label for="password" class="sr-only">Password</label>
        <!-- <input type="password" id="password" name="password" class="form-control" placeholder="Password" required> -->
        <form:password path="password" cssClass="form-control" placeholder="Password" required="true" />

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form:form>

</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>