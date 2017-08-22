package org.iii.eeit9503.ireading.controller.member;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.bean.OutputBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.member.model.OutputService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
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
@RequestMapping("account")
public class userAccountController {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private OutputService outputService;
	@Autowired
	private MemberService memberService;

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
		
		return "user.account";
		}
		
		return "";
	}
	
	@RequestMapping(value="output",method = { RequestMethod.POST},produces="application/json;charsrt=UTF-8")
	@ResponseBody
	public String Output(Model model,@RequestParam Map<String,Object> param,HttpServletRequest request){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
				
		int TotalTransfer =MapUtils.getInteger(param,"TotalTransfer");
		int Amount=MapUtils.getInteger(param,"Amount");
		String BankID=MapUtils.getString(param,"BankID");
		String Account=MapUtils.getString(param,"Account");
		String AccountName=MapUtils.getString(param,"AccountName");
		
		OutputBean output=new OutputBean();
		output.setMemberID(MemberID);
		output.setApplyTime(DateTansfer.Now());
		output.setAccountName(AccountName);
		output.setBankID(BankID);
		output.setBankAccount(Account);
		output.setAmount(Amount);
		output.setTotalTransfer(TotalTransfer);
		
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		
		
		if(outputService.insert(output)==1){
			MemberBean member=memberService.select(MemberID);
			member.setIncome(member.getIncome()-Amount);
			if(memberService.update(member)!=null){
				obj.put("change", "1");
				
			}
			else{
			obj.put("change", "0");}
		}
		else{
			obj.put("change", "0");
		}
		array.put(obj);
		return array.toString();
	}
}
