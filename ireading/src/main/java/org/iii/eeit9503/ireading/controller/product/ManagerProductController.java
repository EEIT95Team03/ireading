package org.iii.eeit9503.ireading.controller.product;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
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
@RequestMapping("Manager.product")
public class ManagerProductController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/selectProduct", method = RequestMethod.GET)
	public String selectProduct(ProductBean productBean, Model model, @RequestParam Map<String, Object> params) {
		
		String ProductID = MapUtils.getString(params, "search");
		String ISBN = MapUtils.getString(params, "search2");
		String StatusID = MapUtils.getString(params, "search3");
		System.out.println(StatusID);
		
		String sqltext = "Select p.ProductID, Title, ps.StatusName, p.ProductPrice, p.status, p.Detail ,p.Digital " + 
				"from Product p " + 
				"join Books b " + 
				"on b.ISBN = p.ISBN " + 
				"join ProductStatus ps " + 
				"on ps.StatusID = p.StatusID " + 
				"WHERE p.ProductID LIKE '%" + ProductID + "%'" + 
				"AND p.ISBN LIKE '%" + ISBN + "%'" +
				"AND ps.StatusID LIKE '%" + StatusID + "%'";
				
		List<Map<String, Object>> dataLs = jdbcTemplate.queryForList(sqltext.toString());		
//				"Select ProductID, Title, StatusName, "
//				+ "ProductPrice, status, Detail FROM Product Where Title LIKE '%" + 
//		searchName + "%' or Author LIKE '%" + searchName + "%'";
		model.addAttribute("dataLs", dataLs);
		
		return "managerproduct.list";
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
}
