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
<title>Edit Trash</title>
</head>
<body>
	<div class="bg-orange-100 min-h-screen">
		<div class="bg-green-300 flex justify-between p-5">
			<h1 class="font-bold text-lg">Edit Trash</h1>
			<p class="text-lg text-violet-500 hover:text-violet-800"><a class="underline" href="/dashboard">Home</a></p>
		</div>
		<div class="flex justify-center items-center">
			<form:form action="/trash/${trash.id}/update" method="POST" modelAttribute="trash">
				<input type="hidden" name="_method" value="PUT"/>
				<form:input path="sender" value="${trash.sender.id}" type="hidden"/>
				<form:input path="receiver" value="${trash.receiver.id}" type="hidden"/>
				<div>
					<div>
						<form:label path="message" class="block text-gray-700 text-sm font-bold mb-2">Message</form:label>
						<form:errors class="text-red-300" path="message"/>
					</div>
					<form:textarea 
						path="message" 
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						value="${trash.message}"
						/>
				</div>
				<button class="text-center bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-30 m-0">Update Message</button>
			</form:form>
		</div>
	</div>
</body>
</html>