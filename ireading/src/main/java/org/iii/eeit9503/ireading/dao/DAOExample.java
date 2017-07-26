package org.iii.eeit9503.ireading.dao;

import java.sql.SQLException;

public interface DAOExample{

//insert與update的參數請自行放入對應的物件
public int insert()throws SQLException;
public int update()throws SQLException;

public int delete(String id)throws SQLException;

//findByPK與getAll的回傳值請回傳對應的物件
public void findByPK(String id)throws SQLException;
public void getAll()throws SQLException;

	
}
