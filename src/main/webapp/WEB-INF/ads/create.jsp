<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
            <c:choose>
                <c:when test="${errors.titleerror.length() > 0}">
                    <div>${errors.titleerror}</div>
                </c:when>
            </c:choose>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
            <c:choose>
                <c:when test="${errors.descriptionerror.length() > 0}">
                    <div>${errors.descriptionerror}</div>
                </c:when>
            </c:choose>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
