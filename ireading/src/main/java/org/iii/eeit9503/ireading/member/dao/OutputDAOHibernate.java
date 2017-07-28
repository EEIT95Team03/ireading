package org.iii.eeit9503.ireading.member.dao;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.member.bean.OutputBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OutputDAOHibernate implements OutputDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	private static final String GET_ALL_STMT = "from OutputBean order by MemberID";

	@Override
	public int insert(OutputBean bean) {
		Session session = this.getSession();
		try {
			session.saveOrUpdate(bean);
			return 1;
		} catch (Exception e) {
			session.getTransaction().rollback();
			return 0;
		}
	}

	@Override
	public int update(OutputBean bean) {
		Session session = this.getSession();
		try {
			session.saveOrUpdate(bean);
			return 1;
		} catch (Exception e) {
			session.getTransaction().rollback();
			return 0;
		}
	}

	@Override
	public int delete(String MemberID, String ApplyTime) {
		Session session = this.getSession();
		try {

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp date =  new Timestamp(df.parse(ApplyTime).getTime());
			OutputBean bean = new OutputBean();
			bean.setMemberID(MemberID);
			bean.setApplyTime(date);
			session.delete(bean);
			return 1;
		} catch (Exception e) {
			return 0;
		}

	}

	@Override
	public OutputBean findByID(String MemberID, String ApplyTime) {
		Session session = this.getSession();
		try {
			OutputBean bean = new OutputBean();
			Criteria query = session.createCriteria(OutputBean.class);
			query.add(Restrictions.eq("MemberID", MemberID));
			query.add(Restrictions.eq("ApplyTime", ApplyTime));
			bean = (OutputBean) query.uniqueResult();
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OutputBean> getAll() {
		Session session = this.getSession();
		List<OutputBean> list = null;
		try {

			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
