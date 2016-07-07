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

    <%--<button id="getTokenId">Get info</button>--%>
    <button id="getInfoId" style="display: none;">Get info</button>

    <div id="info"></div>
</div>

<script>
    $('#oauthloginId').on('click', function () {
        var appID = "bankid";
        var path = 'http://localhost:8081/oauth/authorize?';
        var queryParams = ['client_id=' + appID,
            'redirect_uri=' + window.location, 'scope=data',
            'response_type=token'];
        var query = queryParams.join('&');
        var url = path + query;
        window.open(url);
    });

//    $('#getTokenId').on('click', function () {
//        $.ajax({
//            url: 'http://localhost:8081/oauth/token',
//            type: 'POST',
//            data: 'grant_type=password&scope=trust&username=admin&password=admin',
//            username: 'bankid',
//            password: 'secret',
//            xhrFields: {withCredentials: true},
//            //dataType : 'text',
//            success: function (data, jqXHR) {
//                if (window.console)
//                    console.log(data);
//            },
//            error: function (data) {
//                if (window.console)
//                    console.log(data);
//                if (data.status == '403') {
//                    console.log("Forbidden: " + data);
//                }
//            }
//        });
//    });

    $('#getInfoId').on('click', function () {
        var accessToken = window.location.hash.split('&')[0].split("=")[1];
        console.log('access-token:' + accessToken);
        var headers = {
            'Authorization': 'Bearer ' + accessToken
        };

        $.ajax({
            url: 'http://localhost:8081/info',
            type: 'POST',
            headers: headers,
            xhrFields: {withCredentials: true},
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

    $(function () {
        var url = window.location;
        console.log(url);
        if (url.hash) {
            var accessToken = url.hash.split('&')[0].split("=")[1];
            $('#getInfoId').show();
        }
    });
    //https://github.com/spring-projects/spring-security-oauth/tree/master/samples/oauth2/sparklr
</script>
</body>
</html>