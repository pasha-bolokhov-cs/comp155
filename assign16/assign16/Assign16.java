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


			/*************************************************************
			 *                                                           *
			 *                          Part II                          *
			 *                                                           *
			 *************************************************************/

			/* Remove SCOTTHR_EMP table if it existed */
			try { s.executeUpdate("DROP TABLE SCOTTHR_EMP PURGE"); } catch (SQLException ex) {}

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

			/* Set the ID and salary for the merged workers */
			s.executeUpdate("UPDATE SCOTTHR_EMP " +
					"	SET deptno = 99, sal = 2000 " +
					"	WHERE deptno IS NULL");

			/* Apply the changes */
			c.commit();


			/* Query the table */
			System.out.printf("********************" + 
					  " Employee Data before Raise " +
					  "********************\n");
			ResultSet r = s.executeQuery("SELECT * FROM SCOTTHR_EMP");
			while (r.next()) {
				System.out.printf("Employee #%d, %s, at Dept No %d makes $%g\n",
						  r.getInt("empno"), r.getString("ename"),
						  r.getInt("deptno"), r.getDouble("sal"));
			}
			System.out.printf("\n\n");



			/*************************************************************
			 *                                                           *
			 *                          Part III                         *
			 *                                                           *
			 *************************************************************/

			/* Execute 'raisesalary()' */
			s.execute("CALL raisesalary(20, 10)");			

			/* Query again */
			System.out.printf("Ka-Ching!!\n\n");
			System.out.printf("********************" + 
					  " Employee Data after Raise " +
					  "********************\n");
			r = s.executeQuery("SELECT * FROM SCOTTHR_EMP");
			while (r.next()) {
				System.out.printf("Employee #%d, %s, at Dept No %d makes $%g\n",
						  r.getInt("empno"), r.getString("ename"),
						  r.getInt("deptno"), r.getDouble("sal"));
			}
			System.out.printf("\n");

		} catch (SQLException ex) {
			if (c != null) {
				c.rollback();
				c.setAutoCommit(true);
			}

			System.err.println("------------------------------------------------------------");
			for (; ex != null; ex = ex.getNextException()) {
				System.err.print("Exception\t: " + ex.getMessage());
				System.err.println("SQLState\t: " + ex.getSQLState());
				System.err.println("Error code\t: " + ex.getErrorCode());
				System.err.println("------------------------------------------------------------");
			}
		} finally {
			if (s != null)
				s.close();
			if (c != null)
				c.close();
		}
	}

}