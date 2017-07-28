package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.iii.eeit9503.ireading.book.bean.CategoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOHibernate implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public int insert(CategoryBean categoryBean) {

		try {
			Session session = this.getSession();
			CategoryBean bean = session.get(CategoryBean.class, categoryBean.getCategoryID());

			if (bean == null) {
				session.saveOrUpdate(categoryBean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	public int update(CategoryBean categoryBean) {

		try {
			Session session = this.getSession();

			session.saveOrUpdate(categoryBean);

			return 1;
		} catch (Exception e) {

			return 0;
		}
	}

	public int delete(String CategoryID) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from CategoryBean where CategoryID=?");
			query.setParameter(0, CategoryID);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {

			return 0;
		}
	}

	public CategoryBean findByID(String CategoryID) {
		try {
			Session session = this.getSession();
			CategoryBean bean = session.get(CategoryBean.class, CategoryID);

			return bean;
		} catch (Exception e) {

			return null;
		}
	}

	public List<CategoryBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from CategoryBean");

			List<CategoryBean> list = query.list();

			// for (CategoryBean bean : list) {
			//
			// System.out.print(bean.getCategoryID() + ": " + bean.getCategoryName());
			// }

			return list;
		} catch (Exception e) {
			return null;
		} 

	}

//	public static void main(String[] args) {
	// insert
//	CategoryBean bean = new CategoryBean();
//	bean.setCategoryID("001");
//	bean.setCategoryName("總類2");
//
//	int insert = categoryService.insert(bean);
//	System.out.println("--" + insert + "--");

	// update
//	CategoryBean bean = new CategoryBean();
//	bean.setCategoryID("001");
//	bean.setCategoryName("總類3");
//	
//	 int update = categoryService.update(bean);
//	 System.out.println("--" + update + "--");
//	 
	// delete
//	 int delete = categoryService.delete("001");
//	 System.out.println("--" + delete + "--");

	// findByID
//	 CategoryBean bean = categoryService.findByID("000");
//	 System.out.println(bean.getCategoryID() + ": " + bean.getCategoryName());

	// selectAll (Hibernate page.90)
//	 List<CategoryBean> list = categoryService.getAll();
//	 for (CategoryBean bean : list) {
//	 System.out.println(bean.getCategoryID() + ": " + bean.getCategoryName());
//     }
//	} // main
} // class BooksDAO
