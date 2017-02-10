package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Time;

public class DemandeAbonnement {

    int iddemande;
    int iduserdemandeur;
    int iduserdemander;
    Date date;
    Time heure;

    @Override
    public String toString() {
        return "default," + iduserdemandeur + "," + iduserdemander + ",'" + date + "','" + heure + "'";
    }

    public int getIddemande() {
        return iddemande;
    }

    public void setIddemande(int iddemande) {
        this.iddemande = iddemande;
    }

    public int getIduserdemandeur() {
        return iduserdemandeur;
    }

    public void setIduserdemandeur(int iduserdemandeur) {
        this.iduserdemandeur = iduserdemandeur;
    }

    public int getIduserdemander() {
        return iduserdemander;
    }

    public void setIduserdemander(int iduserdemander) {
        this.iduserdemander = iduserdemander;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getHeure() {
        return heure;
    }

    public void setHeure(Time heure) {
        this.heure = heure;
    }

    public void insertDemande() {
        BasicsFunctions bf = new BasicsFunctions();
        bf.insertionObj("demandeabonnement", this);
    }

    public void rollbackDemande() {
        BasicsFunctions bf = new BasicsFunctions();
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();

        String query = "DELETE FROM demandeabonnement "
                + " WHERE iduserdemandeur=" + this.iduserdemandeur + " AND iduserdemander=" + this.iduserdemander;
        ResultSet execquery = bf.execquery(query, c);
    }
}
