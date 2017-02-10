<%@page import="entite.Utilisateur"%>
<%@page import="database.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="metier.Publier"%>
<%@page import="entite.Publication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String contenu = request.getParameter("publication");
    String longitude = request.getParameter("longitude");
    String latitude = request.getParameter("latitude");
    int confi = Integer.parseInt(request.getParameter("confid"));
    int iduser = Integer.parseInt(request.getParameter("shid"));
    
    Publication p = new Publication();
    p.setContenupublication(contenu);
    p.setLongitude(longitude);
    p.setLatitude(latitude);
    p.setIdconfidentialite(confi);
    p.setIduser(iduser);
    
    Utilisateur u = new Utilisateur();
    u.getByIdUtilisateur();
    
    DBConnect dbc=new DBConnect();
    Connection c = dbc.getconn();
    
    Publier publier = new Publier();
    publier.insertPublier(c, p);
    
    out.println("<div class=\"panel panel-white post panel-shadow\">"
            + " <div class=\"post-heading\">"
            + " <div class=\"pull-left image\">"
            + " <img src=\"img/Friends/guy-3.jpg\" class=\"avatar\" alt=\"user profile image\"> "
            + " </div>"
            + "<div class=\"pull-left meta\">"
            + "<div class=\"title h5\">"
            + "<a href=\"profile.jsp?uid="+iduser+"\" class=\"post-user-name\">"+u.getNomPrenom()+"</a>"
            + "a publi&eacute;."
            + "</div>"
            + "<h6 class=\"text-muted time\">il y a une minute</h6>"
            + "</div>"
            + "</div> "
            + "<div class=\"post-description\"> "
            + "<p>"+p.getContenupublication()+"</p>"
            + "<div class=\"stats\">"
            + "<a href=\"#\" class=\"stat-item\">"
            + "<i class=\"fa fa-binoculars icon\"></i> essai"
            + "</a>"
            + "<a href=\"#\" class=\"stat-item\">"
            + "<i class=\"fa fa-share icon\"></i> 12"
            + "</a>"
            + "<a href=\"#\" class=\"stat-item\">"
            + "<i class=\"fa fa-map-marker icon\"></i> Andoharanofotsy"
            + "</a>"
            + "</div></div></div>");
%>

