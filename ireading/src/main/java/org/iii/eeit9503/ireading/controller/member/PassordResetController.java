package org.iii.eeit9503.ireading.controller.member;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/resetPwd.controller")
public class PassordResetController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(method=RequestMethod.POST,produces = { "application/json;charset=utf8" })
	@ResponseBody
	public String process(@RequestParam(name="recipient") String address,
			@RequestHeader(value = "referer", required = false) final String referer
			, HttpServletRequest request){
				
		String subject = "享。閱-密碼重設通知信";
		String message=null;
		try {
			message = "親愛的享閱會員您好\n\n\t請按下列連結重設您的密碼\n\n\t" + new URL("http://" + request.getServerName() + ":8080" + request.getContextPath()
			+ "/user/resetPwd.controller/urlReset?account=" + address)   
					+ "\n\n\t\t\t\t享。閱團隊 祝 日安";
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}
		
		// prints debug info
        System.out.println("To: " + address);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
		
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(address);
        email.setSubject(subject);
        email.setText(message);
         
        JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
        
        try {
        	obj.put("mailResult", "success");
			mailSender.send(email);
		} catch (MailException e) {
			obj.put("mailResult", "failed");
			e.printStackTrace();
		}
        
        array.put(obj);
        return array.toString();
        
	}
	
	@RequestMapping(value="/urlReset",method=RequestMethod.GET)
	public String processReset(Model model, @RequestParam(name="account") String account){
		MemberBean bean = memberService.selectByAccount(account);
		String page = null;
		if(bean!=null){
			model.addAttribute("account", account);
			page = "pwdResetPage"; 
		}
		return page;
	}
	
	@RequestMapping(value="/pwdReset",method=RequestMethod.POST)
	public String processResetPwd(@RequestParam(name="pwd") String pwd, @RequestParam(name="account") String account
			, @RequestParam(name="confirmpwd", required=false) String confirmpwd
			, HttpServletResponse response){
		MemberBean bean = memberService.selectByAccount(account);
		if(bean!=null){
			bean.setPwd(pwd);
			memberService.update(bean);
			try {
				CookieUtils.addCookie(response, "login_id", bean.getMemberID());
				CookieUtils.addCookie(response, "login_account",account);
				if(bean.getMName()!=null && bean.getMName().trim().length()>0){
					CookieUtils.addCookie(response, "login_name", bean.getMName());
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "reset.Redirect";
	}
	

}
