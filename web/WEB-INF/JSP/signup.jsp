<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='signup' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>

<form method="post">
    <label><fmt:message key="username"/>
        <input name="username" value="${param.username}" required autofocus>
        <span>${fouten.username}</span></label>

    <label><fmt:message key="email"/>
        <input name="email" value="${param.email}" required>
        <span>${fouten.email}</span></label>

    <label><fmt:message key="password"/>
        <input name="password" type="password" required minlength="8">
        <span>${fouten.password}</span></label>

    <label><fmt:message key="passwordRepeat"/>
        <input name="password2" type="password" required minlength="8"></label>

    <input type="submit" name="signupKnop" value="${titel}" id="signupKnop">
</form>

</body>
</html>