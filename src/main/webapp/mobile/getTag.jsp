<%-- 
    Document   : getTag
    Created on : 28 janv. 2017, 11:27:36
    Author     : User
--%>


<%@page import="java.util.List"%>
<%@page import="entite.Tag"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    Tag liste = new Tag();
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    List<Tag> listeTag = liste.getListTag();
    for (Tag e : listeTag) {
        obj = new JSONObject();
        obj.put("idtag", e.getIdtag());
        obj.put("nomtag", e.getThetag());
        arr.put(obj);
    }
    out.println(arr);

%>

