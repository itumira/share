package entite;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

public class ConnexionDeconnexion {
    
    int idconnexion;
    Date date;
    Time heure;
    int iduser;
    
    @Override
    public String toString() {
        return "default,'" + date + "','" + heure + "'," + iduser;
    }
    
    public void insertCoDe() {
        BasicsFunctions bf = new BasicsFunctions();
        bf.insertionObj("connexiondeconnexion", this);
    }
    
    public int getIdconnexion() {
        return idconnexion;
    }
    
    public void setIdconnexion(int idconnexion) {
        this.idconnexion = idconnexion;
    }
    
    public Date getDateconnexion() {
        return date;
    }
    
    public void setDateconnexion(Date dateconnexion) {
        this.date = dateconnexion;
    }
    
    public Time getHeureconnexion() {
        return heure;
    }
    
    public void setHeureconnexion(Time heureconnexion) {
        this.heure = heureconnexion;
    }
    
    public int getIduser() {
        return iduser;
    }
    
    public void setIduser(int iduser) {
        this.iduser = iduser;
    }
    
    public void getCoDeco() {
        String query = "SELECT * FROM connexiondeconnexion WHERE iduser=" + getIduser() + " ORDER BY idconnexion DESC LIMIT 1";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();
        
        ResultSet rs = bf.execquery(query, c);
        System.out.println(query);
        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                this.setIduser(rs.getInt("iduser"));
                this.setDateconnexion(rs.getDate("date"));
                this.setHeureconnexion(rs.getTime("heure"));
                this.setIdconnexion(rs.getInt("idconnexion"));
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
        
    }
}
