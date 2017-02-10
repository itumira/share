
</div><!--end right  content-->
</div>
</div>
</div><!-- end timeline content-->
<%@ include file="../inc/inc-tags.jsp" %>
<%@ include file="../inc/inc-foot.jsp" %>
</body>
</html>
<% 
} else {
    String site = "index.jsp";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
}
%>