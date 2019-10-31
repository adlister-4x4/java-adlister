<%--
  Created by IntelliJ IDEA.
  User: matt_lopez
  Date: 10/29/19
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here is your ad!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>ad user id ${ad.userId}</p>
            <p>ad id ${ad.id}</p>
            <p>"/ad?ad_id=${ad.id}"</p>

        </div>
    </c:forEach>

    <c:forEach var="user" items="${users}">
        <div class="col-md-6">
            <img src="https://i.pravatar.cc/200" alt="image placeholder">
            <h2>Username: ${user.username}</h2>
            <p>User email: ${user.email}</p>
            <p>User password: ${user.password}</p>
            <p>User id ${user.id}</p>

        </div>
    </c:forEach>
</div>

</body>
</html>

