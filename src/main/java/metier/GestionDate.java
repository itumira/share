package metier;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class GestionDate {

    public Date getDateAuj() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        return Date.valueOf(dateFormat.format(date));
    }

    public Time getHeureAuj() {
        DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        java.util.Date date = new java.util.Date();
        return Time.valueOf(dateFormat.format(date));
    }
}
