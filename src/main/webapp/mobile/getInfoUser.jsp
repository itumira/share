<%-- 
    Document   : getInfoUser
    Created on : 9 févr. 2017, 15:01:27
    Author     : User
--%>

<%@page import="entite.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    int id=Integer.parseInt(request.getParameter("idu"));
    Utilisateur u=new Utilisateur();
    u.setIduser(id);
    u.getByIdUtilisateur();
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    obj.put("nomprenom", u.getNomPrenom());
    obj.put("image", u.getImguser());
    out.print(obj);
%>