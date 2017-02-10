<%-- 
    Document   : insertUser
    Created on : 1 févr. 2017, 16:53:44
    Author     : User
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="entite.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    String email = request.getParameter("email");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String pwd = request.getParameter("motdepasse");
    Utilisateur user = new Utilisateur();
    user.setEmailuser(email);
    user.setNomuser(nom);
    user.setPrenomuser(prenom);
    user.setPwduser(pwd);
    int idnewuser = user.insertNewUserId();

    JSONObject obj = new JSONObject();
    obj.put("idnewuser", idnewuser);
    out.print(obj);
%>