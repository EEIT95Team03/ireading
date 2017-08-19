package org.iii.eeit9503.ireading.controller.member;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("account")
public class userAccountController {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping(method=RequestMethod.GET)
	public String getAcountData(Model model,HttpServletRequest request){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		if(MemberID!=null){
		String sql1="Select Income from Member where MemberID='"+MemberID+"' ";
		List<Map<String, Object>> data=jdbcTemplate.queryForList(sql1);
		String Account=String.valueOf(data.get(0).get("Income"));
		
		String sql2="Select * from Output where MemberID='"+MemberID+"' ";
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql2);
		
		model.addAttribute("Account",Account);
		model.addAttribute("OutputList",list);
		
		return "";
		}
		
		return "";
	}
	
}
