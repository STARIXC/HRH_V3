package utils;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Calendar;
import java.util.Random;
import java.util.regex.Pattern;

/**
 *
 * @author Starixc
 */
public class IdGen {
    //    CURRENT DATE

    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH) + 1;
    int date = cal.get(Calendar.DATE);
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    int min = cal.get(Calendar.MINUTE);
    int sec = cal.get(Calendar.SECOND);
    int micro = cal.get(Calendar.MILLISECOND);
    String yr, mnth, dater, hr, mn, sc, action = "";
    String date2 = "";
    Timestamp now;
    String monthText = "";
    Random random = new Random();
    long fraction = (long) ((98725 - 219) * random.nextDouble());

    public String CreatedOn() {

        String full_date2 = hour + "" + min + "" + sec + "" + micro;
        String db = Double.toString(fraction);
        String tableID = (db + "" + full_date2).replace(".", "");
        String id = year + "_" + month + "_" + date + "_" + hour + "_" + min + "_" + sec + "_" + micro;
        return id;
    }

    public String timestamp() {
        java.util.Date date = new java.util.Date();
        now = new Timestamp(date.getTime());
        String timestamp = now + "";
        return timestamp;
    }

    public String toDay() {
        if (date < 10) {
            date2 = "0" + date;
        }
        if (date >= 10) {
            date2 = "" + date;
        }
        String full_date = year + "-" + month + "-" + date2;
        return full_date;
    }

    public String current_id() {

        String full_date2 = hour + "" + min + "" + sec + "" + micro;
        String db = Double.toString(fraction);
        String tableID = (db + "" + full_date2).replace(".", "");
        String id = year + "_" + month + "_" + date + "_" + hour + "_" + min + "_" + sec + "_" + micro;
        return tableID;
    }

    public String t_current_id() {

        String full_date2 = hour + "" + min + "" + sec;
        String db = Double.toString(fraction);
        String tcID = (db + "" + full_date2).replace(".", "");
        //String id = year + "_" + month + "_" + date + "_" + hour + "_" + min + "_" + sec + "_" + micro;
        return tcID;
    }

    public String CurrentMonth() {
        if (month < 10) {
            monthText = "0" + month;
        } else {
            monthText = "" + month;
        }
        return monthText;
    }

    public int currentYear() {
        return year;
    }

    public int CurrentYearMonth() {

        return new Integer(currentYear() + "" + CurrentMonth());

    }

    public String Encode(String key) {
        byte[] bytes = key.getBytes(StandardCharsets.UTF_8);
        String encodedkey = Base64.getEncoder().encodeToString(bytes);
        return encodedkey;
    }

    public String Decode(String key) {
        byte[] asBytes = Base64.getDecoder().decode(key);
        String decoded = new String(asBytes, StandardCharsets.UTF_8);
        return decoded;
    }
//
public boolean isBase64(String input) {
    final String regex = "^[a-zA-Z0-9+/]*={0,2}$";
    return Pattern.matches(regex, input);
}

}
