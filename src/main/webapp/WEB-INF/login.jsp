<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Please Log In</h1>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
            <c:choose>
                <c:when test="${errors.get('invaliduser').length() > 0}">
                    <div>${errors.get("invaliduser")}</div>
                </c:when>
            </c:choose>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
            <c:choose>
                <c:when test="${errors.get('pwderror').length() > 0}">
                    <div>${errors.get("pwderror")}</div>
                </c:when>
            </c:choose>
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>
</body>
</html>