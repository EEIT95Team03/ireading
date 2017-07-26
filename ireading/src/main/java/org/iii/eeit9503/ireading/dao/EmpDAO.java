package org.iii.eeit9503.ireading.dao;

import java.util.*;
import java.sql.*;

public class EmpDAO implements DAOExample{
	private static final String INSERT_STMT = 
			"INSERT INTO event VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		private static final String UPDATE_STMT = 
			"UPDATE event SET eventname=?, eventdate=?, host=?, eventphone=?, eventplace=?, "
			+ "eventimg=?, deadline=?, eventcontent=?, max=? WHERE eventid=?";
		private static final String DELETE_STMT = 
			"DELETE FROM event WHERE eventid=?";
		private static final String GET_ONE_STMT = 
			"SELECT eventid, eventname, eventdate, host, eventphone, eventplace, eventimg, "
			+ "deadline, eventcontent, max FROM event WHERE eventid=?";
		private static final String GET_ALL_STMT = 
			"SELECT eventid, eventname, eventdate, host, eventphone, eventplace, eventimg, "
			+ "deadline, eventcontent, max FROM event ORDER BY eventid";

		Connection conn = null;

		public void getConnection() throws SQLException {
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=ireadDB";
			conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
		}

		public int insert(EmpVO evt) throws SQLException {
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
			pstmt.setString(1, evt.getEvtname());
			pstmt.setDate(2, evt.getEvtdate());
			pstmt.setString(3, evt.getHost());
			pstmt.setString(4, evt.getEvtphone());
			pstmt.setString(5, evt.getEvtplace());
			pstmt.setString(6, evt.getEvtimg());
			pstmt.setDate(7, evt.getEvtdeadline());
			pstmt.setString(8, evt.getEvtcont());
			pstmt.setInt(9, evt.getEvtmax());
			pstmt.setString(10, evt.getEvtid());
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public int update(EmpVO evt) throws SQLException {
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, evt.getEvtname());
			pstmt.setDate(2, evt.getEvtdate());
			pstmt.setString(3, evt.getHost());
			pstmt.setString(4, evt.getEvtphone());
			pstmt.setString(5, evt.getEvtplace());
			pstmt.setString(6, evt.getEvtimg());
			pstmt.setDate(7, evt.getEvtdeadline());
			pstmt.setString(8, evt.getEvtcont());
			pstmt.setInt(9, evt.getEvtmax());
			pstmt.setString(10, evt.getEvtid());
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public int delete(int evtid) throws SQLException {
			int updateCount = 0;
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
			pstmt.setInt(1, evtid);
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

		public EmpVO findByPK(int evtid) throws SQLException {
			EmpVO evt = null;
			PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, evtid);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				evt = new EmpVO();
				evt.setEvtid(rs.getString("eventid"));
				evt.setEvtname(rs.getString("eventname"));
				evt.setEvtdate(rs.getDate("eventdate"));
				evt.setHost(rs.getString("host"));
				evt.setEvtphone(rs.getString("eventphone"));
				evt.setEvtplace(rs.getString("eventplace"));
				evt.setEvtimg(rs.getString("eventimg"));
				evt.setEvtdeadline(rs.getDate("deadline"));
				evt.setEvtcont(rs.getString("eventcontent"));
				evt.setEvtplace(rs.getString("max"));
			}
			return evt;
		}

		public List<EmpVO> getAll() throws SQLException {
			EmpVO evt = null;
			List<EmpVO> evts = new ArrayList<EmpVO>();
			PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				evt = new EmpVO();
				evt.setEvtid(rs.getString("eventid"));
				evt.setEvtname(rs.getString("eventname"));
				evt.setEvtdate(rs.getDate("eventdate"));
				evt.setHost(rs.getString("host"));
				evt.setEvtphone(rs.getString("eventphone"));
				evt.setEvtplace(rs.getString("eventplace"));
				evt.setEvtimg(rs.getString("eventimg"));
				evt.setEvtdeadline(rs.getDate("deadline"));
				evt.setEvtcont(rs.getString("eventcontent"));
				evt.setEvtplace(rs.getString("max"));
				evts.add(evt);
			}
			return evts;
		}

		public void closeConn() throws SQLException {
			if (conn != null)
				conn.close();
		}
}
