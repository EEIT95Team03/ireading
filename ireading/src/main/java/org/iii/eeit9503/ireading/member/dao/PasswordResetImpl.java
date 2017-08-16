package org.iii.eeit9503.ireading.member.dao;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;


public class PasswordResetImpl implements PasswordReset {

	@Autowired
	private MemberService memberService;
	
	private MailSender mailSender;
    private SimpleMailMessage Message;
	
    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setTemplateMessage(SimpleMailMessage Message) {
        this.Message = Message;
    }
	
	@Override
	public void passwordSet(MemberBean memberbean) {
		MemberBean bean =  memberService.selectByAccount(memberbean.getAccount());
		SimpleMailMessage msg = new SimpleMailMessage(this.Message);
		msg.setTo(memberbean.getAccount());
		String resetPwd = "aszx";
		bean.setPwd(resetPwd);
		msg.setText("重設密碼：" + resetPwd);
		System.out.println(bean.getMemberID() + "\t" + bean.getAccount() + "\t" + bean.getPwd());
		
		memberService.update(bean);
		
		try {
			this.mailSender.send(msg);
		} catch (MailException e) {
			e.printStackTrace();
		}
		
	}

}
