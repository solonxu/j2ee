<%-- General purpose JSP includes, useful on other pages.  This allows us to
     consolidate these entries in one place instead of having to manually
     repeat them on every page. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>