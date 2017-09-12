<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<fmt:message key='reserveBasket' var="titel"/>
<!doctype html>
<html lang="nl">
<head>
    <vdab:head title="${titel}"/>
</head>
<body>
<vdab:menu/>
<h1>${titel}</h1>
<c:if test="${basket ne null}">
    <a href="<c:url value="confirmreservations.htm"/>"><fmt:message key="comfirmReservations"/></a>
    <br><br>
    <form method="post">
<table class="performancesTable">
    <tr class="tableTitle">
        <th width="20%"><fmt:message key="date"/></th>
        <th><fmt:message key="title"/></th>
        <th><fmt:message key="performers"/></th>
        <th width="10%"><fmt:message key="price"/></th>
        <th width="10%"><fmt:message key="seats"/></th>
        <th width="10%"><input type="submit" name="deleteBasketButton" value='<fmt:message key="delete"/>'></th>
    </tr>
    <c:set value="0" var="totalCost"/>
    <c:forEach var="basketItem" items="${basket}" varStatus="status">
    <tr class="${status.index mod 2 eq 0 ? "tableLight" : "tableDark"}">
        <th>${basketItem.key.date}</th>
        <th>${basketItem.key.title}</th>
        <th>${basketItem.key.performers}</th>
        <th>${basketItem.key.price}</th>
        <th>${basketItem.value}</th>
        <th><input type="checkbox" name="toDeleteId" value="${basketItem.key.id}" id="toDeleteId"/></th>
    </tr>
        <c:set value="${totalCost + (basketItem.key.price * basketItem.value)}" var="totalCost"/>
    </c:forEach>
    <tr><th colspan="6">&emsp;</th></tr>
    <tr class="tableTitle">
        <th colspan="6" style="text-align: left"><fmt:message key="total"/> : &euro; ${totalCost}</th>
    </tr>
</table>
    </form>
    ${test1}<br>
    ${test2}<br>
    ${test3}<br>
    ${test4}<br>
</c:if>
</body>
</html>