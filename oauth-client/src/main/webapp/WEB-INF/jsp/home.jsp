<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <title>Client Authentication Example</title>
    <link type="text/css" rel="stylesheet"
          href="bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="bootstrap/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript"
            src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Choose your company for login</h1>

<div id="content">
    <button id="oauthloginId">Login via my company</button>

    <button id="getTokenId">Get token</button>
</div>

<script>
    $('#oauthloginId').on('click', function () {
        var appID = "bankid";
        var path = 'http://localhost:8081/oauth/authorize?';
        var queryParams = ['client_id=' + appID,
            'redirect_uri=' + window.location, 'scope=trust',
            'response_type=token'];
        var query = queryParams.join('&');
        var url = path + query;
        window.open(url);
    });

    $('#getTokenId').on('click', function () {
        $.ajax({
            url: 'http://localhost:8081/oauth/token',
            type: 'POST',
            data : 'grant_type=password&scope=trust&username=admin&password=admin',
            username: 'bankid',
            password: 'secret',
            xhrFields: { withCredentials: true },
            //dataType : 'text',
            success: function (data, jqXHR) {
                if (window.console)
                    console.log(data);
            },
            error: function (data) {
                if (window.console)
                    console.log(data);
                if (data.status == '403') {
                    console.log("Forbidden: " + data);
                }
            }
        });
    });
</script>
</body>
</html>