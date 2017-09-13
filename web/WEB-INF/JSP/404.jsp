<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='404' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>
<iframe src="https://notfound-static.fwebservices.be/404/index.html?&amp;key=a6969001bec15c051d0ab31f6b7934cc" width="650px" height="650px" align="left" frameborder="0"></iframe>
</body>
</html>