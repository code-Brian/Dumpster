<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script src="https://cdn.tailwindcss.com"></script>
<title>Trashboard</title>
</head>
<body>
	<div class="bg-orange-100 min-h-screen">
		<div class="flex justify-between items-center bg-green-300 p-5 drop-shadow-md">
			<div>
				<h1>Welcome to <span class="font-bold">Dumptser</span>, <c:out value="${user.userName}"/>!</h1>
				<div class="mt-3">
					<input class="rounded text-s pl-1 mr-0" type="text" value="/profile/${userId}/view" id="dumpsterLink"/>
					<button class="border bg-orange-100 hover:bg-orange-200 rounded text-s px-2" onclick="copyFunction()">Copy</button>
				</div>
			</div>
			<p class="text-center bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-2 rounded w-20 m-0"><a class="p-0 decoration-none" href="/logout">Logout</a></p>
		</div>
		<div class="flex flex-col items-center">
			<div class="mt-5 w-1/2 drop-shadow-md">
				<h2 class="font-bold mt-3">Hot Garbage</h2>
				<table class="min-w-full">
					<thead>
						<tr class="border bg-blue-100">
							<th class="px-4 py-2">From</th>
							<th class="px-4 py-2">Message</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="trash" items="${user.trashReceived}">
							<tr>
								<td class="bg-gray-100 border px-4 py-2 text-violet-500 hover:text-violet-700"><a href="/profile/${trash.sender.id}/view">${trash.sender.userName}</a></td>
								<td class="bg-gray-100 border px-4 py-2 text-black-500">${trash.message}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="w-1/2 drop-shadow-md">
				<h3 class="font-bold mt-3">Sent Garbage</h3>
				<table class="min-w-full">
					<thead>
						<tr class="border bg-blue-100">
							<th>Sent to</th>
							<th>Message</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="message" items="${senderTrash}">
							<tr>
								<td class="bg-gray-100 border px-4 py-2 text-violet-500 hover:text-violet-700"><a href="/profile/${message.receiver.id}/view">${message.receiver.userName}</a></td>
								<td class="bg-gray-100 border px-4 py-2 text-black-500">${message.message}</td>
								<td class="bg-gray-100 border px-4 py-2">
									<p class="inline text-center bg-green-500 hover:bg-green-600 text-white focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75 font-bold py-2 rounded m-0"><a class="px-4" href="trash/${message.id}/edit">Edit</a></p>
									<form:form class="inline" action="trash/${message.id}/delete" method="POST">
										<input type="hidden" name="_method" value="DELETE"/>
										<button class="bg-red-500 hover:bg-red-800 text-white font-bold rounded h-11 w-20 m-0">Delete</button>
									</form:form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="js/script.js"></script>
</body>
</html>