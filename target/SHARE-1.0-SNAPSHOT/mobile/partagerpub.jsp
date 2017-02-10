<%-- 
    Document   : partagerpub
    Created on : 7 févr. 2017, 10:24:26
    Author     : User
--%>
<%@page import="entite.Utilisateur"%>
<%@page import="database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="metier.Publier"%>
<%@page import="entite.Partage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    int iduser = Integer.parseInt(request.getParameter("idu"));
    int idpublication = Integer.parseInt(request.getParameter("idpublication"));
    Partage p = new Partage();
    p.setIdpublication(idpublication);
    p.setIduser(iduser);
    p.setLongitude(0);
    p.setLatitude(0);
    p.insertPartager();
%>


