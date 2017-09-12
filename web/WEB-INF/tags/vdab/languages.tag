<%@tag description='taalkeuze' pageEncoding='UTF-8' %>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<c:set value='${requestScope["javax.servlet.forward.request_uri"]}?${requestScope["javax.servlet.forward.query_string"]}' var='redirectURL'/>

<c:url value='languages.htm' var='nlBEURL'>
    <c:param name='language' value='nl'/>
    <c:param name='country' value='BE'/>
    <c:param name='redirectURL' value='${redirectURL}'/>
</c:url>

<c:url value='languages.htm' var='enUSURL'>
    <c:param name='language' value='en'/>
    <c:param name='country' value='US'/>
    <c:param name='redirectURL' value='${redirectURL}'/>
</c:url>

<c:url value='languages.htm' var='frFRURL'>
    <c:param name='language' value='fr'/>
    <c:param name='country' value='FR'/>
    <c:param name='redirectURL' value='${redirectURL}'/>
</c:url>
<div class="languages">
    <a href='${nlBEURL}'><img src="<c:url value="/images/BE.png"/>"></a>
    <a href='${enUSURL}'><img src="<c:url value="/images/US.png"/>"></a>
    <a href='${frFRURL}'><img src="<c:url value="/images/FR.png"/>"></a>
</div>