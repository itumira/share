<%-- 
    Document   : annulerdemande
    Created on : 6 févr. 2017, 16:11:27
    Author     : User
--%>

<%@page import="entite.DemandeAbonnement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    String demandeur = request.getParameter("idmoi");
    String demander = request.getParameter("idlui");
    DemandeAbonnement da = new DemandeAbonnement();
    da.setIduserdemander(Integer.parseInt(demander));
    da.setIduserdemandeur(Integer.parseInt(demandeur));
    da.rollbackDemande();
%>