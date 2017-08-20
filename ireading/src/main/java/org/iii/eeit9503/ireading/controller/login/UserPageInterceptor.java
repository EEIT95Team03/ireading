package org.iii.eeit9503.ireading.controller.login;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserPageInterceptor implements HandlerInterceptor{
@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("---pre---");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("---post---");
		String MemberID=null;
		String Account=null;
		String Name=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
			Account =CookieUtils.findCookie(request, "login_account");
			Name =CookieUtils.findCookie(request, "login_name");
			System.out.println(MemberID+":"+Account+":"+Name);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(Name!=null){
			modelAndView.getModelMap().addAttribute("Name", Name);
		}
		else{modelAndView.getModelMap().addAttribute("Name", Account);}
		
		if(MemberID!=null){			
			MemberBean member=memberService.select(MemberID);
			
			if(member.getByteArrayString()!=null){
				modelAndView.getModelMap().addAttribute("Photo", member.getByteArrayString());
			}
			
		}
		
		
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
