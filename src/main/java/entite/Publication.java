package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import metier.GestionDate;

public class Publication extends GestionDate {

    int idpublication;
    int idconfidentialite;
    int iduser;
    String contenupublication;
    Time heurepublication;
    Date datepublication;
    double longitude;
    double latitude;

    @Override
    public String toString() {
        return "default," + idconfidentialite + "," + iduser
                + ",'" + contenupublication + "','" + heurepublication
                + "','" + datepublication + "'," + longitude + "," + latitude;
    }

    public Publication() {
        setDatepublication(getDateAuj());
        setHeurepublication(getHeureAuj());
    }

    public Publication(int idpublication, int idconfidentialite, int iduser, String contenupublication, Time heurepublication, Date datepublication, double longitude, double latitude) {
        this.idpublication = idpublication;
        this.idconfidentialite = idconfidentialite;
        this.iduser = iduser;
        this.contenupublication = contenupublication;
        this.heurepublication = heurepublication;
        this.datepublication = datepublication;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public int getIdpublication() {
        return idpublication;
    }

    public void setIdpublication(int idpublication) {
        this.idpublication = idpublication;
    }

    public int getIdconfidentialite() {
        return idconfidentialite;
    }

    public void setIdconfidentialite(int idconfidentialite) {
        this.idconfidentialite = idconfidentialite;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getContenupublication() {
        return contenupublication;
    }

    public void setContenupublication(String contenupublication) {
        this.contenupublication = contenupublication.replaceAll("'","''");
    }

    public Time getHeurepublication() {
        return heurepublication;
    }

    public void setHeurepublication(Time heurepublication) {
        this.heurepublication = heurepublication;
    }

    public Date getDatepublication() {
        return datepublication;
    }

    public void setDatepublication(Date datepublication) {
        this.datepublication = datepublication;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = Double.parseDouble(longitude);
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = Double.parseDouble(latitude);
    }

    public int getNbrPartages() {
        String query = "SELECT count(*) as nbrpartage FROM partage WHERE idpublication=" + this.idpublication;
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);
        int response = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                response = rs.getInt("nbrpartage");
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return response;
    }

    public List<String> listeTagDansCettePublication() {
        List<String> listemots = new ArrayList();
        String tmp = contenupublication;
        StringTokenizer st = new StringTokenizer(tmp);
        while (st.hasMoreTokens()) {
            listemots.add(st.nextToken());
        }
        List<String> liste = new ArrayList();
        for (String mot : listemots) {
            if (mot.startsWith("#")) {
                liste.add(mot);
            }
        }
        return liste;
    }

    public int insertPublication() {
        BasicsFunctions bf = new BasicsFunctions();
        return bf.insertionObjI("publication", this);
    }

    public void deletePublication(Connection c) {
        BasicsFunctions bf = new BasicsFunctions();
        String query1 = "DELETE FROM partage WHERE idpublication=" + idpublication + ";commit;";
        String queryTag = "DELETE FROM tagbypublication WHERE idpublication=" + idpublication + ";commit;";
        Statement stmt = null;
        String query = "DELETE FROM publication WHERE idpublication=" + idpublication + ";commit;";
        
        try {
            stmt = c.createStatement();
            stmt.executeUpdate(queryTag);
            stmt = c.createStatement();
            stmt.executeUpdate(query1);
            stmt = c.createStatement();
            stmt.executeUpdate(query);

        } catch (SQLException ex) {
        }
    }

    public static void main(String[] Args) {
        Publication p = new Publication();

        p.contenupublication = "bonjour.moi    c'est mirado. #presentation #essai";
        List<String> a = p.listeTagDansCettePublication();
        for (String i : a) {
            System.out.println(i);
        }

    }
}
