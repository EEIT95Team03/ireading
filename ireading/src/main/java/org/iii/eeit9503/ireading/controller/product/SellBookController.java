package org.iii.eeit9503.ireading.controller.product;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("product/sellBook")
public class SellBookController {

	// @InitBinder
	// public void initializePropertyEditor(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(java.util.Date.class, "arrival",
	// new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	// }

	@Autowired
	private ProductService productService;
	@Autowired
	private BooksService booksService;
	@Autowired
	private IDGgenerator idGgenerator;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// select
	@RequestMapping(method = RequestMethod.GET)
	public String select(HttpServletRequest request,ProductBean productBean, Model model) {

		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}		
		
		StringBuffer sqlText = new StringBuffer();
		
		sqlText.append("SELECT ").append("p.ProductID, ").append("b.ISBN, ").append("p.Status, ").append("p.StatusID, ").append("b.Title, ").append("b.Ori_Price, ")
				.append("p.Detail, ").append("p.ProductPrice, ").append("Round(ProductPrice*0.7,2)Price,").append("sl.MemberID ").append("FROM ").append("Product p ")
				.append("LEFT OUTER JOIN ").append("Books b ").append("ON ").append("(p.ISBN = b.ISBN)")
				.append("LEFT OUTER JOIN ").append("SellList sl ").append("ON ").append("(p.SellListID = sl.SellListID) ")
				.append("where MemberID='"+MemberID+"' ").append("and p.StatusID='S0004' ");
       
		
		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqlText.toString());
		
		
		System.out.println(dataLs);
		model.addAttribute("dataLs", dataLs); // 給前端JSP使用

		return "sellbook.list";
	}// end of select

	// insert
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insert(@RequestParam Map<String, Object> dataMap) {

		// String ISBN = (String)dataMap.get("ISBN")
		String ISBN = MapUtils.getString(dataMap, "ISBN");

		String detail = MapUtils.getString(dataMap, "detail");
		int productPrice = MapUtils.getInteger(dataMap, "productPrice");
		System.out.println(ISBN);

		ProductBean bean = new ProductBean();

		BooksBean bookbean = booksService.findByID(ISBN);

		if (bookbean == null) {

			BooksBean newbookbean = new BooksBean();
			newbookbean.setISBN(ISBN);
			String title = MapUtils.getString(dataMap, "title");
			int ori_Price = MapUtils.getInteger(dataMap, "ori_Price");
			newbookbean.setTitle(title);
			newbookbean.setOri_Price(ori_Price);
			BooksBean bbean = booksService.insert(newbookbean);

			if (bbean != null) {
				bean.setBooksBean(newbookbean);
			} else {
				System.out.println("失敗");
				return null;
			}
		} else {
			bean.setBooksBean(bookbean);
		}

		// BooksBean bean = new BooksBean();
		// bean.getBooksBean().setISBN(MapUtils.getString(dataMap, "ISBN"));
		System.out.println(idGgenerator.getProductID());
		bean.setProductID(idGgenerator.getProductID());

		bean.setDetail(detail);
		bean.setProductPrice(productPrice);

		int insertSellBook = productService.insert(bean);
		System.out.println(bean);

		if (insertSellBook == 0) {
			return "Error";
		}

		return "Success";

	}// end of insert

	// 頁面跳轉到"sellBook.edit"
	@RequestMapping(value = "/goUpdatePage", method = { RequestMethod.POST, RequestMethod.GET })
	public String goUpdatePage(Model model, @RequestParam Map<String, Object> params) {
		// System.out.println(params);
		String ProductID = MapUtils.getString(params, "ProductID");
		System.out.println("ProductID:" + ProductID);

		String ISBN = MapUtils.getString(params, "ISBN");
		System.out.println("ISBN :" + ISBN);
		
		// String detail = MapUtils.getString(params, "detail");
		// int productPrice = MapUtils.getInteger(params, "productPrice");

		ProductBean bean = new ProductBean();
		bean.setProductID(ProductID);
		//
		// List<ProductBean> responseList = productService.getAll(bean);
		//
		// model.addAttribute("responseData", responseList.get(0));
		//
		// JdbcTemplate jdbcTemplate = new JdbcTemplate();

		return "sellbook.update";
	}

	// update
	@RequestMapping(value = "/update", method = { RequestMethod.POST }, produces = { "application/json" })
	@ResponseBody
	public String update(Model model, @RequestParam Map<String, Object> params) {

		String ProductID = MapUtils.getString(params, "Product");				
		int ProductPrice = MapUtils.getInteger(params, "Price");
		String Detail = MapUtils.getString(params, "Detail");

		ProductBean bean=productService.findByPrimaryKey(ProductID);
		bean.setProductPrice(ProductPrice);
		bean.setDetail(Detail);
		
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		
		int update = productService.update(bean);
		if(update==1){
			obj.put("change","1");
			array.put(obj);
			return array.toString();
		}
		else{
			obj.put("change","0");
			array.put(obj);
			return array.toString();
		}
	}// end of update method

	// delete
	@RequestMapping(value = "/delete", method = { RequestMethod.POST }, produces = { "application/json" })
	@ResponseBody
	public String delete(String ProductID) {
		boolean delete = productService.delete(ProductID);
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("action", "delete");
		obj.put("id", ProductID);
		obj.put("change", delete);
		array.put(obj);
		return array.toString();
	}// end of delete method

}
