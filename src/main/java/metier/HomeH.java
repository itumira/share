package metier;

import database.BasicsFunctions;
import database.DBConnect;
import entite.ConnexionDeconnexion;
import entite.DetPublication;
import entite.Tag;
import entite.Utilisateur;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class HomeH {

    public List<Tag> getListTag(Connection c) {
        List<Tag> liste = new ArrayList();
        String query = "SELECT * FROM tag ORDER BY thetag ASC LIMIT 10";
        System.out.println(query);
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                Tag tag = new Tag();
                tag.setIdtag(rs.getInt("idtag"));
                tag.setThetag(rs.getString("thetag"));
                hasnext = rs.next();
                liste.add(tag);
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public List<Utilisateur> listeDemandes(Connection c, int iduser) {
        ConnexionDeconnexion codeco = new ConnexionDeconnexion();
        codeco.setIduser(iduser);
        codeco.getCoDeco();

        List<Utilisateur> liste = new ArrayList();

        String query = "select u.* from avoirdemandenotconfirmed a "
                + "INNER JOIN utilisateur u ON a.iduserdemandeur=u.iduser "
                + "WHERE a.date>='" + codeco.getDateconnexion() + "' "
                + "and a.heure>='" + codeco.getHeureconnexion() + "' "
                + "and a.iduserdemander=" + codeco.getIduser() + " ORDER BY a.date DESC LIMIT 5";

        DBConnect dbc = new DBConnect();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);
        System.out.println(query);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                Utilisateur tmp = new Utilisateur();
                tmp.setIduser(rs.getInt("iduser"));
                tmp.setNomuser(rs.getString("nomuser"));
                tmp.setPrenomuser(rs.getString("prenomuser"));
                tmp.setEmailuser(rs.getString("emailuser"));
                tmp.setImguser(rs.getString("imguser"));
                liste.add(tmp);
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
        return liste;
    }

    public String getTagsJson(Connection c, Tag tag) {
        List<DetPublication> listeta = tag.getAllPublications();

        String rep = "";
        JSONArray val = new JSONArray();

        JSONObject obj = new JSONObject();
        JSONArray arr = new JSONArray();

        for (DetPublication p : listeta) {
            try {
                obj = new JSONObject();
                obj.put("idpublication", p.getIdpublication());
                obj.put("contenupublication", p.getContenupublication());
                obj.put("confidentialite", p.getConfidentialite());
                obj.put("nomprenom", p.getNomPrenom());
                obj.put("iduser", p.getIduser());
                obj.put("idpublication", p.getIdpublication());
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                obj.put("date", sdf.format(p.getDatepublication()));
                obj.put("heure", p.getHeurepublication());
                obj.put("nbrpa", p.getNbrpa());
                arr.put(obj);
            } catch (JSONException ex) {
            }
        }
        rep = arr.toString();
        return rep;
    }
}
