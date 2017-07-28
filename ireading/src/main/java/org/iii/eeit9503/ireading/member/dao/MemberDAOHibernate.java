package org.iii.eeit9503.ireading.member.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOHibernate implements MemberDAO{
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
		
	private static final String GET_ALL_STMT = "from MemberBean order by MemberID";

	@Override
	public int insert(MemberBean bean) {
		try {
			Session session = this.getSession();
			session.saveOrUpdate(bean);
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int update(MemberBean bean) {
		Session session = this.getSession();
		try {
			session.saveOrUpdate(bean);
			return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
	}

	@Override
	public int delete(String MemberID) {
		try {
			Session session = this.getSession();
			
			MemberBean bean = (MemberBean)session.get(MemberBean.class, MemberID);
			session.delete(bean);

			return 1;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
	}

	@Override
	public MemberBean findByID(String MemberID) {
		try {
			Session session = this.getSession();
			MemberBean bean = session.get(MemberBean.class, MemberID);
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<MemberBean> getAll() {
		try {		
			Session session = this.getSession();
			Query query = session.createQuery(GET_ALL_STMT);
			List<MemberBean> list= query.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
}
