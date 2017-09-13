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

            <c:if test="${user.username eq null}">
                <li><a href="<c:url value="/signup.htm"/>"><fmt:message key="signup"/></a></li>
            </c:if>

            <c:if test="${basket ne null}">
                <li><a href="<c:url value="/reserveBasket.htm"/>"><fmt:message key="reserveBasket"/></a></li>
                <li><a href="<c:url value="/confirmreservations.htm"/>"><fmt:message key="comfirmReservations"/></a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>