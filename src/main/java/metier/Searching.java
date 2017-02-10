package metier;

import database.BasicsFunctions;
import database.DBConnect;
import entite.Utilisateur;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Searching {

    public List<String> listeMotsCles(String query) {
        List<String> listemots = new ArrayList();
        String tmp = query;
        StringTokenizer st = new StringTokenizer(tmp);
        while (st.hasMoreTokens()) {
            listemots.add(st.nextToken());
        }
        List<String> liste = new ArrayList();
        for (String mot : listemots) {
            liste.add(mot);
        }
        return liste;
    }

    public String avoircrit(String query) {
        List<String> liste = listeMotsCles(query);
        String critN = "nomuser ilike '%" + liste.get(0) + "%'";
        String critP = "prenomuser ilike '%" + liste.get(0) + "%'";
        for (int i = 1; i < liste.size(); i++) {
            critN = critN + " or nomuser ilike '%" + liste.get(i) + "%'";
            critP = critP + " or prenomuser ilike '%" + liste.get(i) + "%'";
        }
        return critN + " or " + critP;
    }

    public String requete(String query) {
        return "SELECT * FROM utilisateur WHERE " + avoircrit(query) + " ORDER BY nomuser ASC";
    }

    public List<Utilisateur> getSearchResult(String qu) {
        List<Utilisateur> liste = new ArrayList();
        String query = requete(qu);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
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
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                rs.close();
                c.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public static void main(String[] Args) {
        Searching sea = new Searching();
        String a = "allo oui non";
        System.out.println(sea.avoircrit(a));
    }
}
