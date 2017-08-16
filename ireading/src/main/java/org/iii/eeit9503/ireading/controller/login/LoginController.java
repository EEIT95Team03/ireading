package org.iii.eeit9503.ireading.controller.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.LoginService;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(path = { "login.controller" })
public class LoginController {

	public static final String LOGIN_ID = "cookie.login.id";

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private IDGgenerator idGgenerator;

	@RequestMapping(method = { RequestMethod.POST }, produces = { "application/json;charset=utf8" })
	@ResponseBody
	public String Process(MemberBean bean, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestHeader(value = "referer", required = false) final String referer) throws IOException {
		// 接收資料
		// 轉換資料
		// 驗證資料
		// 呼叫Model
		// 依據執行結果呼叫view

		MemberBean memberBean = loginService.login(bean.getAccount(), bean.getPwd());
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		if (memberBean == null) {
			obj.put("InvalidLogin", "帳號密碼不正確");
			array.put(obj);
			return array.toString();
		} else {
			CookieUtils.addCookie(response, "login_id", memberBean.getMemberID());
			CookieUtils.addCookie(response, "login_account", bean.getAccount());
			if(memberBean.getMName()!=null && memberBean.getMName().trim().length()>0){
				CookieUtils.addCookie(response, "login_name", memberBean.getMName());
			}
			model.addAttribute("refer", referer);
			obj.put("LoginSuccess", "帳號密碼正確");
			obj.put("username", memberBean.getMName());
			int index = bean.getAccount().indexOf("@");
			obj.put("useraccount", bean.getAccount().substring(0, index));
			array.put(obj);
			return array.toString();
		}

	}
	
	@RequestMapping(value="/accountCheck" ,method = { RequestMethod.POST }, produces = { "application/json;charset=utf8" })
	@ResponseBody
	public String AccountCheck(MemberBean bean, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name="Raccount") String account,
			@RequestHeader(value = "referer", required = false) final String referer) throws IOException {
		
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();

		MemberBean checkAccount = memberService.selectByAccount(account);
		if(checkAccount!=null){
			obj.put("AccountCheck", "帳號已註冊");
			array.put(obj);
			return array.toString();
		}
		else{
			obj.put("AccountCheck", "帳號可註冊");
			array.put(obj);
			return array.toString();
		}
	}
	
	
	@RequestMapping(value="/reg" ,method = { RequestMethod.POST }, produces = { "application/json;charset=utf8" })
	@ResponseBody
	public String Register(MemberBean bean, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name="Raccount") String account, @RequestParam(name="Rpwd") String pwd,
			@RequestHeader(value = "referer", required = false) final String referer) throws IOException {
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		
		// 接收資料
		// 轉換資料
		// 驗證資料
		// 呼叫Model
		// 依據執行結果呼叫view
		bean.setMemberID(idGgenerator.getMemberID());
		bean.setAccount(account);
		bean.setPwd(pwd);
		bean.setAuth(1);
		
		MemberBean memberBean = memberService.insert(bean);
		
		if(memberBean == null){
			obj.put("RegMsg", "註冊失敗");
			array.put(obj);
			return array.toString();
		}
		else {
			CookieUtils.addCookie(response, "login_id", memberBean.getMemberID());
			CookieUtils.addCookie(response, "login_account", account);
			model.addAttribute("refer", referer);
			obj.put("RegMsg", "註冊成功");
			int index = account.indexOf("@");
			obj.put("useraccount", bean.getAccount().substring(0, index));
			array.put(obj);
			return array.toString();
		}
		
		
		
		


	}

}
