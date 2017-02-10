<%-- 
    Document   : modifUser
    Created on : 1 févr. 2017, 00:19:02
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
    String ancienmdp=request.getParameter("ancienmdp");
    String newmdp=request.getParameter("newmdp");
    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();
    int i=user.verifPwd(ancienmdp);
    if(i==1)
    {
        user.ModifUtilisateur(newmdp);
        obj.put("modif",1);
        out.println(obj);
    }
    else
    {
        obj.put("modif",0);
        out.println(obj);
    }
%>

