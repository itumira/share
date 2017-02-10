package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Time;

public class Abonnes {

    int idabonne;
    int iduserabonnant;
    int iduserabonne;
    Date dateacceptation;
    Time heureacceptation;

    @Override
    public String toString() {
        return "default," + iduserabonnant + "," + iduserabonne + ",'" + dateacceptation + "','" + heureacceptation + "'";
    }

    public int getIdabonne() {
        return idabonne;
    }

    public void setIdabonne(int idabonne) {
        this.idabonne = idabonne;
    }

    public int getIduserabonnant() {
        return iduserabonnant;
    }

    public void setIduserabonnant(int iduserabonnant) {
        this.iduserabonnant = iduserabonnant;
    }

    public int getIduserabonne() {
        return iduserabonne;
    }

    public void setIduserabonne(int iduserabonne) {
        this.iduserabonne = iduserabonne;
    }

    public Date getDateacceptation() {
        return dateacceptation;
    }

    public void setDateaccepation(Date dateacceptation) {
        this.dateacceptation = dateacceptation;
    }

    public Time getHeureacceptation() {
        return heureacceptation;
    }

    public void setHeureacceptation(Time heureacceptation) {
        this.heureacceptation = heureacceptation;
    }

    public void insertAbonnes() {
        BasicsFunctions bf = new BasicsFunctions();
        bf.insertionObj("abonnes", this);
    }

    public void rollbackAbonnement() {
        BasicsFunctions bf = new BasicsFunctions();
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        String query = "DELETE FROM abonnes "
                + " WHERE iduserabonnant=" + this.iduserabonnant + " AND iduserabonne=" + this.iduserabonne;
        ResultSet execquery = bf.execquery(query, c);
    }
}
