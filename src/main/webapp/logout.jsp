<%@ page isELIgnored="false" %> 
<html>
<head>
<title>Logout Page</title>
<script type="text/javascript">
function logoutajax(user, csrfparam, csrftkn, nextURL) {
	if (confirm(user + ", do you want to log out?")) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200)
				alert(user + ", you are logged out now.");
			window.location.href = nextURL;
		};

		//xhttp.open('POST', 'logout?'+csrfparam+"="+csrftkn, false);
		xhttp.open('POST', 'logout', false);
		xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhttp.send(csrfparam + "=" + csrftkn);
	}
}
</script>
</head>
<body>
	<div class="container">
		<form action="logout" method="post" id="logoutform">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> &nbsp <input type="submit"	value="${pageContext.request.remoteUser}, leave" />
		</form> 
		<input id="jslogout" type="button" onclick="if (confirm('want to log out?')) document.getElementById('logoutform').submit();" value="Logout js form" />
	<input id="jslogout" type="button" onclick="logoutajax('${pageContext.request.remoteUser}','${_csrf.parameterName}', '${_csrf.token}', 'login?logout');" value="Logout ajax" />
	</div>
</body>

</html>