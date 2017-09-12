<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='reservations' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>
${freeseats}
${numtickets}
<c:if test="${doneMap ne null}">
<h2><fmt:message key="suc6reservations"/></h2>
<table class="performancesTable">
    <tr class="tableTitle">
        <th width="20%"><fmt:message key="date"/></th>
        <th><fmt:message key="title"/></th>
        <th><fmt:message key="performers"/></th>
        <th width="10%"><fmt:message key="price"/></th>
        <th width="10%"><fmt:message key="freeSeats"/></th>
        <th width="10%"><fmt:message key="tickets"/></th>
    </tr>
    <c:forEach var="doneMapa" items="${doneMap}" varStatus="status">
        <tr class="${status.index mod 2 eq 0 ? "tableLight" : "tableDark"}">
            <th>${doneMapa.key.date}</th>
            <th>${doneMapa.key.title}</th>
            <th>${doneMapa.key.performers}</th>
            <th>${doneMapa.key.price}</th>
            <th>${doneMapa.key.freeseats}</th>
            <th>${doneMapa.value}</th>
        </tr>
    </c:forEach>
</table>
</c:if>
<c:if test="${failedMap ne null}">
    <h2><fmt:message key="failedreservations"/></h2>
    <table class="performancesTable">
        <tr class="tableTitle">
            <th width="20%"><fmt:message key="date"/></th>
            <th><fmt:message key="title"/></th>
            <th><fmt:message key="performers"/></th>
            <th width="10%"><fmt:message key="price"/></th>
            <th width="10%"><fmt:message key="freeSeats"/></th>
            <th width="10%"><fmt:message key="tickets"/></th>
        </tr>
        <c:forEach var="failedMapa" items="${failedMap}" varStatus="status">
            <tr class="${status.index mod 2 eq 0 ? "tableLight" : "tableDark"}">
                <th>${failedMapa.key.date}</th>
                <th>${failedMapa.key.title}</th>
                <th>${failedMapa.key.performers}</th>
                <th>${failedMapa.key.price}</th>
                <th>${failedMapa.key.freeseats}</th>
                <th>${failedMapa.value}</th>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>