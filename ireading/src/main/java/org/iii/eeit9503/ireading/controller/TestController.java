package org.iii.eeit9503.ireading.controller;

import java.util.List;

import org.iii.eeit9503.ireading.member.model.OutputService;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.model.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path={"/test.controller"})
public class TestController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method={RequestMethod.GET,RequestMethod.POST})
	public String Process(Model model){
			System.out.println("--------------");
			List<OrderBean> list=orderService.getAll();
			for(OrderBean bean:list){
				System.out.println(bean.getOrderID());
			}
			
			return "index.Internal";

		}

}
