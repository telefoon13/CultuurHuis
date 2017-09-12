<%@tag description='menu' pageEncoding='UTF-8' %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %>
<fmt:setBundle basename="teksten"/>
<header>
    <vdab:languages/>
    <div class="menuLogo"><img src="<c:url value="/images/voorstellingen.png"/> "/></div>
    <div class="titel"><fmt:message key="cultuurHuis"/></div>
    <nav>
        <ul>
            <li><a href="<c:url value="/index.htm"/>"><fmt:message key="home"/></a></li>
            <li><a href="<c:url value="/performances.htm"/>"><fmt:message key="performances"/></a></li>
            <c:choose>
                <%-- Zonder inlog session --%>
                <c:when test="${user.username eq null}">
                    <li><a href="<c:url value="/login.htm"/>"><fmt:message key="login"/></a></li>
                    <li><a href="<c:url value="/signup.htm"/>"><fmt:message key="signup"/></a></li>
                </c:when>
                <%-- Met inlog session --%>
                <c:otherwise>
                    <li><a href="<c:url value="/reservations.htm"/>"><fmt:message key="reservations"/></a></li>
                    <li><a href="<c:url value="/login.htm?logout=logout"/>"><fmt:message key="logout"/></a></li>
                </c:otherwise>
            </c:choose>
            <c:if test="${basket ne null}">
                <li><a href="<c:url value="/reserveBasket.htm"/>"><fmt:message key="reserveBasket"/></a></li>
            </c:if>
        </ul>
    </nav>
</header>