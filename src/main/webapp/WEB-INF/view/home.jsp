<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>luv2code Company Home Page</title>
</head>

<body>
<h2>luv2code Company Home Page</h2>
<hr>
<p>Welcome to the luv2code company home page!</p>

<hr>

<!-- display username and role -->
<p>
    User: <security:authentication property="principal.username" />
    <br><br>
    Role(s): <security:authentication property="principal.authorities" />
</p>

<!-- Add a link to point to /leaders ... this is for the managers -->

<security:authorize access="hasRole('MANAGER')">
    <p>
        <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
        (Only for Manager Peeps)
    </p>
</security:authorize>


<!-- Add a link to point to /systems ... this is for the admins -->

<security:authorize access="hasRole('ADMIN')">
    <p>
        <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
        (Only for Admin Peeps)
    </p>
</security:authorize>

<hr>

<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout" />
</form:form>
</body>
</html>