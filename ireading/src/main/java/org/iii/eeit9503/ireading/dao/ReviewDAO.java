package org.iii.eeit9503.ireading.dao;

import java.util.List;

import org.iii.eeit9503.ireading.model.ReviewBean;

public interface ReviewDAO {
	public void insert(ReviewBean bean);
	public void update(ReviewBean bean);
	public void delete(String MemberID, String ISBN);
	public ReviewBean findByID(String MemberID, String ISBN);
	public List<ReviewBean> getAll();
	

}
