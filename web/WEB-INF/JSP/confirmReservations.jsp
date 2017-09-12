<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='comfirmReservations' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>
<h2><fmt:message key="step1"/> <fmt:message key="login"/> </h2>

<form method="post">
    <c:choose>
        <c:when test="${user.username eq null}">
            <dl>
                <label><dt><fmt:message key="username"/></dt>
                    <dd><input name="username" value="${param.username}" required autofocus>
                        <span>${faults.username}</span></dd></label>
                <label><dt><fmt:message key="password"/></dt>
                    <dd><input type="password" name="password">
                        <span>${faults.password}</span></dd></label>
                <dt></dt>
                <dd><input type="submit" name="loginKnop" value='<fmt:message key="login"/>' id="loginKnop"></dd>
            </dl>
        </c:when>
        <c:otherwise>
            <dl>
                <dt><fmt:message key="youAreSignedIn"/></dt>
                <dd>${user.lastname} ${user.prename} ${user.street} ${user.streetnr} ${user.zipcode} ${user.city}
                    <input type="submit" name="logoutKnop" value='<fmt:message key="logout"/>' id="logoutKnop"></dd>
            </dl>
        </c:otherwise>
    </c:choose>


<h2><fmt:message key="step2"/> <fmt:message key="comfirmReservations"/> </h2>

    <input type="submit" value='<fmt:message key="comfirmReservations"/> ' name="confirmReser"
           <c:if test="${user.username eq null}">
           disabled
    </c:if>
    >
</form>
</body>
</html>