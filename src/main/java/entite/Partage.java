package entite;

import database.BasicsFunctions;
import java.sql.Date;
import java.sql.Time;
import metier.GestionDate;

public class Partage extends GestionDate {

    int idpartage;
    int iduser;
    int idpublication;
    Date datepartage;
    Time heurepartage;
    double longitude;
    double latitude;

    @Override
    public String toString() {
        return "default," + iduser + "," + idpublication + ",'" + datepartage + "','" + heurepartage + "'," + longitude + "," + latitude;
    }

    public Partage(int idpartage, int iduser, int idpublication, Date datepartage, Time heurepartage, double longitude, double latitude) {
        this.idpartage = idpartage;
        this.iduser = iduser;
        this.idpublication = idpublication;
        this.datepartage = datepartage;
        this.heurepartage = heurepartage;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public Partage() {
        setDatepartage(getDateAuj());
        setHeurepartage(getHeureAuj());
    }

    public int getIdpartage() {
        return idpartage;
    }

    public void setIdpartage(int idpartage) {
        this.idpartage = idpartage;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdpublication() {
        return idpublication;
    }

    public void setIdpublication(int idpublication) {
        this.idpublication = idpublication;
    }

    public Date getDatepartage() {
        return datepartage;
    }

    public void setDatepartage(Date datepartage) {
        this.datepartage = datepartage;
    }

    public Time getHeurepartage() {
        return heurepartage;
    }

    public void setHeurepartage(Time heurepartage) {
        this.heurepartage = heurepartage;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public int insertPartager() {
        BasicsFunctions bf = new BasicsFunctions();
        return bf.insertionObjI("partage", this);
    }

}
