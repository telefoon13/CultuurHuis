<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='performances' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>

<!-- Genre menu balk hier -->
<c:forEach var="genre" items="${genres}" varStatus="status">
<a href="<c:url value="/performances.htm?genre=${genre.id}"/> ">${genre.name}</a>
<c:if test="${not status.last}">
    &nbsp;|&nbsp;
</c:if>
</c:forEach>
<h1>${titel}</h1>
<c:if test="${performances ne null}">
    <h2>${actifGenre} : <fmt:message key="performances"/></h2>
<table class="performancesTable">
    <tr class="tableTitle">
        <th width="20%"><fmt:message key="date"/></th>
        <th><fmt:message key="title"/></th>
        <th><fmt:message key="performers"/></th>
        <th width="10%"><fmt:message key="price"/></th>
        <th width="10%"><fmt:message key="freeSeats"/></th>
        <th width="10%"><fmt:message key="reserve"/></th>
    </tr>
    <c:forEach var="performance" items="${performances}" varStatus="status">
    <tr class="${status.index mod 2 eq 0 ? "tableLight" : "tableDark"}">
        <th>${performance.date}</th>
        <th>${performance.title}</th>
        <th>${performance.performers}</th>
        <th>${performance.price}</th>
        <th>${performance.freeseats}</th>
        <th>
            <c:if test="${performance.freeseats > 0}">
                <a href="<c:url value="/reserve.htm?id=${performance.id}"/>"><fmt:message key="reserve"/></a>
            </c:if>
        </th>
    </tr>
    </c:forEach>
</table>
</c:if>
</body>
</html>