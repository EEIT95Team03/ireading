package org.iii.eeit9503.ireading.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.dao.ProductDAO;
import org.iii.eeit9503.ireading.model.ProductBean;

@WebServlet(urlPatterns = { "/testProduct.controller" })

public class testProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet順利執行");// 此為測試用，用來確認Servlet有順利被執行

		// 以下為Product測試程式
		// insert (done 2017.07.26)
		 ProductBean bean = new ProductBean();
		 bean.setProductID("B000000099");
		 bean.setStatusID("S0001");
		 bean.setSellListID("170806001");
		
		 bean.setProductPrice(100);
		 bean.setDigital(null);
		 bean.setDetail("有簽名海報");
		
		 bean.setStaus("七成新");
		 bean.setArrival(new Date(new java.util.Date().getTime()));
		 bean.setExpiration(new Date(new java.util.Date().getTime() + (long)1000*60*60*24*365) );
		
		 ProductDAO dao=new ProductDAO();
		 int insert = dao.insert(bean);
		 System.out.println("--"+insert+"--");

		// update
		// OrderBean bean=new OrderBean();
		// bean.setOrderID("O170726001");
		// bean.setPayID("P0001");
		// bean.setMemberID("M170000007");
		// bean.setStatusID("OS001");
		// bean.setInvoice("SR89510541");
		// bean.setOaddr("台北市松山區健康路243號8樓");
		// bean.setOdate(new Date(new java.util.Date().getTime()));
		// bean.setOtotal(12345);
		// bean.setOmemo(null);
		// bean.setReciepient("張景一");
		// OrderDAO dao=new OrderDAO();
		// int update=dao.update(bean);
		// System.out.println(update);

		// delete
		// OrderDAO dao=new OrderDAO();
		// int update=dao.delete("O170726001");
		// System.out.println(update);

		// findByID
		// OrderDAO dao=new OrderDAO();
		// OrderBean bean=dao.findByPK("O170720001");
		// System.out.println(bean.getOrderID()+":"+bean.getMemberID()+":"+bean.getOaddr());

		// selectAll Hibernate P.90 (done 2017.07.26)
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		session.beginTransaction();
//		Query query = session.createQuery("select ProductID,StatusID, SellListID, ProductPrice,"
//				+ " Digital, Detail, Staus, Arrival, Expiration from ProductBean");
//		List<Object[]> list = query.list();
//		session.getTransaction().commit();
//		for (Object[] aArray : list) {
//			for (Object aColumn : aArray) {
//				System.out.print(aColumn + ": ");
//			}
//			System.out.println();
//		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}
