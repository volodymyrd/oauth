<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Client Authentication Example</title>
    <link type="text/css" rel="stylesheet"
          href="bootstrap/css/bootstrap.min.css" />
    <script type="text/javascript" src="bootstrap/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript"
            src="bootstrap/js/bootstrap.min.js"></script>
    <script>
        function authenticate() {
            var appID = "bankid";
            var path = 'oauth/authorize?';
            var queryParams = [ 'client_id=' + appID,
                'redirect_uri=' + window.location, 'scope=trust',
                'response_type=token' ];
            var query = queryParams.join('&');
            var url = path + query;
            window.open(url);
        }
        function display() {
            var hash = window.location.hash;
            var accessToken = hash.split('&')[0].split("=")[1];
            console.log('access-token:' + accessToken);
            var headers = {
                'Authorization' : 'Bearer ' + accessToken,
                'Accept' : 'application/json'
            };
            $.ajaxSetup({
                'headers' : headers,
                dataType : 'text'
            });
        }
        $(function() {
            if (window.location.hash.length == 0) {
                authenticate();
            } else {
                display();
            }
        })
    </script>
</head>
<body>
<h1>Sparklr Client Authentication Sample</h1>

<div id="content">
    <p>Once you have authenticated and approved the access, some
        JavaScript in this page will render a message from Sparklr below</p>
</div>

"${pageContext.request.userPrincipal.name}"

<c:if test="${not empty pageContext.request.userPrincipal.name}">
    <a href="javascript:formSubmit()">logout</a>
</c:if>

<c:url value="/logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>

<script>
    function formSubmit() {
        console.log('logout');
        document.getElementById("logoutForm").submit();
    }
</script>
</body>
</html>