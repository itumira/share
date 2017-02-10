<%@page import="entite.Tag"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DBConnect"%>
<%@page import="metier.HomeH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $('.chat-sidebar, .nav-controller, .chat-sidebar a, .hide-chat').on('click', function (event) {
        $('.chat-sidebar').toggleClass('focus');
    });
    $(".hide-chat").click(function () {
        $('.chat-sidebar').toggleClass('focus');
    });
</script>

<%
    DBConnect dbc = new DBConnect();
    Connection c = dbc.getconn();
    HomeH trano = new HomeH();
    List<Tag> listetag = trano.getListTag(c);
    c.close();
%>

<!-- Online users sidebar content-->
<div class="chat-sidebar focus">
    <div class="list-group text-left">
        <p class="text-center visible-xs"><a href="#" class="hide-chat">Hide</a></p> 
        <p class="text-center chat-title">Les Tags R&eacute;cents</p>  
        <%
            for (Tag t : listetag) {
        %>
        <a href="tag.jsp?tid=<% out.print(t.getIdtag());%>" class="list-group-item">
            
            <h4 class=""><% out.print(t.getThetag()); %></h4>
        </a>
        <%
            }
        %>

    </div>
</div><!-- Online users sidebar content-->
