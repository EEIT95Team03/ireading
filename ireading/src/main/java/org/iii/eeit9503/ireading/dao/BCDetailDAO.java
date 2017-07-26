package org.iii.eeit9503.ireading.dao;

import java.sql.*;
import java.util.*;

public class BCDetailDAO implements IBCDetailDAO{
	private static final String INSERT_STMT=
			"INSERT INTO BCDetail VALUES(?,?,?)";
	private static final String UPDATE_STMT=
			"UPDATE BCDetail SET ISBN=?, BCID?, BookRank=?";
	private static final String DELETE_STMT= 
			"DELETE FROM BCDetail WHERE ISBN=?"; //雙主鍵問題
	private static final String GET_ONE_STMT=
			"SELECT ISBN, BCID, BookRank FROM BCDetail WHERE ISBM=?";
	private static final String GET_ALL_STMT=
			"SELECT ISBN, BCID, BookRank FROM BCDetail";
	
	
	Connection conn =null;
	
	public void getConnetion() throws SQLException{
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=jdbc";
		conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
	}
	
//	insert
	public int insert(BCDetailVO BCDetail) throws SQLException{
		int updateCount = 0;
		PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
		pstmt.setString(1, BCDetail.getISBN());
		pstmt.setString(2, BCDetail.getBCID());
		pstmt.setShort(3, BCDetail.getBookRank());
		updateCount = pstmt.executeUpdate();
		return updateCount;		
	}
	
//	update
	public int update(BCDetailVO BCDetail) throws SQLException{
		int updateCount = 0;
		PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
		pstmt.setString(1, BCDetail.getISBN());
		pstmt.setString(2, BCDetail.getBCID());
		pstmt.setShort(3, BCDetail.getBookRank());
		updateCount = pstmt.executeUpdate();
		return updateCount;		
	}
	
//	delete
	public int delete(String ISBN) throws SQLException{
		int updateCount = 0;
		PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
		pstmt.setString(1, ISBN);
		updateCount = pstmt.executeUpdate();
		return updateCount;		
	}
	
//	find 1
	public BCDetailVO findByPrimaryKey(String ISBN) throws SQLException{
		BCDetailVO BCDetail = null;
		PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
		pstmt.setString(1, ISBN);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			BCDetail = new BCDetailVO();
			BCDetail.setISBN(rs.getString("ISBN"));
			BCDetail.setBCID(rs.getString("BCID"));
			BCDetail.setBookRank(rs.getShort("BookRank"));
		}
		return BCDetail;
	}
	
//	find all
	public List<BCDetailVO> getAll() throws SQLException{
		BCDetailVO BCDetail = null;
		List<BCDetailVO>BCDetails = new ArrayList<BCDetailVO>();
		PreparedStatement pstmt = conn.prepareStatement(GET_ALL_STMT);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()){
			BCDetail = new BCDetailVO();
			BCDetail.setISBN(rs.getString("ISBN"));
			BCDetail.setBCID(rs.getString("BCID"));
			BCDetail.setBookRank(rs.getShort("BookRank"));
			BCDetails.add(BCDetail);
		}
		return BCDetails;
	}
	 
	public void closeConn() throws SQLException{
	if(conn != null)
		conn.close();
}

}

