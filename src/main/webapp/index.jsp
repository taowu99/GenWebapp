<%@ page isELIgnored="false" %> 
<html>
<head><title>First JSP</title></head>
<body>
  <div class="container">
    <h1>This is secured!</h1>
    <p>
      Hello <b>${pageContext.request.remoteUser}</b>
    </p>
    <form action="logout" method="post">
      <input type="submit" value="Log out" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
  </div>
</body>
</html>
