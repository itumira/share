<%@page import="entite.DemandeAbonnement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String demandeur = request.getParameter("idlui");
    String demander = request.getParameter("idmoi");
    DemandeAbonnement da = new DemandeAbonnement();
    da.setIduserdemander(Integer.parseInt(demander));
    da.setIduserdemandeur(Integer.parseInt(demandeur));
    da.rollbackDemande();
    out.print("Ok");
%>