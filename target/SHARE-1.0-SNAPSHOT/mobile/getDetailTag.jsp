<%-- 
    Document   : getDetailTag
    Created on : 31 janv. 2017, 11:07:54
    Author     : User
--%>
<%@page import="entite.DetPublication"%>
<%@page import="entite.Utilisateur"%>
<%@page import="java.util.List"%>
<%@page import="entite.Tag"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    int id = Integer.parseInt(request.getParameter("idtag"));
    Utilisateur user = new Utilisateur();
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    List<DetPublication> liste = user.getAllPublicationsByTag(id);
    for (DetPublication e : liste) {
        obj = new JSONObject();
        obj.put("id", e.getIduser());
        obj.put("contenupublication", e.getContenupublication());
        obj.put("date", e.getDatepublication());
        obj.put("heure", e.getHeurepublication());
        obj.put("confidentialite", e.getConfidentialite());
        obj.put("latitude", e.getLatitude());
        obj.put("longitude", e.getLongitude());
        obj.put("nbrep", e.getNbrpa());
        obj.put("nomprenom", e.getNomPrenom());
        arr.put(obj);
    }
    out.println(arr);
%>

