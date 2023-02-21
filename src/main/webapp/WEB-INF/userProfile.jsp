<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cdn.tailwindcss.com"></script>
<title>Dumpster</title>
</head>
<body>
	<div class="bg-orange-100 min-h-screen">
		<div class="flex justify-between bg-green-300 p-5">
			<h1 class="text-lg">Profile: <span class="font-bold"><c:out value="${user.userName}"/></span></h1>
			<div>
				<p class="text-lg text-violet-500 hover:text-violet-800"><a class="underline" href="/dashboard">Home</a></p>
			</div>
		</div>
		<div class="flex items-center justify-center mt-5">
			<form:form action="/trash/create" method="POST" modelAttribute="trash">
				<form:input path="sender" value="${userId}" type="hidden"/>
				<form:input path="receiver" value="${user.id}" type="hidden"/>
				<div>
					<form:label path="message" class="block text-gray-700 text-lg font-bold mb-2">Talk some Trash</form:label>
					<form:errors class="text-red-300" path="message"/>
					<form:textarea path="message" class="shadow appearance-none border rounded py-2 px-3 text-gray-700"/>
					<button class="text-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 rounded w-20 m-0">Send</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>