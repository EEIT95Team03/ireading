package org.iii.eeit9503.ireading.controller.member;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.model.MemberService;
import org.iii.eeit9503.ireading.misc.FileUploader;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.iii.eeit9503.ireading.transfer.PrimitiveNumberEditor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping(path = { "/member.controller" })
public class MemberController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private MemberService memberService;
	@Autowired
	private IDGgenerator idGgenerator;
	@Autowired
	private FileUploader fileUploader;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(java.sql.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		binder.registerCustomEditor(int.class, new PrimitiveNumberEditor(Integer.class, true));
		binder.registerCustomEditor(double.class, new PrimitiveNumberEditor(Double.class, true));
	}

	@RequestMapping(method = { RequestMethod.POST})
	public String Process(MemberBean bean, Model model, @RequestParam(name = "memaction") String memaction,
			@RequestParam(value = "file", required = false) CommonsMultipartFile file,
			@RequestHeader(value = "referer", required = false) final String referer) throws IOException {
		System.out.println("----------------");
		System.out.println(referer);
		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		// 驗證資料
		if (memaction != null) {
			if (memaction.equals("Update") || memaction.equals("Delete")) {
				if (bean.getMemberID().trim().length() == 0 && !errors.containsKey("id")) {
					errors.put("id", "請輸入Id以便於執行" + memaction);
				}
			}
		}

		if (errors != null && !errors.isEmpty()) {
			if (memaction.endsWith("Update")) {
				return "member.Update";
			}
		}

		// 呼叫Model
		// 依據執行結果呼叫view

		if ("Insert".equals(memaction)) {
			if (!file.isEmpty()) {
				bean.setPhoto(fileUploader.toFileBean(file).getFileBinary());
			}
			bean.setMemberID(idGgenerator.getMemberID());
			bean.setRegDate(new Date(System.currentTimeMillis()));
			JSONArray arry = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("MemberID", bean.getMemberID());
			obj.put("Account", bean.getAccount());
			if(bean.getMName()!=null){
				obj.put("MName", bean.getMName());
			}
			
			//預設為1
			bean.setAuth(1);
			MemberBean memberBean = memberService.insert(bean);
			System.out.println("insert success");
			if (memberBean == null) {
				errors.put("action", "Insert fail");
			} else {
				model.addAttribute("insert", memberBean);
				model.addAttribute("refer", referer);
			}
			return "member.Add";
		}

		else if ("Update".equals(memaction)) {
			if (!file.isEmpty()) {
				bean.setPhoto(fileUploader.toFileBean(file).getFileBinary());
			}
			MemberBean memberBean = memberService.update(bean);
			if (memberBean == null) {
				errors.put("action", "Update fail");
			} else {
				model.addAttribute("update", memberBean);
				model.addAttribute("refer", referer);
			}
			return "member.Update";
		}

		else if ("Delete".equals(memaction)) {
			int n = memberService.delete(bean.getMemberID());
			if (n != 0) {
				model.addAttribute("delete", n);
				model.addAttribute("refer", referer);
			} else {
				model.addAttribute("delete", 0);
				model.addAttribute("refer", referer);
			}
			return "member.Add";
		}

		else {
			model.addAttribute("refer", referer);
			return "member.Add";
		}
	}
	
	@RequestMapping(value="/Insert", method = { RequestMethod.POST} , produces = { "application/json; charset=UTF8"})
	@ResponseBody
	public String processInsert(MemberBean bean, Model model, @RequestParam(value = "file", required = false) CommonsMultipartFile file) {
		
		if (!file.isEmpty()) {
			bean.setPhoto(fileUploader.toFileBean(file).getFileBinary());
		}
		else{
			
		}
		bean.setMemberID(idGgenerator.getMemberID());
		JSONArray arry = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("MemberID", bean.getMemberID());
		obj.put("Account", bean.getAccount());
		if(bean.getMName()!=null){
			obj.put("MName", bean.getMName());
		}
		
		//預設為1
		bean.setAuth(1);
		//設定註冊日期
		bean.setRegDate(new Date(System.currentTimeMillis()));
		
		MemberBean memberBean = memberService.insert(bean);
		System.out.println("insert success");
		if (memberBean == null) {
			
		} else {
		}
		arry.put(obj);
		return arry.toString();
	}
	
	@RequestMapping(value="/Update", method = { RequestMethod.POST} , produces = { "application/json; charset=UTF8"})
	@ResponseBody
	public String processUpdate(MemberBean bean, Model model, @RequestParam(value = "file", required = false) CommonsMultipartFile file) {
		MemberBean tempbean = memberService.select(bean.getMemberID());
		if(bean.getAccount()!=null){
			tempbean.setAccount(bean.getAccount());
		}
		if(bean.getPwd()!=null){
			tempbean.setPwd(bean.getPwd());
		}
		if(bean.getMName()!=null){
			tempbean.setMName(bean.getMName());
		}
		if(bean.getNickName()!=null){
			tempbean.setNickName(bean.getNickName());
		}
		if(bean.getGender()!=0 || bean.getGender()!=1){
			tempbean.setGender(bean.getGender());
		}
		if(bean.getAddr()!=null){
			tempbean.setAddr(bean.getAddr());
		}
		if(bean.getCell()!=null){
			tempbean.setCell(bean.getCell());
		}
		if(bean.getBirthday()!=null){
			tempbean.setBirthday(bean.getBirthday());
		}
		if (!file.isEmpty()) {
			tempbean.setPhoto(fileUploader.toFileBean(file).getFileBinary());
		}
		else{
			bean.setPhoto(tempbean.getPhoto());
		}
		System.out.println(tempbean.getRegDate());
		JSONArray arry = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("MemberID", bean.getMemberID());
		obj.put("Account", bean.getAccount());
		if(bean.getMName()!=null){
			obj.put("MName", bean.getMName());
		}
		
		//預設為1
		bean.setAuth(1);
		
		memberService.update(tempbean);
		System.out.println("update success");
		
		arry.put(obj);
		return arry.toString();
	}

	@RequestMapping(value = "/Show", method = { RequestMethod.POST }, produces = { "application/json; charset=UTF8" })
	@ResponseBody
	public String processShow(MemberBean memberBean, Model model) {
		List<MemberBean> list = null;
		JSONArray arry = new JSONArray();

		if (memberBean.getMemberID().trim().length() == 0 || memberService.select(memberBean.getMemberID()) != null) {
			list = memberService.select(memberBean);

			for (int i = 0; i < list.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("MemberID", list.get(i).getMemberID());
				obj.put("Account", list.get(i).getAccount());
				obj.put("MName", list.get(i).getMName());
				obj.put("NickName", list.get(i).getNickName());
				obj.put("Addr", list.get(i).getAddr());
				obj.put("Cell", list.get(i).getCell());
				obj.put("Birthday", list.get(i).getBirthday());
				obj.put("RegDate", list.get(i).getRegDate());
				obj.put("Gender", list.get(i).getGender());
				obj.put("Income", list.get(i).getIncome());
				obj.put("Photo", list.get(i).getByteArrayString());
				System.out.println(list.get(i).getByteArrayString());
				obj.put("Auth", list.get(i).getAuth());
				list.get(i);
				arry.put(obj);
			}

		}

		System.out.println("arry:" + arry.toString());
		return arry.toString();
	}
	
	@RequestMapping(value = "/ShowRepost", method = { RequestMethod.POST }, produces = { "application/json; charset=UTF8" })
	@ResponseBody
	public String processShowRepost(String memberID, Model model) {
		MemberBean bean = null;
		JSONArray arry = new JSONArray();
		System.out.println(memberID);

		if (memberID.trim().length() == 0 || memberService.select(memberID) != null) {
			bean = memberService.select(memberID);

			JSONObject obj = new JSONObject();
			obj.put("MemberID", bean.getMemberID());
			obj.put("Account", bean.getAccount());
			obj.put("Pwd", bean.getPwd());
			obj.put("MName", bean.getMName());
			obj.put("NickName", bean.getNickName());
			obj.put("Addr", bean.getAddr());
			obj.put("Cell", bean.getCell());
			obj.put("Birthday", bean.getBirthday());
			obj.put("RegDate", bean.getRegDate());
			obj.put("Gender", bean.getGender());
			obj.put("Income", bean.getIncome());
			obj.put("Photo", bean.getByteArrayString());
			System.out.println(bean.getByteArrayString());
			obj.put("Auth", bean.getAuth());
			arry.put(obj);

		}

		System.out.println("arry:" + arry.toString());
		return arry.toString();
	}

	

}
