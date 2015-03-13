package prepjavaexample;

/***
 * File        : PrepJavaExample.java
 * Written by  : Marla Weston
 * Modified by : Marla Weston with a help from a friend
 * Written     : February 20, 2014
 * Updated     : February 25, 2014
 * Description : This program using a prepared statement.
 */

import java.sql.*;
import java.util.Scanner;

public class PrepJavaExample {
        public static void main(String[] args) throws SQLException,
                        ClassNotFoundException {

                Connection sqlConnection = null;
                Statement sqlStatement = null;

                try {
                        sqlConnection = getConnection();

                        sqlStatement = sqlConnection.createStatement();

                        sqlConnection.setAutoCommit(false);

                        dropDogsTable(sqlStatement);
                        createDogsTable(sqlStatement);

                        dropBreedersTable(sqlStatement);
                        createBreedersTable(sqlStatement);

                        sqlConnection.commit();
                        sqlConnection.setAutoCommit(true);

                        ResultSet sqlResultSet = sqlStatement
                                        .executeQuery("SELECT * FROM Dogs, Breeders "
                                                        + " WHERE dogs.dog_id = breeders.dog_id ");

                        printResultSet(sqlResultSet);

                        // Use a PreparedStatement as an example.
                        // Fix the error made to the weight for the Great Dane.
                        PreparedStatement prepareUpdateDogs = sqlConnection
                                        .prepareStatement("UPDATE Dogs SET wt = ? WHERE breed = ? AND asize = ?");

                        // Get some UPDATE data ready for the PreparedStatement.
                        prepareUpdateDogs.setFloat(1, 60);
                        prepareUpdateDogs.setString(2, "Great Dane");
                        prepareUpdateDogs.setString(3, "Large");

                        // Run the PreparedStatement
                        int n = prepareUpdateDogs.executeUpdate();

                        ResultSet sqlResultSetUpdate = sqlStatement
                                        .executeQuery("SELECT * FROM Dogs, Breeders "
                                                        + " WHERE dogs.dog_id = breeders.dog_id ");
                        
                        System.out.println("\n **************** Fixed Now ***************** \n");
                        printResultSet(sqlResultSetUpdate);

                        sqlStatement.close();

                } catch (SQLException ex) {

                        if (sqlConnection != null) {
                                sqlConnection.rollback();
                                sqlConnection.setAutoCommit(true);
                        }

                        printSQLException(ex);
                } finally {
                        if (sqlStatement != null) {
                                sqlStatement.close();
                        }
                        if (sqlConnection != null) {
                                sqlConnection.close();
                        }
                }
        }

        private static Connection getConnection() throws ClassNotFoundException,
                        SQLException {
                // Connect to the database

                Connection sqlConnection = null;

                // Have the user enter their username and password.

                System.out.println("Please enter your username: ");
                Scanner inputReader = new Scanner(System.in);

                String username = inputReader.nextLine();

                System.out.println("Please enter your password: ");
                String userpass = inputReader.nextLine();
                inputReader.close();

                Class.forName("oracle.jdbc.driver.OracleDriver");

                sqlConnection = DriverManager.getConnection(
                                "jdbc:oracle:thin:@babbage.cs.camosun.bc.ca:1521:caleb",
                                username, userpass);

                return sqlConnection;
        }

        private static void printResultSet(ResultSet sqlResultSet)
                        throws SQLException {
                // Print out the results from the SELECT statement

                while (sqlResultSet.next()) {
                        String breed = sqlResultSet.getString("breed");
                        String asize = sqlResultSet.getString("asize");
                        float weight = sqlResultSet.getFloat("wt");
                        String kennelname = sqlResultSet.getString("kennelname");
                        String address = sqlResultSet.getString("address");

                        System.out.print(breed + "s");
                        System.out.print(" are of " + asize + " size");
                        System.out.print(" and weigh " + weight + " kilos");
                        System.out.print(" from " + kennelname);
                        System.out.println(" at " + address);
                }

        }

        private static void dropDogsTable(Statement sqlStatement)
                        throws SQLException {
                // Check to see if the DOGS table already exists in the database.
                // If the table exists, drop it because it will be created later.

                ResultSet resultTable = sqlStatement
                                .executeQuery("SELECT * FROM user_tables "
                                                + "WHERE table_name='DOGS'");

                while (resultTable.next()) {
                        sqlStatement.executeUpdate("DROP TABLE Dogs PURGE");
                }
        }

        private static void dropBreedersTable(Statement sqlStatement)
                        throws SQLException {
                // Check to see if the BREEDERS table already exists in the database.
                // If the table exists, drop it because it will be created later.

                ResultSet restable2 = sqlStatement
                                .executeQuery("SELECT * FROM user_tables "
                                                + "WHERE table_name='BREEDERS'");
                while (restable2.next()) {
                        sqlStatement.executeUpdate("DROP TABLE Breeders PURGE");
                }
        }

        private static void createDogsTable(Statement sqlStatement)
                        throws SQLException {
                // CREATE the DOGS table using SQL and insert some data.

                sqlStatement
                                .executeUpdate("CREATE TABLE Dogs "
                                + "(dog_id INT, breed VARCHAR2(40), asize VARCHAR2(40), wt REAL)");
                sqlStatement.executeUpdate("INSERT INTO Dogs VALUES "
                                + "(1,'Great Dane', 'Large', 6.00)");
                sqlStatement.executeUpdate("INSERT INTO Dogs VALUES "
                                + "(2,'Border Collie', 'Medium', 15.00)");
                sqlStatement.executeUpdate("INSERT INTO Dogs VALUES "
                                + "(3,'Chihuahua', 'Small', 1.50)");
        }

        private static void createBreedersTable(Statement sqlStatement)
                        throws SQLException {
                // CREATE the BREEDERS table using SQL and insert some data.

                String createTableString = "CREATE TABLE Breeders "
                                + "(dog_id INT, breed VARCHAR2(40), kennelname VARCHAR2(40), "
                                + " address VARCHAR2(80), lic INT)";
                sqlStatement.executeUpdate(createTableString);

                sqlStatement.executeUpdate("INSERT INTO Breeders VALUES "
                                + "(1,'Great Dane', 'Large Dog Kennels', '123 Main', 12)");
                sqlStatement.executeUpdate("INSERT INTO Breeders VALUES "
                                + "(2,'Border Collie', 'Fast Dog Kennels', '456 Main', 45)");
                sqlStatement.executeUpdate("INSERT INTO Breeders VALUES "
                                + "(3,'Chihuahua', 'Tiny Dog Kennels', '789 Main', 78)");

        }

        private static void printSQLException(SQLException ex) {
                // If there is a SQL exception, catch it here and print it out.

                System.out.println("SQLException caught");
                System.out.println("---");

                while (ex != null) {
                        System.out.println("Message   : " + ex.getMessage());
                        System.out.println("SQLState  : " + ex.getSQLState());
                        System.out.println("ErrorCode : " + ex.getErrorCode());
                        System.out.println("---");
                        ex = ex.getNextException();
                }
        }
}
