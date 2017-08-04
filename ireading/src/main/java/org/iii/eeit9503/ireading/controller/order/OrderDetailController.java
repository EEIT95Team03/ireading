package org.iii.eeit9503.ireading.controller.order;

import java.util.List;

import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.model.OrderDetailService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = { "/orderdetail.controller" })
public class OrderDetailController {
	
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/delete",method = { RequestMethod.POST },produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String deleteOD(String ProductID,String OrderID) {
		try{
		List<OrderDetailBean> list=orderDetailService.findByID(OrderID, ProductID);
		OrderDetailBean odbean=new OrderDetailBean();
		for(OrderDetailBean bean:list){
			odbean.setOrderID(bean.getOrderID());
			odbean.setProductBean(bean.getProductBean());
			break;
		}
		ProductBean pbean=odbean.getProductBean();
		pbean.setStatusID("S0004");
		int productUpdate=productService.update(pbean);
		
		//商品狀態修改成功
		if(productUpdate==1){
		int delete = orderDetailService.delete(OrderID, ProductID);
		//OD刪除成功
		if(delete==1){
		System.out.println("delete=" + delete + ":" + OrderID + ":" + ProductID);		
		JSONArray jarray=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("change","1");
		jarray.put(obj);
		return jarray.toString();}
		else{
		JSONArray jarray=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("change","0");
		jarray.put(obj);
		return jarray.toString();				
		}
		}
		//商品狀態修改失敗
		else{
			JSONArray jarray=new JSONArray();
			JSONObject obj=new JSONObject();
			obj.put("change","0");
			jarray.put(obj);
			return jarray.toString();
		}}catch (Exception e) {
			// TODO: handle exception
			JSONArray jarray=new JSONArray();
			JSONObject obj=new JSONObject();
			obj.put("change","0");
			jarray.put(obj);
			return jarray.toString();
		}
		
	}

}
