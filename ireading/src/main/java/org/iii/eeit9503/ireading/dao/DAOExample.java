package org.iii.eeit9503.ireading.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAOExample{
public void getConnection() throws SQLException;

//insert與update的參數請自行放入對應的物件
public int insert(EmpVO evt)throws SQLException;
public int update(EmpVO evt)throws SQLException;
public int delete(int evtid)throws SQLException;

//findByPK與getAll的回傳值請回傳對應的物件
public EmpVO findByPK(int evtid)throws SQLException;
public List<EmpVO> getAll()throws SQLException;
public void closeConn() throws SQLException;

}
