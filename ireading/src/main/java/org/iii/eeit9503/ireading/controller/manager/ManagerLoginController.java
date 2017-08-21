package org.iii.eeit9503.ireading.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.LoginService;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = { "login.manager" })
public class ManagerLoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(method = { RequestMethod.POST })
	public String login(@RequestParam Map<String, Object> param,Model model){

		String Account = MapUtils.getString(param, "Account");		
		String Password = MapUtils.getString(param, "Password");
		
		Map<String,String> error = new HashMap();
		
		if(Account==""){
			error.put("account", "請輸入帳號");
		}
		if(Password==""){
			error.put("password", "請輸入帳號");
		}
		
		if(!error.isEmpty()){
			model.addAttribute("error", error);
			return "manager.login";
		}
		
		MemberBean memberBean = loginService.Managerlogin(Account, Password);
		if (memberBean == null) {
			model.addAttribute("InvalidLogin", "帳號密碼不正確");
			return "manager.login";
		} else {
			return "manager.home";
		}

	}
	
}
