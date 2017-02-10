<%-- 
    Document   : getDemande
    Created on : 6 févr. 2017, 15:04:27
    Author     : User
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="entite.Utilisateur"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    int id=Integer.parseInt(request.getParameter("idu"));
    Utilisateur user=new Utilisateur();
    user.setIduser(id);
    List<Utilisateur> listeDemande=user.getDemandesNotAnswered();
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
   
    for(Utilisateur  e: listeDemande)
    {
        obj = new JSONObject();
        obj.put("id",e.getIduser());
        obj.put("nomprenom",e.getNomPrenom());
        obj.put("image",e.getImguser());
        arr.put(obj);
    }
      out.println(arr);
    
%>

