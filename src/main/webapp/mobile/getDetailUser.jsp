<%-- 
    Document   : getDetailUser
    Created on : 31 janv. 2017, 18:30:16
    Author     : User
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="entite.DetUtilisateur"%>
<%@page import="entite.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    int idmoi = Integer.parseInt(request.getParameter("idu"));
    int idlui = Integer.parseInt(request.getParameter("idabonne"));

    Utilisateur user = null;
    if (idmoi == idlui) {
        user = new Utilisateur();
        user.setIduser(idmoi);
        user.getByIdUtilisateur();
        DetUtilisateur utilisateur = user.getDetailUser();

        JSONArray arr = new JSONArray();
        JSONObject obj = new JSONObject();

        obj.put("nbrepublication", utilisateur.getNbrepublication());
        obj.put("nbreabonnes", utilisateur.getNbreabonnes());
        obj.put("nbreabonnements", utilisateur.getNbreabonnement());
        obj.put("nom", user.getNomuser());
        obj.put("prenom", user.getPrenomuser());
        obj.put("email", user.getEmailuser());
        obj.put("image", user.getImguser());
        obj.put("moioupas", "true");
        obj.put("isfollowedtoo", "none");
        obj.put("asknotconfirmed", "none");
        arr.put(obj);
        out.println(obj);
    } else {
        user = new Utilisateur();
        user.setIduser(idlui);
        user.getByIdUtilisateur();
        DetUtilisateur utilisateur = user.getDetailUser();

        Utilisateur moi = new Utilisateur();
        moi.setIduser(idmoi);
        
        JSONArray arr = new JSONArray();
        JSONObject obj = new JSONObject();

        obj.put("nbrepublication", utilisateur.getNbrepublication());
        obj.put("nbreabonnes", utilisateur.getNbreabonnes());
        obj.put("nbreabonnements", utilisateur.getNbreabonnement());
        obj.put("nom", user.getNomuser());
        obj.put("prenom", user.getPrenomuser());
        obj.put("email", user.getEmailuser());
        obj.put("image", user.getImguser());
        obj.put("moioupas", "false");
        obj.put("isfollowedtoo",String.valueOf(moi.isFollowedToo(idlui)));
        obj.put("asknotconfirmed",String.valueOf(moi.askNotConfirmed(idlui)));
        arr.put(obj);
        out.println(obj);
    }
%>