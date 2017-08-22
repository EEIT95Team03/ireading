package org.iii.eeit9503.ireading.controller.product;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("soldproduct.controller")
public class SoldProductController {
	// select *
	// from Product p
	// left outer join SellList sl
	// on sl.selllistID = p.selllistID
	// join ProductStatus ps
	// on p.StatusID = ps.StatusID
	// where ps.StatusID ='S0001'

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private ProductService productService;

	@RequestMapping(value = "/selectSoldList", method = RequestMethod.GET)
	public String selectSellList(ProductBean productBean, Model model,HttpServletRequest request) {

		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		
		
		String sqltext = "select DISTINCT sl.SellListID, sls.StatusName, sl.ApplyDate "  
		        + "from SellList sl "
				+ "left outer join SellListStatus sls " + "on sl.StatusID = sls.StatusID "
				+ "left outer join Product p "  
				+ "on p.SellListID = sl.SellListID where sl.MemberID='"+MemberID+"' ";

		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());
//		System.out.println(dataLs);
		model.addAttribute("dataLs", dataLs); // 給前端JSP使用

		return "sold.list";
	}

	@RequestMapping(value = "/SoldList", method = RequestMethod.GET)
	public String select(ProductBean productBean, Model model) {

	
		
		String sqltext = "select * from Product p " + "left outer join SellList sl on sl.selllistID = p.selllistID "
				+ "join ProductStatus ps on p.StatusID = ps.StatusID " + "where ps.StatusID ='S0001'";

		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());
//		System.out.println(dataLs);
		// model.addAttribute("dataLs", dataLs); // 給前端JSP使用

		return "sold.list";
	}

	@RequestMapping(value = "/{SellListID}", method = { RequestMethod.GET })
	public String findByMemberID(@PathVariable("SellListID") String SellListID, ProductBean productBean, Model model) {
		
		String sqltext = "select p.ProductID, p.ProductPrice, p.Detail, p.status, p.selllistID, b.Title " +
				         "from Product p join Books b on b.ISBN = p.ISBN " +
				         "where SellListID = " + SellListID;

		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());
		System.out.println(dataLs);
		model.addAttribute("dataLs", dataLs);
		model.addAttribute("SellListID", SellListID);
//		List<ProductBean> list = productService.findByPrimaryKey(SellListID);

		// List<ReviewBean> list= reviewService.findByMemberID(MemberID);
		// model.addAttribute("findByMemberID",list);
		// model.addAttribute("MemberID", MemberID);
		// System.out.println(MemberID);

		return "solddetail.list";
	}
	
	@RequestMapping(value = "print/{SellListID}", method = { RequestMethod.GET })
	public String printPDF(@PathVariable("SellListID") String SellListID, ProductBean productBean, Model model) {
		
		String sqltext = "select p.ProductID, p.ProductPrice, p.Detail, p.status, p.selllistID, b.Title " +
				         "from Product p join Books b on b.ISBN = p.ISBN " +
				         "where SellListID = " + SellListID;
		
		String sqltext2 ="select MemberID, ApplyDate from SellList where SellListID = " + SellListID;

		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());
		List<Map<String, Object>> dataLs2 = jdbcTemplate.queryForList(sqltext2.toString());
		
		model.addAttribute("dataLs", dataLs);
		model.addAttribute("SellListID", SellListID);
		model.addAttribute("dataLs2", dataLs2);
		System.out.println(dataLs2);

//		List<ProductBean> list = productService.findByPrimaryKey(SellListID);

		// List<ReviewBean> list= reviewService.findByMemberID(MemberID);
		// model.addAttribute("findByMemberID",list);
		// model.addAttribute("MemberID", MemberID);
		// System.out.println(MemberID);

		return "user.printPDF";
	}
}
