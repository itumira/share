package database;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BasicsFunctions {

    public ResultSet execquery(String query, Connection con) {
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException exp) {
        }
        return rs;
    }

    public String getColonnes(Object object) {
        Class c = object.getClass();
        Field[] fl = c.getDeclaredFields();
        String colonnes = "";
        int i = 0;
        for (i = 0; i < fl.length - 1; i++) {
            colonnes = colonnes + fl[i].getName();
            if (i != fl.length - 2) {
                colonnes = colonnes + ",";
            }
        }
        colonnes = colonnes + "," + fl[i].getName();
        return colonnes;
    }

    public void insertionObj(String nomTable, Object values) {
        String query = "INSERT INTO " + nomTable + "(" + getColonnes(values) + ") VALUES(" + values.toString() + ");commit;";
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        System.out.println(query);
        Statement stmt = null;
        try {
            stmt = c.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(BasicsFunctions.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getFirstColonnes(Object object) {
        Class c = object.getClass();
        Field[] fl = c.getDeclaredFields();
        return fl[0].getName();
    }

    public int insertionObjI(String nomTable, Object values) {
        String query = "INSERT INTO " + nomTable + "(" + getColonnes(values) + ") VALUES(" + values.toString() + ") RETURNING " + getFirstColonnes(values);
        DBConnect db = new DBConnect();
        Connection c = db.getconn();
        System.out.println(query);
        Statement stmt = null;
        ResultSet ret = null;
        int rep = 1;
        try {
            stmt = c.createStatement();
            ret = stmt.executeQuery(query);
            boolean hasnext = ret.next();
            while (hasnext) {
                rep = ret.getInt(getFirstColonnes(values));
                hasnext = ret.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(BasicsFunctions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rep;
    }
}
