package org.iii.eeit9503.ireading.dao;

import java.sql.SQLException;
import java.util.*;

public interface IBCDetailDAO {
	public void getConnection() throws SQLException;
	public int insert(BCDetailDAO dao) throws SQLException;
	public int update(BCDetailDAO dao) throws SQLException;
	// 雙主鍵問題
	public int delete(int ISBN) throws SQLException;
	// 雙主鍵問題
	public BCDetailDAO findbyPrimaryKey(int ISBN) throws SQLException ;
	public List<BCDetailVO>getAll() throws SQLException;
	public void closeConn() throws SQLException;
}//end of class IBCDetailDAO
