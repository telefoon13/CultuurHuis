<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='reserve' var="titel"/>
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
    <dt><fmt:message key="performance"/></dt>
    <dd>${performance.title}</dd>

    <dt><fmt:message key="performers"/></dt>
    <dd>${performance.performers}</dd>

    <dt><fmt:message key="date"/></dt>
    <dd>${performance.date}</dd>

    <dt><fmt:message key="price"/> </dt>
    <dd>&euro; ${performance.price}</dd>

    <dt><fmt:message key="freeSeats"/></dt>
    <dd>${performance.freeseats}</dd>

    <dt></dt>
    <dd><label><input autofocus type="number" min="1" max="${performance.freeseats}" name="numbOfTickets"
               <c:if test="${basket ne null}">
               value="${basket[performance.id].value}"
    </c:if>
    ><span><c:if test="${!empty error}"><fmt:message key="${error}"/></c:if></span></label></dd>

    <dt><input type="hidden" name="performanceid" value="${performance.id}"></dt>
    <dd><input type="submit" name="reserveTickets" value='<fmt:message key="reserve"/>'></dd>
</dl>
</form>
</body>
</html>