<%@page import="entite.Tag"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DBConnect"%>
<%@page import="metier.HomeH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    String idtag = request.getParameter("idtag");
    int tid = Integer.parseInt(idtag);
    HomeH homeh = new HomeH();

    DBConnect dbc = new DBConnect();
    Connection c = dbc.getconn();

    Tag t = new Tag();
    t.setIdtag(tid);
    out.print(homeh.getTagsJson(c, t));
%>