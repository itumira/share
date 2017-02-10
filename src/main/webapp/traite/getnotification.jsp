<%@page import="entite.Utilisateur"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.DBConnect"%>
<%@page import="entite.DemandeAbonnement"%>
<%@page import="java.util.List"%>
<%@page import="metier.HomeH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int iduser = Integer.parseInt(request.getParameter("idus"));
    DBConnect dbc = new DBConnect();
    Connection c = dbc.getconn();
    HomeH home = new HomeH();
    List<Utilisateur> listedemande = home.listeDemandes(c, iduser);

    JSONObject obj = new JSONObject();
    JSONArray arr = new JSONArray();

    for (Utilisateur da : listedemande) {
        obj = new JSONObject();
        obj.put("iduser", da.getIduser());
        obj.put("nomuser", da.getNomPrenom());
        arr.put(obj);
    }
    out.print(arr);
    c.close();
%>
