package org.iii.eeit9503.ireading.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.bean.ProductStatusBean;
import org.iii.eeit9503.ireading.product.bean.SellListBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.iii.eeit9503.ireading.product.model.ProductStatusService;
import org.iii.eeit9503.ireading.product.model.SellListService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebServlet(urlPatterns = { "/product.controller" })

public class ProductServlet extends HttpServlet {
	private ProductService productService;
	private ProductStatusService productStatusService;
	private SellListService sellListService;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		ApplicationContext context = (ApplicationContext)
				application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		productService = (ProductService)context.getBean("productService");	
		productStatusService = (ProductStatusService)context.getBean("productStatusService");
		sellListService = (SellListService)context.getBean("sellListService");	
	}	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet順利執行");// 此為測試用，用來確認Servlet有順利被執行

		// 以下為Product測試程式
	  // insert (done 2017.07.26)
//		 ProductBean bean = new ProductBean();
//		 bean.setProductID("B000000101");
//		 bean.setStatusID("S0001");
//		 bean.setSellListID("170806001");	
//		 bean.setProductPrice(100);
//		 bean.setDigital(null);
//		 bean.setDetail("有簽名海報");	
//		 bean.setStaus("七成新");
//		 bean.setArrival(new Date(new java.util.Date().getTime()));
//		 bean.setExpiration(new Date(new java.util.Date().getTime() + (long)1000*60*60*24*365) );	
//		 int insert = productService.insert(bean);
//		 System.out.println("--"+insert+"--");

		// update (done)
//		 ProductBean bean=new ProductBean();
//		 bean.setProductID("B000000101");
//		 bean.setStatusID("S0001");
//		 bean.setSellListID("170806001");
//		 bean.setProductPrice(200);
//		 bean.setDigital(null);
//		 bean.setDetail(null);
//		 bean.setStaus("七成新");
//		 bean.setArrival(new Date(new java.util.Date().getTime()));
//		 bean.setExpiration(new Date(new java.util.Date().getTime() + (long)1000*60*60*24*365) );		 
//		 int update=productService.update(bean);
//		 System.out.println(update);

		// delete
//		 int delete = productService.delete("B000000101");
//		 System.out.println(delete);

		// findByPrimaryKey (done)
//		 ProductBean bean =  productService.findByPrimaryKey("B000000002");
//		 System.out.println(bean.getProductID()+":"+bean.getStatusID()+":"+bean.getSellListID()+":"+
//		     bean.getProductPrice()+":"+bean.getDigital()+":"+bean.getDetail()+":"+bean.getStaus()+":"+bean.getArrival()+":"+bean.getExpiration());

		// selectAll Hibernate P.90 (done 2017.07.26)
		//Spring
//		List<ProductBean> list=productService.getAll();
//			for (ProductBean aArray : list) {
//				System.out.println(aArray.getProductID()+":"
//				+ aArray.getStatusID() +":"	
//			    + aArray.getSellListID()+":"  
//			    + aArray.getProductPrice() +":"
//			    + aArray.getDigital() +":"
//			    + aArray.getDetail()+":"			    
//			    + aArray.getStaus()+":"
//			    + aArray.getArrival() +":"
//			    + aArray.getExpiration());
//				}
		
//-------------------------------------------------
		//productStatus
		//insert
//			ProductStatusBean bean=new ProductStatusBean();
//			bean.setStatusID("S0007");
//			bean.setStatusName("處理中");	
//			int update=productStatusService.insert(bean);
//			System.out.println(update);
		
		//update
//			ProductStatusBean bean=new ProductStatusBean();
//			bean.setStatusID("S0007");
//			bean.setStatusName("處理中2");	
//			int update=productStatusService.update(bean);
//			System.out.println(update);
		
		//delete
//		int update=productStatusService.delete("S0007");
//		System.out.println(update);
		
		//findByID
//		ProductStatusBean bean=productStatusService.findByPrimaryKey("S0001");
//		System.out.println(bean.getStatusID()+":"+bean.getStatusName());
		
		//getAll
//		List<ProductStatusBean> list=productStatusService.getAll();
//		for(ProductStatusBean bean:list){
//			System.out.println(bean.getStatusID()+":"+bean.getStatusName());			
//		}
		
//----------------------------------------------
		//SellList
		
		//insert
//		SellListBean bean = new SellListBean();
//		bean.setSellListID("170901110");
//		bean.setMemberID("M170000003");
//		bean.setStatusID("L0001");
//		bean.setApplyDate(new Date(new java.util.Date().getTime()));
//		int insert = sellListService.insert(bean);
//		System.out.println("--"+ insert +"--");	
		
		//update
//		SellListBean bean = new SellListBean();
//		bean.setSellListID("170901110");
//		bean.setMemberID("M170000003");
//		bean.setStatusID("L0002");
//		bean.setApplyDate(new Date(new java.util.Date().getTime()));
//		int insert = sellListService.update(bean);
//		System.out.println("--"+ insert +"--");	
		
		//delete
//		int delete =sellListService.delete("170901110");
//		System.out.println(delete);
		
		// findByPrimaryKey
//		SellListBean bean =sellListService.findByPrimaryKey("170729001");
//		System.out.println(bean.getSellListID() + ":"
//				+ bean.getMemberID() + ":"
//				+ bean.getStatusID() + ":"
//				+ bean.getApplyDate());
		
		//getAll
//		List<SellListBean> bean=sellListService.getAll();
//		for(SellListBean list:bean)
//		{System.out.println(list.getSellListID()+":"+list.getMemberID());			
//		}	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}
