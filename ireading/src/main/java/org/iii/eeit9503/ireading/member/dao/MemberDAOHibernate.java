package org.iii.eeit9503.ireading.member.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.transfer.PrimitiveNumberEditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Repository
public class MemberDAOHibernate implements MemberDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(java.sql.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	private static final String GET_ALL_STMT = "from MemberBean order by MemberID";

	@Override
	public MemberBean insert(MemberBean bean) {
		MemberBean memberBean;
		if (bean != null) {
			memberBean = (MemberBean) this.getSession().get(MemberBean.class, bean.getMemberID());
			if (memberBean == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public MemberBean update(MemberBean bean) {
		MemberBean memberBean;
		if (bean != null) {
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	@Override
	public int delete(String MemberID) {
		try {
			MemberBean bean = (MemberBean) this.getSession().get(MemberBean.class, MemberID);
			this.getSession().delete(bean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<MemberBean> select() {
		Criteria criteria = this.getSession().createCriteria(MemberBean.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<MemberBean> list = criteria.list();
		return list;
//		Session session = this.getSession();
//		Query query = session.createQuery(GET_ALL_STMT);
//		List<MemberBean> list = query.list();
//		return list;
	}
	
	@Override
	public List<MemberBean> selectPaging() {
		Criteria criteria = this.getSession().createCriteria(MemberBean.class);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		criteria.addOrder(Order.asc("MemberID"));
//		criteria.setFirstResult(0);
//		criteria.setMaxResults(10);
		List<MemberBean> list = (List<MemberBean>)criteria.list();
		return list;
//		Session session = this.getSession();
//		Query query = session.createQuery(GET_ALL_STMT);
//		List<MemberBean> list = query.list();
//		return list;
	}

	@Override
	public MemberBean select(String MemberID) {
		Criteria criteria = this.getSession().createCriteria(MemberBean.class);
		criteria.add(Restrictions.eq("MemberID", MemberID));
		MemberBean bean = (MemberBean)criteria.uniqueResult();
//		MemberBean bean = this.getSession().get(MemberBean.class, MemberID);
		return bean;
	}	
	
	@Override
	public String getLastID(){
		String lastID = null;
		Session session = this.getSession();
		Query query = session.createSQLQuery("select  top 1 substring(m.MemberID,4,7) from Member as m order by substring(m.MemberID, 4, 7) desc");
		lastID = (String)query.uniqueResult();
//		System.out.println("DAO\t" + lastID);
		return lastID;
	}

	@Override
	public MemberBean selectByAccount(String account) {
		Criteria criteria = this.getSession().createCriteria(MemberBean.class);
		criteria.add(Restrictions.eq("Account", account));
		MemberBean bean = (MemberBean)criteria.uniqueResult();
		return bean;
	}
}
