<%-- 
    Document   : getUser
    Created on : 28 janv. 2017, 11:42:43
    Author     : User
--%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="entite.Utilisateur"%>
<%@page import="metier.Connexion"%>
<%@page import="metier.GestionDate"%>
<%@page import="entite.ConnexionDeconnexion"%>
<%@page import="java.util.List"%>
<%@page import="entite.Tag"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    String email = request.getParameter("username");
    String pwd = request.getParameter("password");
    //out.print(email);
    Connexion fonction = new Connexion(email, pwd);
    Utilisateur u = new Utilisateur();
    JSONObject obj = new JSONObject();
    boolean var = fonction.connected();
    if (var == true) {
        int i = u.getIdUtilisateur(email);
        obj.put("value", 1);
        obj.put("id", i);
        out.println(obj);

        GestionDate gd = new GestionDate();
        Date date = gd.getDateAuj();
        Time he = gd.getHeureAuj();

        ConnexionDeconnexion cd = new ConnexionDeconnexion();
        cd.setDateconnexion(date);
        cd.setHeureconnexion(he);
        cd.setIduser(i);

        cd.insertCoDe();

    } else {
        obj.put("value", 0);
        out.println(obj);
    }


%>