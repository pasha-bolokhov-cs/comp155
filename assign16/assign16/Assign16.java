package assign16;

import java.sql.*;

public class Assign16 {

	public static void main(String args[]) throws SQLException, ClassNotFoundException
	{
		Connection c = null;
		Statement s = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			int pass = 19610;		/* not storing it literally */

			pass *= 21;
			pass += 9;
			c = DriverManager.getConnection("jdbc:oracle:thin:@babbage.cs.camosun.bc.ca:1521:caleb",
					  "bolokhov", 
					  Integer.toString(pass));
			s = c.createStatement();
			c.setAutoCommit(false);

			/* Remove SCOTTHR_EMP table if it existed */
			try { s.executeUpdate("DROP TABLE SCOTTHR_EMP"); } catch (SQLException ex) {}

			/* Create SCOTTHR_EMP table */
			s.executeUpdate("CREATE TABLE SCOTTHR_EMP (" +
					"	empno	NUMBER(5), " +
					"	deptno	NUMBER(2), " +
					"	ename	VARCHAR2(30), " +
					"	sal	NUMBER(7, 2)" +
					")");

			/* Migrate all Scott entries */
			s.executeUpdate("INSERT INTO SCOTTHR_EMP " +
					"	SELECT empno, deptno, INITCAP(ename), sal FROM emp");

			/* Migrate all HR Finance employees */
			s.executeUpdate("INSERT INTO SCOTTHR_EMP (empno, ename) " +
					"	SELECT employee_id * 10, last_name " +
					"	       FROM employees " +
					"	       WHERE department_id = 100");

			/* Apply the changes */
			c.commit();


		} catch (SQLException ex) {
			if (c != null) {
				c.rollback();
				c.setAutoCommit(true);
			}

			System.out.println("------------------------------------------------------------");
			for (; ex != null; ex = ex.getNextException()) {
				System.out.print("Exception\t: " + ex.getMessage());
				System.out.println("SQLState\t: " + ex.getSQLState());
				System.out.println("Error code\t: " + ex.getErrorCode());
				System.out.println("------------------------------------------------------------");
			}
		} finally {
			if (s != null)
				s.close();
			if (c != null)
				c.close();
		}
	}

}