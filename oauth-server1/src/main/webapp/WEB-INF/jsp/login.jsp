<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sparklr</title>
</head>

<body>

<div class="container">

    <c:if test="${not empty param.authentication_error}">
        <h1>Woops!</h1>

        <p class="error">Your login attempt was not successful.</p>
    </c:if>
    <c:if test="${not empty param.authorization_error}">
        <h1>Woops!</h1>

        <p class="error">You are not permitted to access that resource.</p>
    </c:if>

    <div class="form-horizontal">
        <form action="<c:url value="/login"/>" method="post" role="form">
            <fieldset>
                <legend>
                    <h2>Login</h2>
                </legend>
                <div class="form-group">
                    <label for="username">Username:</label> <input id="username"
                                                                   class="form-control" type='text' name='username'
                                                                   value="user"/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label> <input id="password"
                                                                   class="form-control" type='text' name='password'
                                                                   value="user"/>
                </div>
                <button class="btn btn-primary" type="submit">Login</button>
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </fieldset>
        </form>

    </div>
</div>


</body>
</html>