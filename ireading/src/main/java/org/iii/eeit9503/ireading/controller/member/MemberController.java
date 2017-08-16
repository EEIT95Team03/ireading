package org.iii.eeit9503.ireading.controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

	@RequestMapping(method = { RequestMethod.POST })
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
			if(memaction.endsWith("Update")){
				return "member.Update"; 
			}
		}

		// 呼叫Model
		// 依據執行結果呼叫view
		if ("Show".equals(memaction)) {
			List<MemberBean> list = memberService.select(bean);
			model.addAttribute("select", list);
			model.addAttribute("refer", referer);
			return "member.ShowAll";
		}

		else if ("Insert".equals(memaction)) {
			if (!file.isEmpty()) {
				bean.setPhoto(fileUploader.toFileBean(file).getFileBinary());
//				System.out.println(bean.getByteArrayString());
			}
			bean.setMemberID(idGgenerator.getMemberID());
			bean.setAuth(1);
//			System.out.println(idGgenerator.getMemberID());
			
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
	
	@RequestMapping(value="/Show",method = { RequestMethod.GET }, produces = {"application/json; charset=UTF8"})
	@ResponseBody
	public String processShow(MemberBean memberBean, Model model
//			, @RequestParam(name="memaction") String memacton
			){
		List<MemberBean> list = null;
		JSONArray arry = new JSONArray();
//		if("Show".equals(memacton)){
			if(memberBean.getMemberID().trim().length()==0 || memberService.select(memberBean.getMemberID())!=null){
				list = memberService.select(memberBean);
				
				for(int i=0;i<list.size();i++){
					JSONObject obj = new JSONObject();
					obj.put("id", list.get(i).getMemberID());
					obj.put("acount", list.get(i).getAccount());
					obj.put("name", list.get(i).getMName());
					obj.put("nickname", list.get(i).getNickName());
					obj.put("address", list.get(i).getAddr());
					obj.put("cell", list.get(i).getCell());
					obj.put("birthday", list.get(i).getBirthday());
					obj.put("regdate", list.get(i).getRegDate());
					obj.put("gender", list.get(i).getGender());
					obj.put("income", list.get(i).getIncome());
					obj.put("photo", list.get(i).getPhoto());
					obj.put("auth", list.get(i).getAuth());
					list.get(i);
					arry.put(obj);
				}
				model.addAttribute("select", list);
			}
			
//		}
		System.out.println("arry:"+arry.toString());
		return arry.toString();
	}

	// public FileBean toFileBean(CommonsMultipartFile multipartFile) {
	// FileBean fileBean = new FileBean();
	// String[] temp = multipartFile.getOriginalFilename().split("\\.");
	// String fileName = temp[0];
	// String fileExtension = temp[1];
	// long fileLength = multipartFile.getSize();
	// byte[] fileBytes = multipartFile.getBytes();
	//
	// fileBean.setFileName(fileName);
	// fileBean.setFileBinary(fileBytes);
	// fileBean.setFileLengtn(fileLength);
	// fileBean.setFileExtension(fileExtension);
	//
	// return fileBean;
	// }

}
