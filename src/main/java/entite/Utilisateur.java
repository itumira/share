package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Utilisateur {

    private int iduser;
    private String nomuser;
    private String prenomuser;
    private String emailuser;
    private String pwduser;
    private String imguser;

    @Override
    public String toString() {
        return "default,'" + nomuser + "','" + prenomuser + "','" + emailuser + "','" + pwduser + "',null";
    }

    public Utilisateur() {
    }

    public Utilisateur(int iduser, String nomuser, String prenomuser, String emailuser, String pwduser, String imguser) {
        this.iduser = iduser;
        this.nomuser = nomuser;
        this.prenomuser = prenomuser;
        this.emailuser = emailuser;
        this.pwduser = pwduser;
        this.imguser = imguser;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getNomuser() {
        return nomuser;
    }

    public void setNomuser(String nomuser) {
        this.nomuser = nomuser;
    }

    public String getPrenomuser() {
        return prenomuser;
    }

    public void setPrenomuser(String prenomuser) {
        this.prenomuser = prenomuser;
    }

    public String getEmailuser() {
        return emailuser;
    }

    public void setEmailuser(String emailuser) {
        this.emailuser = emailuser;
    }

    public String getPwduser() {
        return pwduser;
    }

    public void setPwduser(String pwduser) {
        this.pwduser = pwduser;
    }

    public String getNomPrenom() {
        return prenomuser + " " + nomuser;
    }

    public String getImguser() {
        return imguser;
    }

    public void setImguser(String imguser) {
        this.imguser = imguser;
    }

    public void getUtilisateur() {
        //iduser, nomuser, prenomuser, emailuser, imguser
        String query = "SELECT * FROM utilisateur WHERE emailuser='" + this.getEmailuser() + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);

        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                this.setEmailuser(rs.getString("emailuser"));
                this.setIduser(rs.getInt("iduser"));
                this.setImguser(rs.getString("imguser"));
                this.setNomuser(rs.getString("nomuser"));
                this.setPrenomuser(rs.getString("prenomuser"));
                this.setPwduser(rs.getString("pwduser"));
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
    }

    public int getIdUtilisateur(String email) {
        //iduser, nomuser, prenomuser, emailuser, imguser
        int i = 0;
        String query = "SELECT iduser FROM utilisateur WHERE emailuser='" + email + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);

        try {
            while (rs.next()) {
                i = rs.getInt("iduser");
            }
        } catch (SQLException ex) {
        }
        return i;
    }

    public String getImgUtilisateur(int iduser) {
        //iduser, nomuser, prenomuser, emailuser, imguser
        String i = "";
        String query = "SELECT imguser FROM utilisateur WHERE iduser='" + iduser + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);

        try {
            while (rs.next()) {
                i = rs.getString("imguser");
            }
        } catch (SQLException ex) {
        }
        return i;
    }

    public int getIdUtilisateur() {
        //iduser, nomuser, prenomuser, emailuser, imguser
        String query = "SELECT * FROM utilisateur WHERE emailuser='" + this.getEmailuser() + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);
        int repo = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                repo = (rs.getInt("iduser"));

                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
        return repo;
    }

    public void getByIdUtilisateur() {
        //iduser, nomuser, prenomuser, emailuser, imguser
        String query = "SELECT * FROM utilisateur WHERE iduser='" + this.getIduser() + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);

        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                this.setEmailuser(rs.getString("emailuser"));
                this.setIduser(rs.getInt("iduser"));
                this.setImguser(rs.getString("imguser"));
                this.setNomuser(rs.getString("nomuser"));
                this.setPrenomuser(rs.getString("prenomuser"));
                this.setPwduser(rs.getString("pwduser"));
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
    }

    public int getNombreDePartages() {
        String query = "SELECT count(*) as nbrpub FROM partage WHERE iduser=" + this.getIduser();
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);
        int response = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                response = rs.getInt("nbrpub");
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

    public int getNombreDePublications() {
        String query = "SELECT count(*) as nbrpub FROM publication WHERE iduser=" + this.getIduser();
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);
        int response = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                response = rs.getInt("nbrpub");
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return response + getNombreDePartages();
    }

    public List<DetPublication> getAllPublications() {
        List<DetPublication> liste = new ArrayList();
        String query = "SELECT * FROM detpub WHERE iduser=" + this.getIduser() + " ORDER BY idpublication ASC";
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                DetPublication tmp = new DetPublication();
                tmp.setIduser(this.iduser);
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

    public List<DetPartage> getAllPartagesForTimeline() {
        List<DetPartage> liste = new ArrayList();
        String query = "SELECT distinct pa.idpartage, pa.datepartage, pa.heurepartage, pa.iduserabonnant, pa.iduserabonne, "
                + "pa.longitude as longpartage, pa.latitude as latpartage, u.iduser as idpartageur, "
                + "u.nomuser as nompartageur, u.prenomuser as prenompartageur, u.emailuser as emailpartageur, "
                + "u.imguser as imgpartageur,d.* "
                + "FROM utilisateur u INNER JOIN partageabonne pa ON u.iduser=pa.iduser "
                + "INNER JOIN detpub d ON d.idpublication=pa.idpublication "
                + "WHERE pa.iduserabonnant=" + this.iduser + " OR pa.iduserabonne=" + this.iduser + " "
                + "ORDER BY pa.idpartage DESC";
        System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                DetPartage tmp = new DetPartage();
                tmp.setIduser(rs.getInt("iduser"));
                tmp.setImguser(getImgUtilisateur(rs.getInt("iduser")));
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

                tmp.setIdpartage(rs.getInt("idpartage"));
                tmp.setDatepartage(rs.getDate("datepartage"));
                tmp.setHeurepartage(rs.getTime("heurepartage"));
                tmp.setLongpartage(rs.getLong("longpartage"));
                tmp.setLatpartage(rs.getLong("latpartage"));
                tmp.setIdpartageur(rs.getInt("idpartageur"));
                tmp.setNompartageur(rs.getString("nompartageur"));
                tmp.setPrenompartageur(rs.getString("prenompartageur"));
                tmp.setEmailpartageur(rs.getString("emailpartageur"));
                tmp.setImgpartageur(rs.getString("imgpartageur"));
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

    public List<DetPublication> getAllPublicationsForTimeline() {
        List<DetPublication> liste = new ArrayList();
        String query = "SELECT distinct p.idpublication, d.* "
                + "FROM publicationabonne p "
                + "JOIN detpub d ON p.idpublication = d.idpublication "
                + "WHERE p.iduserabonnant=" + this.iduser + " OR p.iduserabonne=" + this.iduser + " "
                + "ORDER BY d.idpublication DESC";
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
                tmp.setImguser(getImgUtilisateur(rs.getInt("iduser")));
                System.out.println(tmp.getImguser());
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

// followers
    public List<Utilisateur> getAbonnes() {
        List<Utilisateur> liste = new ArrayList();
        String query = "SELECT a.iduserabonnant,"
                + "    a.iduserabonne,"
                + "    u.nomuser,"
                + "    u.prenomuser,"
                + "    u.emailuser,"
                + "    u.pwduser,"
                + "    u.imguser"
                + "   FROM abonnes a"
                + "     JOIN utilisateur u ON a.iduserabonnant = u.iduser "
                + "   WHERE a.iduserabonne=" + this.getIduser();
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                Utilisateur tmp = new Utilisateur();
                tmp.setIduser(rs.getInt("iduserabonnant"));
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
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public int getNbAbonnes() {
        return getAbonnes().size();
    }

    //  following
    public List<Utilisateur> getAbonnements() {
        List<Utilisateur> liste = new ArrayList();
        String query = "SELECT a.iduserabonnant,"
                + "    a.iduserabonne,"
                + "    u.nomuser,"
                + "    u.prenomuser,"
                + "    u.emailuser,"
                + "    u.pwduser,"
                + "    u.imguser"
                + "   FROM abonnes a"
                + "     JOIN utilisateur u ON a.iduserabonne = u.iduser "
                + "   WHERE a.iduserabonnant=" + this.getIduser();
        //     System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                Utilisateur tmp = new Utilisateur();
                tmp.setIduser(rs.getInt("iduserabonne"));
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

    public int getNbAbonnements() {
        return getAbonnements().size();
    }

    public List<Utilisateur> getDemandesNotAnswered() {
        List<Utilisateur> liste = new ArrayList();
        String query = "select u.* from avoirdemandenotconfirmed a INNER JOIN utilisateur u ON a.iduserdemandeur=u.iduser where a.iduserdemander = " + this.getIduser();
        System.out.println(query);
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
            //System.out.println(query);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
            }
        }
        return liste;
    }

    public boolean isFollowedToo(int iduserfollower) {
        String query = "SELECT a.iduserabonnant,"
                + "    a.iduserabonne,"
                + "    u.nomuser,"
                + "    u.prenomuser,"
                + "    u.emailuser,"
                + "    u.pwduser,"
                + "    u.imguser"
                + "   FROM abonnes a"
                + "     JOIN utilisateur u ON a.iduserabonnant = u.iduser "
                + "   WHERE a.iduserabonnant=" + this.getIduser() + " AND a.iduserabonne=" + iduserfollower;
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        int i = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                i++;
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
        return i != 0;
    }

    public DemandeAbonnement askToFollow(int iduserdemander) {
        DemandeAbonnement da = new DemandeAbonnement();
        da.setIduserdemander(iduserdemander);
        da.setIduserdemandeur(this.getIduser());
        return da;
    }

    public boolean askNotConfirmed(int iddemandee) {
        String query = "select * from avoirdemandenotconfirmed where iduserdemandeur = " + this.iduser + " and iduserdemander=" + iddemandee;
        System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        int i = 0;
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                i++;
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
        return i == 1;
    }

    public List<DetPublication> getAllPublicationsByTag(int id) {
        List<DetPublication> liste = new ArrayList();
        String query = "select * from tagbypublication join detpub d on tagbypublication.idpublication=d.idpublication "
                + "where tagbypublication.idtag=" + id + " order by d.datepublication desc";
        System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        System.out.print(query);
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

    public DetUtilisateur getDetailUser() {
        int nbrep = this.getNombreDePublications();
        int nbreabonnés = this.getNbAbonnes();
        int nbreabonnements = this.getNbAbonnements();
        DetUtilisateur rep = new DetUtilisateur();
        rep.setNbreabonnement(nbreabonnements);
        rep.setNbreabonnes(nbreabonnés);
        rep.setNbrepublication(nbrep);
        rep.setNomuser(this.getNomuser());
        rep.setPrenomuser(this.getPrenomuser());
        return rep;
    }

    public int verifPwd(String pwd) {
        int val = 0;
        String query = "select count(*) as countpwd from utilisateur where pwduser='" + pwd + "'";
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            while (rs.next()) {
                val = rs.getInt("countpwd");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return val;
    }

    public void ModifUtilisateur(String motdepasse) {

        try {
            DBConnect db = new DBConnect();
            Connection c = db.getconn();
            Statement st = c.createStatement();
            st.executeUpdate("UPDATE utilisateur  SET pwduser='" + motdepasse + "' where iduser=" + this.getIduser());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void insertNewUser() {
        BasicsFunctions bf = new BasicsFunctions();
        bf.insertionObj("utilisateur", this);
    }

    public int insertNewUserId() {
        BasicsFunctions bf = new BasicsFunctions();
        return bf.insertionObjI("utilisateur", this);
    }

    // NOTIFICATIONS
    public List<DetPartage> getAllPartagesForNotif() {
        List<DetPartage> liste = new ArrayList();
        String query = "SELECT distinct pa.idpartage, pa.datepartage, pa.heurepartage, pa.iduserabonnant, pa.iduserabonne, "
                + "pa.longitude as longpartage, pa.latitude as latpartage, u.iduser as idpartageur, "
                + "u.nomuser as nompartageur, u.prenomuser as prenompartageur, u.emailuser as emailpartageur, "
                + "u.imguser as imgpartageur,d.* "
                + "FROM utilisateur u INNER JOIN partageabonne pa ON u.iduser=pa.iduser "
                + "INNER JOIN detpub d ON d.idpublication=pa.idpublication "
                + "WHERE pa.iduserabonnant=" + this.iduser + " OR pa.iduserabonne=" + this.iduser + " "
                + "ORDER BY pa.idpartage DESC LIMIT 5";
        System.out.println(query);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        ResultSet rs = bf.execquery(query, c);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                DetPartage tmp = new DetPartage();
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

                tmp.setIdpartage(rs.getInt("idpartage"));
                tmp.setDatepartage(rs.getDate("datepartage"));
                tmp.setHeurepartage(rs.getTime("heurepartage"));
                tmp.setLongpartage(rs.getLong("longpartage"));
                tmp.setLatpartage(rs.getLong("latpartage"));
                tmp.setIdpartageur(rs.getInt("idpartageur"));
                tmp.setNompartageur(rs.getString("nompartageur"));
                tmp.setPrenompartageur(rs.getString("prenompartageur"));
                tmp.setEmailpartageur(rs.getString("emailpartageur"));
                tmp.setImgpartageur(rs.getString("imgpartageur"));
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

    public List<DetPublication> getAllPublicationsForNotif() {
        List<DetPublication> liste = new ArrayList();
        String query = "SELECT distinct p.idpublication, d.* "
                + "FROM publicationabonne p "
                + "JOIN detpub d ON p.idpublication = d.idpublication "
                + "WHERE p.iduserabonnant=" + this.iduser + " OR p.iduserabonne=" + this.iduser + " "
                + "ORDER BY d.idpublication DESC LIMIT 5";
        //System.out.println(query);
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
}
