<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Student</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    

    <script src="js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>

<div class="container my-2">
    <c:set value="Add" var="opType"/>
    <c:if test = "${not empty student.id}">
        <c:set var="opType" value="Edit" />
    </c:if>
    <h2 class="sub-header"> ${opType} Student</h2>
    <form:form action="/save.do" modelAttribute="student">
      <form:hidden  path="id" />
      <table class="table table-bordered">
        <tr>
          <td>Name</td>
          <td><form:input path="name" /></td>
        </tr>
        <tr>
          <td>Age</td>
          <td><form:input path="age" /></td>
        </tr>
        <tr>
           <td colspan="2">
            <input type="submit" value="Submit" />
           </td>
        </tr>
      </table>
    </form:form>


</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>