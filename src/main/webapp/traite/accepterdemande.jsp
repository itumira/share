<%@page import="metier.GestionDate"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="entite.Abonnes"%>
<%@page import="entite.DemandeAbonnement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String demandeur = request.getParameter("idlui");
    String demander = request.getParameter("idmoi");
    
    GestionDate gd = new GestionDate();
    
    Date da = gd.getDateAuj();
    Time he = gd.getHeureAuj();

//DemandeAbonnement da = new DemandeAbonnement();
    // da.setIduserdemander(Integer.parseInt(demander));
    //da.setIduserdemandeur(Integer.parseInt(demandeur));
    //da.insertDemande();
    Abonnes a = new Abonnes();
    a.setIduserabonnant(Integer.parseInt(demandeur));
    a.setIduserabonne(Integer.parseInt(demander));
    a.setDateaccepation(da);
    a.setHeureacceptation(he);
    a.insertAbonnes();
    out.print("Ok");
%>