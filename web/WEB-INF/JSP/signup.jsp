<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%--suppress ALL --%>
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
    <dl>
        <label>
            <dt><fmt:message key="firstname"/> :</dt>
            <dd><input name="prename" value="${param.prename}" required autofocus>
                <span>${fouten.prename}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="lastname"/> :</dt>
            <dd><input name="lastname" value="${param.lastname}" required>
                <span>${fouten.lastname}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="street"/> :</dt>
            <dd><input name="street" value="${param.street}" required>
                <span>${fouten.street}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="streetnr"/> :</dt>
            <dd><input name="streetnr" value="${param.streetnr}" required>
                <span>${fouten.streetnr}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="zipcode"/> :</dt>
            <dd><input name="zipcode" value="${param.zipcode}" required>
                <span>${fouten.zipcode}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="city"/> :</dt>
            <dd><input name="city" value="${param.city}" required>
                <span>${fouten.city}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="username"/> :</dt>
            <dd><input name="username" value="${param.username}" required>
                <span>${fouten.username}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="email"/> :</dt>
            <dd><input name="email" value="${param.email}" required>
                <span>${fouten.email}</span>
        </label>

        <label>
            <dt><fmt:message key="password"/> :</dt>
            <dd><input name="password" type="password" required minlength="8">
                <span>${fouten.password}</span></dd>
        </label>

        <label>
            <dt><fmt:message key="passwordRepeat"/> :</dt>
            <dd><input name="password2" type="password" required minlength="8"></dd>
        </label>

        <dt>&emsp;</dt>
        <dd><input type="submit" name="signupKnop" value="${titel}" id="signupKnop"></dd>
    </dl>
</form>

</body>
</html>