package org.iii.eeit9503.ireading.book.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BooksDAOHibernate implements BooksDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public int insert(BooksBean booksBean) {

		try {
			Session session = this.getSession();
			BooksBean bean = session.get(BooksBean.class, booksBean.getISBN());

			if (bean == null) {
				session.saveOrUpdate(booksBean);

				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	public int update(BooksBean booksBean) {

		try {
			Session session = this.getSession();

			session.saveOrUpdate(booksBean);

			return 1;
		} catch (Exception e) {

			return 0;
		}
	}

	public int delete(String ISBN) {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("delete from BooksBean where ISBN=?");
			query.setParameter(0, ISBN);
			int delete = query.executeUpdate();

			return delete;
		} catch (Exception e) {

			return 0;
		}
	}

	public BooksBean findByID(String ISBN) {
		try {
			Session session = this.getSession();
			BooksBean bean = session.get(BooksBean.class, ISBN);

			return bean;
		} catch (Exception e) {

			return null;
		}
	}

	public List<BooksBean> getAll() {
		try {
			Session session = this.getSession();

			Query query = session.createQuery("from BooksBean");

			List<BooksBean> list = query.list();

			// for (BooksBean bean : list) {
			//
			// System.out.print(bean.getISBN() + "\t" + bean.getCategoryID() +
			// "\t" + bean.getTitle() + "\t"
			// + bean.getCover() + "\t" + bean.getAuthor() + "\t" +
			// bean.getPublisher() + "\t" + bean.getLanguage()
			// + "\t" + bean.getPub_Date() + "\t" + bean.getOri_Price() + "\t" +
			// bean.getAbstract() + "\t"
			// + bean.getClick() + "\t" + bean.getRateAvg());
			// }

			return list;
		} catch (Exception e) {
			return null;
		} 

	}

//	public static void main(String[] args) {
		// insert
		// BooksBean bean = new BooksBean();
		// bean.setISBN("9789570530630");
		// bean.setCategoryID("000");
		// bean.setTitle("如何閱讀一本書2222");
		// bean.setCover(null);
		// bean.setAuthor("莫提默‧艾德勒、查理‧范多倫");
		// bean.setPublisher("臺灣商務印書館股份有限公司");
		// bean.setLanguage(0);
		// bean.setPub_Date(new java.sql.Date(2016/12/01));
		// bean.setOri_Price(480);
		// bean.setAbstract("001");
		// bean.setClick(0);
		// bean.setRateAvg(0.0);
		//
		// BooksDAO dao = new BooksDAO();
		// int insert = dao.insert(bean);
		// System.out.println("--" + insert + "--");

		// update
		// BooksBean bean = new BooksBean();
		// bean.setISBN("9789570530630");
		// bean.setCategoryID("000");
		// bean.setTitle("如何閱讀一本書333");
		// bean.setCover(null);
		// bean.setAuthor("莫提默‧艾德勒、查理‧范多倫");
		// bean.setPublisher("臺灣商務印書館股份有限公司");
		// bean.setLanguage(0);
		// bean.setPub_Date(new java.sql.Date(2016 / 12 / 01));
		// bean.setOri_Price(480);
		// bean.setAbstract("001");
		// bean.setClick(0);
		// bean.setRateAvg(0.0);
		//
		// BooksDAO dao = new BooksDAO();
		// int update = dao.update(bean);
		// System.out.println(update);

		// delete
		// BooksDAO dao = new BooksDAO();
		// int delete = dao.delete("9789570530630");
		// System.out.println(delete);

		// findByID
		// BooksDAO dao = new BooksDAO();
		// BooksBean bean = dao.findByPK("9789570530629");
		// System.out.println(bean.getISBN() + "\t" + bean.getCategoryID() +
		// "\t" + bean.getTitle() + "\t"
		// + bean.getCover() + "\t" + bean.getAuthor() + "\t" +
		// bean.getPublisher() + "\t" + bean.getLanguage()
		// + "\t" + bean.getPub_Date() + "\t" + bean.getOri_Price() + "\t" +
		// bean.getAbstract() + "\t"
		// + bean.getClick() + "\t" + bean.getRateAvg());

		// selectAll (Hibernate page.90)
//		BooksDAOHibernate dao = new BooksDAOHibernate();
//		List<BooksBean> list = dao.getAll();
//
//		for (BooksBean bean : list) {
//			System.out.println(bean.getISBN() + "\t" + bean.getCategoryID() + "\t" + bean.getTitle() + "\t"
//					+ bean.getCover() + "\t" + bean.getAuthor() + "\t" + bean.getPublisher() + "\t" + bean.getLanguage()
//					+ "\t" + bean.getPub_Date() + "\t" + bean.getOri_Price() + "\t" + bean.getAbstract() + "\t"
//					+ bean.getClick() + "\t" + bean.getRateAvg());
//
//		}
//	} // main
} // class BooksDAO
