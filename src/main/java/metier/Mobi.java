package metier;

import database.BasicsFunctions;
import database.DBConnect;
import entite.ConnexionDeconnexion;
import entite.DetPartage;
import entite.DetPublication;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Mobi {

    public double distanceVolOiseauEntre2PointsAvecPrécision(double lat1, double lon1, double lat2, double lon2) {
        return 2 * Math.asin(
                Math.sqrt(
                        Math.pow((Math.sin((lat1 - lat2) / 2)), 2)
                        + Math.cos(lat1) * Math.cos(lat2)
                        * (Math.pow(
                                Math.sin(
                                        ((lon1 - lon2) / 2)
                                ), 2))
                )
        );

    }

    public List<DetPublication> getPublicationsNotifs(int iduser) {
        ConnexionDeconnexion codeco = new ConnexionDeconnexion();
        codeco.setIduser(iduser);
        codeco.getCoDeco();

        List<DetPublication> liste = new ArrayList();

        String query = "SELECT * FROM detpub "
                + "WHERE datepublication>='" + codeco.getDateconnexion() + "' "
                + "and heurepublication>='" + codeco.getHeureconnexion() + "' "
                + "and iduser != " + iduser
                + " ORDER BY datepublication DESC";
        System.out.println(query);
        DBConnect dbc = new DBConnect();
        BasicsFunctions bf = new BasicsFunctions();
        Connection c = dbc.getconn();
        ResultSet rs = bf.execquery(query, c);
        System.out.println(query);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                DetPublication tmp = new DetPublication();

                tmp.setIduser(iduser);
                tmp.setContenupublication(rs.getString("contenupublication"));
                tmp.setDatepublication(rs.getDate("datepublication"));
                tmp.setHeurepublication(rs.getTime("heurepublication"));
                tmp.setConfidentialite(rs.getString("confidentialite"));
                tmp.setIdconfidentialite(rs.getInt("idconfidentialite"));
                tmp.setIdpublication(rs.getInt("idpublication"));
                tmp.setLatitude(rs.getDouble("latitude"));
                tmp.setLongitude(rs.getDouble("longitude"));
                tmp.setNbrpa(rs.getInt("nbrpa"));
                tmp.setNomuser(rs.getString("nomuser"));
                tmp.setPrenomuser(rs.getString("prenomuser"));
                liste.add(tmp);

                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
                c.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public List<DetPublication> vraiPublication(int iduser, double longitude, double latitude) {
        List<DetPublication> liste = new ArrayList();
        for (DetPublication dp : getPublicationsNotifs(iduser)) {
            if (distanceVolOiseauEntre2PointsAvecPrécision(longitude, latitude, dp.getLongitude(), dp.getLatitude()) <= 100) {
                liste.add(dp);
            }
        }
        return liste;
    }

    public int nbrNotifs(int iduser, double longitude, double latitude) {
        return vraiPublication(iduser, longitude, latitude).size();
    }
}
