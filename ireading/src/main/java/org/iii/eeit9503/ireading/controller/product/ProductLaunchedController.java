package org.iii.eeit9503.ireading.controller.product;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.bean.SellListBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.iii.eeit9503.ireading.product.model.SellListService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("productlaunched.controller")
// productlaunched.controller
public class ProductLaunchedController {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ProductService productService;
	@Autowired
	private SellListService sellListService;

	// select
	@RequestMapping(value = "/SellBookMainPage", method = RequestMethod.GET)
	public String select(ProductBean productBean, Model model) {

		StringBuffer sqlText = new StringBuffer();

		// select p.ProductID, sl.StatusName,
		// p.SellListID,p.ProductPrice,p.Detail,p.Status
		// from Product p join SellList s
		// on p.SellListID = s.SellListID
		// join SellListStatus sl
		// on sl.StatusID = s.StatusID
		// where p.SellListID = 170913001

		sqlText.append("SELECT p.ProductID, sl.StatusName, p.SellListID, p.ProductPrice, p.Detail, p.Status ")
				.append("FROM Product p JOIN SellList s ").append("ON p.SellListID  = s.SellListID ")
				.append("JOIN SellListStatus sl ").append("ON sl.StatusID = s.StatusID ");


		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqlText.toString());
		System.out.println(dataLs);
		model.addAttribute("dataLs", dataLs); // 給前端JSP使用
		//
		return "productlaunched.list";
	}// end of select

	// 用來賣書清單ID(SellListID)來查詢
	@RequestMapping(value = "/SearchList", method = RequestMethod.GET)
	public String search(Model model, @RequestParam Map<String, Object> param) {
		System.out.println("param:" + param);

		String searchName = MapUtils.getString(param, "search");
		// System.out.println("sqlText:" + sqlText);
		
		if (searchName.trim().length() != 0) {//SellListID
			String sqlText = "SELECT DISTINCT s.SellListID,s.ApplyDate,s.MemberID, sl.StatusName, p.Detail, p.Status "
					+ "FROM SellList s "
					+ "JOIN Product p " + "ON p.SellListID = s.SellListID "
					+ "JOIN SellListStatus sl " + "ON sl.StatusID = s.StatusID "
					+ "WHERE p.SellListID = " + searchName;

			List<Map<String, Object>> dataList = jdbcTemplate.queryForList(sqlText.toString());
			// System.out.println("dataList:" + dataList);
			
			model.addAttribute("dataList", dataList);
		} else {
			String sqlText ="SELECT DISTINCT s.SellListID,s.ApplyDate, s.MemberID, sl.StatusName "
					+ "FROM SellList s "
					+ "JOIN Product p " + "ON p.SellListID = s.SellListID "
					+ "JOIN SellListStatus sl " + "ON sl.StatusID = s.StatusID ";

			List<Map<String, Object>> dataList = jdbcTemplate.queryForList(sqlText.toString());
			// System.out.println("dataList:" + dataList);
			
			model.addAttribute("dataList", dataList);
		}
		return "productlaunched.list";
	}

	// 用 商品狀態 ProductStatus StatusID來查詢
	@RequestMapping(value = "/searchByStatus", method = RequestMethod.GET)
	public String searchByStatus(Model model, @RequestParam Map<String, Object> param) {
//		System.out.println("param:" + param);

		String searchName = MapUtils.getString(param, "searchstatus");

		String sqlText = "SELECT DISTINCT s.SellListID,s.ApplyDate, s.MemberID, sl.StatusName "
				+ "FROM SellList s "
				+ "JOIN Product p " + "ON p.SellListID = s.SellListID "
				+ "JOIN SellListStatus sl " + "ON sl.StatusID = s.StatusID "
				+ "WHERE s.StatusID like '%" + searchName +"%' ";
		
		System.out.println("searchName:" + searchName);
		
		List<Map<String, Object>> data = jdbcTemplate.queryForList(sqlText.toString());
		// System.out.println("dataList:" + dataList);
		model.addAttribute("dataList", data);

		return "productlaunched.list";
	} //end of searchByStatus method
	
	@RequestMapping(value = "/{SellListID}", method = { RequestMethod.GET })
	public String findBySellListID(@PathVariable("SellListID") String SellListID, ProductBean productBean, Model model) {
		
//		select p.ProductID, p.ProductPrice,ps.StatusName, p.Detail, p.status, p.selllistID, b.Title
//		from Product p 
//		join Books b 
//		on b.ISBN = p.ISBN
//		join ProductStatus ps
//		on ps.StatusID = p.StatusID 
		
		String sqltext = "select p.ProductID, p.ProductPrice,p.StatusID, ps.StatusName, p.Detail, p.status,p.Digital, p.selllistID, b.Title " +
				         "from Product p join Books b on b.ISBN = p.ISBN " +
				         "join ProductStatus ps on ps.StatusID = p.StatusID " +
				         "where SellListID = '" + SellListID+"' ";
		
		String sqltext2 = "select sl.StatusID, sls.statusName from SellList sl join SellListStatus sls "
				+ "on sl.StatusID = sls.StatusID where SellListID = '" + SellListID+"' ";
		
		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());
		List<Map<String, Object>> dataLs2 = jdbcTemplate.queryForList(sqltext2.toString());
//		System.out.println(dataLs);
		model.addAttribute("dataLs", dataLs);
		model.addAttribute("SellListID", SellListID);
		
		model.addAttribute("status", dataLs2.get(0));

		return "solddetailmanager.list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String upCont(@RequestParam Map<String, Object> params){
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		array.put(obj);
		System.out.println(obj);
		
		String ProductID = MapUtils.getString(params, "ProductID");
		System.out.println(ProductID);
		ProductBean pbean = productService.findByPrimaryKey(ProductID);		
		
		String StatusName = MapUtils.getString(params, "StatusName"); 
		int ProductPrice = MapUtils.getInteger(params, "ProductPrice");
		String status = MapUtils.getString(params, "status");
		String Detail = MapUtils.getString(params, "Detail");
		String Digital = MapUtils.getString(params, "Digital");
		System.out.println(StatusName);
		System.out.println(ProductPrice);
		System.out.println(status);
		System.out.println(Detail);
		
		System.out.println(pbean.getProductPrice());
		
		pbean.setProductPrice(ProductPrice);
		pbean.setStatusID(StatusName);
		pbean.setStatus(status);
		pbean.setDetail(Detail);
		pbean.setDigital(Digital);
//		ProductStatusBean psbean = new ProductStatusBean();
//		psbean.setStatusName(StatusName);
		
		int update= productService.update(pbean);
		
		if(update!=0){
			obj.put("change","1");
			return array.toString();
		}	
		else{
			obj.put("change","0");
			return array.toString();    
		}
	}
	
	@RequestMapping(value="/updateSellListID", method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String upSellListID(@RequestParam Map<String, Object> params){
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		array.put(obj);
//		System.out.println(obj);
		
		String SellListID = MapUtils.getString(params, "SellListID");
		System.out.println(SellListID);
		SellListBean slbean = sellListService.findByPrimaryKey(SellListID);		
		
		String statusID = MapUtils.getString(params, "statusid");
		
		slbean.setStatusID(statusID);
		
		int update= sellListService.update(slbean);
		
		if(update!=0){
			obj.put("change","1");
			return array.toString();
		}	
		else{
			obj.put("change","0");
			return array.toString();    
		}
	}
	
	
}
