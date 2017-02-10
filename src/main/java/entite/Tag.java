package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Tag {

    int idtag;
    String thetag;

    @Override
    public String toString() {
        return "default,'" + thetag + "'";
    }

    public List<Tag> getListTag() {
        List<Tag> liste = new ArrayList();
        String query = "SELECT * FROM tag";
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                Tag tmp = new Tag();
                tmp.setIdtag(rs.getInt("idtag"));
                tmp.setThetag(rs.getString("thetag"));
                liste.add(tmp);
                hasnext = rs.next();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public List<DetPublication> getAllPublications() {
        List<DetPublication> liste = new ArrayList();
        String query = "SELECT * FROM tag t "
                + "INNER JOIN tagbypublication tbp ON t.idtag=tbp.idtag "
                + "INNER JOIN detpub p ON tbp.idpublication = p.idpublication "
                + "WHERE t.idtag='" + this.getIdtag() + "'";
        System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                DetPublication tmp = new DetPublication();
                tmp.setIduser(rs.getInt("iduser"));
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
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public boolean tagexist(Connection c) {
        String query = "SELECT * FROM tag WHERE thetag='" + thetag + "'";
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        int response = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                response++;
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return response != 0;
    }

    public void getTag(Connection c) {
        String query = "SELECT * FROM tag WHERE thetag='" + thetag + "' or idtag=" + idtag + "";
        System.out.println(query);
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                idtag = rs.getInt("idtag");
                thetag = rs.getString("thetag");
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
    }

    public int insertTag() {
        BasicsFunctions bf = new BasicsFunctions();
        return bf.insertionObjI("tag", this);
    }

    public int getIdtag() {
        return idtag;
    }

    public void setIdtag(int idtag) {
        this.idtag = idtag;
    }

    public String getThetag() {
        return thetag;
    }

    public void setThetag(String thetag) {
        this.thetag = thetag;
    }

}
