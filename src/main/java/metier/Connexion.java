package metier;

import database.BasicsFunctions;
import database.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Connexion {

    String email;
    String pass;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Connexion() {
    }

    public Connexion(String email, String pass) {
        this.email = email;
        this.pass = pass;
    }

    public boolean connected() {
        String query = "SELECT * FROM utilisateur WHERE emailuser='" + this.email + "' and pwduser='" + this.pass + "'";
        DBConnect dbc = new DBConnect();
        Connection c = dbc.getconn();
        BasicsFunctions bf = new BasicsFunctions();

        ResultSet rs = bf.execquery(query, c);

        int i = 0;

        try {
            boolean hasnext = rs.next();
            while (hasnext) {
                i++;
                hasnext = rs.next();
            }
        } catch (SQLException ex) {
        }
        return i != 0;
    }
}
