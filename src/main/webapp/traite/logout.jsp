<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    String site = "../index.jsp";
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>