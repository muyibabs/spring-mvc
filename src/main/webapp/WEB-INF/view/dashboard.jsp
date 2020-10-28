<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    

    <script src="js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>
Welcome ${userDto.name}
<div class="container my-2">
    <h2 class="sub-header">Students</h2>
    <a href = "<c:url value = "addnew.do"/>" class="btn btn-primary btn-sm mb-3">New Student</a>
    <table class="table table-bordered table-striped">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Age</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="st" items="${students}" varStatus="loop">
        <tr>
          <th scope="row">${loop.count}</th>
          <td>${st.name}</td>
          <td>${st.age}</td>
          <td>
            <a href = "<c:url value = "/edit.do/${st.id}"/>" class="btn btn-primary btn-sm mb-3" >Edit</a>
            <a href = "<c:url value = "/delete.do?id=${st.id}"/>" class="btn btn-primary btn-sm mb-3" >Delete</a>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>