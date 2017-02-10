<%-- 
    Document   : publier
    Created on : 2 févr. 2017, 11:11:43
    Author     : User
--%>

<%@page import="metier.Publier"%>
<%@page import="database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="entite.Publication"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entite.Utilisateur"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    String statut = request.getParameter("publication");
    int id = Integer.parseInt(request.getParameter("iduser"));
    int idconf = Integer.parseInt(request.getParameter("idconfidentialite"));
    String longitude = request.getParameter("longitude");
    String latitude = request.getParameter("latitude");
    Publication p = new Publication();
    statut = statut.replaceAll("35;", "#");
    p.setContenupublication(statut);
    p.setLongitude(longitude);
    p.setLatitude(latitude);
    p.setIdconfidentialite(idconf);
    p.setIduser(id);
    DBConnect dbc = new DBConnect();
    Connection c = dbc.getconn();
    Publier publier = new Publier();
    publier.insertPublier(c, p);

%>


