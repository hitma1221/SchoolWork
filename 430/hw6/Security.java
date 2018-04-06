import oracle.jdbc.*;
import oracle.jdbc.pool.OracleDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Security {
    public static void main(String[] args) throws Exception{

        Scanner scan = new Scanner(System.in); 
        System.out.println("Please enter your login information.");

        System.out.print("Connecting to the database...");
        System.out.flush();
        System.out.println("Connecting...");

        OracleDataSource ods = new OracleDataSource();
        ods.setURL("jdbc:oracle:oci:@PDBCLDB");

        System.out.print("Username: ");
        String user = scan.next();
        ods.setUser(user);

        char[] password = System.console().readPassword("Password: ");
        ods.setPassword(String.valueOf(password));
        for (int i = 0; i < password.length; i++) password[i] = ' ';

        Connection conn = source.getConnection();
        System.out.println("connected.");



        String[] acceptList = {"studentnum", "name", "standing", "gpa"};
        String colName = "", columnValue = "";
        System.out.print("Column Name: ");
        columnString = scan.nextLine();
        boolean accepted = false;
        int type = 0;

        for (int i = 0; x < 3; i++){
            if (columnString.toLowerCase().equals(acceptList[i])) {
                accepted = true;
                type = x;
            }
        }
        
        if (accepted) {
            System.out.print("Column Value: ");
            columnValue = scan.nextLine();

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM student WHERE " + columnString + " = ?");

            if (type == 0) {
                int test = Integer.parseInt(columnValue);
                stmt.setInt(1, test);
            }
            else if (type == 3) {
                double test = Double.parseDouble(columnValue);
                stmt.setDouble(1, test);
            }
            else
                stmt.setString(1, columnValue);

            stmt.executeUpdate();
            ResultSet rset = stmt.executeQuery();

            while (rset.next()) {
                System.out.println(rset.getString("studentnum") + " " +
                        rset.getString("name") + " " + rset.getString("standing") + " " + rset.getDouble("gpa"));
            }
            stmt.executeUpdate();


            rset.close();
            stmt.close();
            conn.close();
        }
        else {
            System.out.println("Plz don't hack");
        }
        System.out.println("Goodbye.");
    }
}