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
    <link rel="stylesheet" href="../../css/singleAdStyles.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <button id="back-button" class="btn btn-primary" onclick="window.location.href = '/ads';"> &#8617 Back to Ads </button>
    <div class="row">
        <c:forEach var="user" items="${users}">
            <div id="left-side" class="col-md-6">
                <img id="user-img" src="https://i.pravatar.cc/200" alt="image placeholder">
                <h2 id="username">Username: ${user.username}</h2>


            </div>
        </c:forEach>
        <c:forEach var="ad" items="${ads}">
            <div id="right-side" class="col-md-6">
                <h2 id="ad-title">${ad.title}</h2>
                <p id="ad-description">${ad.description}</p>
                    <%--            <p>ad user id ${ad.userId}</p>--%>
                    <%--            <p>ad id ${ad.id}</p>--%>
                    <%--            <p>"/ad?ad_id=${ad.id}"</p>--%>

            </div>
        </c:forEach>

    </div>
</div>

</body>
</html>