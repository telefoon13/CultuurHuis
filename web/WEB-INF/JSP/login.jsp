<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='login' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:languages/>
<vdab:menu/>
<h1>${titel}</h1>

<form method="post">
    <label><fmt:message key="username"/>
        <input name="username" value="${param.username}" required autofocus>
        <span>${fouten.username}</span></label>
    <label><fmt:message key="password"/>
        <input type="password" name="password">
        <span>${fouten.password}</span></label>
    <input type="submit" name="loginKnop" value="${titel}" id="loginKnop">
</form>

</body>
</html>