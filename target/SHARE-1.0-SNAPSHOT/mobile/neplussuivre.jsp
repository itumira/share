<%@page import="entite.Abonnes"%>
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
    Abonnes a = new Abonnes();
    a.setIduserabonnant(Integer.parseInt(demandeur));
    a.setIduserabonne(Integer.parseInt(demander));
    a.rollbackAbonnement();
%>
