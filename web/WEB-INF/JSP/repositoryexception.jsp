<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='500' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>
<img src="<c:url value="/images/datafout.jpg" />" alt="${titel}"/>
</body>
</html>