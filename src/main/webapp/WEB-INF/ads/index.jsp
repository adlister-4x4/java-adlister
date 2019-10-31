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

    <div>
        <form action="/ads" method="POST">
            <input name="searchString" class="form-control" type="text" placeholder="Search" aria-label="Search">
            <button type="submit" class="main-btn btn btn-primary"><i class="fas fa-dollar-sign"></i>Search</button>
        </form>
    </div>


    <h1>Here Are all the ads!</h1>


    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>ad user id ${ad.userId}</p>
            <p>ad id ${ad.id}</p>
            <p>"/ad?ad_id=${ad.id}"</p>
<%--            sending clicked ad id to servlet--%>
            <a href="/ad?user_id=${ad.userId}&ad_id=${ad.id}">Go to ads page</a>
        </div>
    </c:forEach>
</div>

</body>
</html>
