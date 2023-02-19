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

<title>TrashTalk</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Profile: <c:out value="${user.userName}"/></h1>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h2>Favorite Garbage Received</h2>
				<table>
					<thead>
						<tr>
							<td>Username</td>
							<td>Post</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Billybob the H8r</td>
							<td>Trash Talk Post Goes here.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col">
					<form:form action="/trash/create" method="POST" modelAttribute="trash">
						<form:input path="sender" value="${userId}" type="hidden"/>
						<form:input path="receiver" value="${user.id}" type="hidden"/>
						<div class="row">
							<div class="col">
								<form:label path="message">Message</form:label>
								<form:textarea path="message"/>
								<form:errors path="message"/>
							</div>
							<button>Send Garbage</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>