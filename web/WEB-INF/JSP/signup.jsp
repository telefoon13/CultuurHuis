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
    <label><fmt:message key="firstname"/>
        <input name="prename" value="${param.prename}" required autofocus>
        <span>${fouten.prename}</span></label>
    <label><fmt:message key="lastname"/>
        <input name="lastname" value="${param.lastname}" required>
        <span>${fouten.lastname}</span></label>
    <label><fmt:message key="street"/>
        <input name="street" value="${param.street}" required>
        <span>${fouten.street}</span></label>
    <label><fmt:message key="streetnr"/>
        <input name="streetnr" value="${param.streetnr}" required>
        <span>${fouten.streetnr}</span></label>
    <label><fmt:message key="zipcode"/>
        <input name="zipcode" value="${param.zipcode}" required>
        <span>${fouten.zipcode}</span></label>
    <label><fmt:message key="city"/>
        <input name="city" value="${param.city}" required>
        <span>${fouten.city}</span></label>

    <label><fmt:message key="username"/>
        <input name="username" value="${param.username}" required>
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