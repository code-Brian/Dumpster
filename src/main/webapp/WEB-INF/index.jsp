<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/app.js"></script>

<title>Login and Registration</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Welcome to the Trash Talk Prototype!</h1>
				<p>Hello, <c:out value="${user.userName}"/>!</p>
				<p class="btn btn-warning"><a class="text-decoration-none text-light" href="/logout">Logout</a></p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<p>Eventually, we want to be able to search for a user by their Dumpster id, here.</p>
				<form:form>
				</form:form>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table>
					<thead>
						<tr>
							<td>From</td>
							<td>Message</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="trash" items="${user.trashReceived}">
							<tr>
								<td>${trash.sender.userName}</td>
								<td>${trash.message}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>