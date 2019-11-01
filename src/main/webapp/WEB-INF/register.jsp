<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <c:choose>
                <c:when test="${userempty.length() > 0}">
                    <input id="username" name="username" class="form-control" type="text">
                    <div>${userempty}</div>
                </c:when>
                <c:when test="${userexists.length() > 0}">
                    <input id="username" name="username" class="form-control" type="text">
                    <div>${userexists}</div>
                </c:when>
                <c:otherwise>
                    <input id="username" name="username" class="form-control" type="text">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <c:choose>
                <c:when test="${email.length() > 0}">
                    <input id="email" name="email" class="form-control" type="text">
                    <div>${email}</div>
                </c:when>
                <c:when test="${emailempty.length() > 0}">
                    <input id="email" name="email" class="form-control" type="text">
                    <div>${emailempty}</div>
                </c:when>
                <c:when test="${emailexists.length() > 0}">
                    <input id="email" name="email" class="form-control" type="text">
                    <div>${emailexists}</div>
                </c:when>
                <c:otherwise>
                    <input id="email" name="email" class="form-control" type="text">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <c:choose>
                <c:when test="${pwdempty.length() > 0}">
                    <input id="password" name="password" class="form-control" type="password">
                    <div>${pwdempty}</div>
                </c:when>
                <c:when test="${pwdmatch.length() > 0}">
                    <input id="password" name="password" class="form-control" type="password">
                    <div>${pwdmatch}</div>
                </c:when>
                <c:otherwise>
                    <input id="password" name="password" class="form-control" type="password">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>
</body>
</html>