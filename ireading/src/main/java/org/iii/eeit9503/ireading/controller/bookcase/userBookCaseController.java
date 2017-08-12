package org.iii.eeit9503.ireading.controller.bookcase;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.model.BCDetailService;
import org.iii.eeit9503.ireading.bookcase.model.BookCaseService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("bookcase")
public class userBookCaseController {
	@Autowired
	private BookCaseService bookCaseService;
	@Autowired
	private BCDetailService bcDetailService;
	
	@RequestMapping(method = { RequestMethod.GET})
	public String findByMemberID(HttpServletRequest request,Model model){		
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		List<BookCaseBean> list= bookCaseService.selectMemberID(MemberID);
		
		model.addAttribute("bookCases",list);
		model.addAttribute("MemberID", MemberID);
		return "user.mybookcase";		
	}
	
	
	@RequestMapping(value="/insert",method=RequestMethod.POST,produces={"application/json"})
	@ResponseBody
	public String insert(@RequestParam Map<String,Object> dataMap){
		// String BCID = MapUtils.getString(dataMap, "BCID");
		String MemberID = MapUtils.getString(dataMap,"MemberID");
		String BCName = MapUtils.getString(dataMap,"BCName");
		int CaseRank = MapUtils.getInteger(dataMap,"caserank");
		int Display = MapUtils.getInteger(dataMap,"display");		
	
		BookCaseBean bean = new BookCaseBean();
		bean.setBCID(bookCaseService.getlastID());
		bean.setMemberID(MemberID);
		bean.setBCName(BCName);
		bean.setCaseRank(CaseRank);
		bean.setDisplay(Display);		
		
		boolean insertBookCase = bookCaseService.insert(bean);
		
		if(insertBookCase) {			
			return "1";	}
		return "0";
	}
	
	
	@RequestMapping(value="/getBCD", method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String getBCD(Model model,@RequestParam Map<String, Object> params){
		String BCID = MapUtils.getString(params, "BCID");
		
		List<BCDetailBean> list=bcDetailService.findbyBCID(BCID);
		
		JSONArray array=new JSONArray();
		for(BCDetailBean bean :list){
			JSONObject obj=new JSONObject(bean);
			array.put(obj);}	
		System.out.println(array.toString());
		return array.toString();
		
	}
	
	
	@RequestMapping(value="/delete",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String delete(String BCID){
		System.out.println("Controller" + BCID);
		int delete=bookCaseService.delete(BCID);
//		System.out.println("delete="+delete);
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("action","delete");
		obj.put("bcid",BCID);
//		if(delete){obj.put("change","1");}
//		else{obj.put("change","0");}
		obj.put("change",delete);
		array.put(obj);
		return array.toString();			
	}
	
	
	@RequestMapping(value="/update", method = RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String updateBC(@RequestParam Map<String, Object> params){
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		array.put(obj);
		String BCID=MapUtils.getString(params, "BCID");
		System.out.println(BCID);
		String BCName=MapUtils.getString(params, "BCName");
		int CaseRank = 0,Display=0;
		try{
		CaseRank=Integer.parseInt(MapUtils.getString(params, "update_caserank"));
		Display=Integer.parseInt(MapUtils.getString(params, "update_display"));
		}catch(Exception e){
			System.out.println("Int轉型失敗");
			obj.put("error","資料格式錯誤");
			obj.put("change","0");
			return array.toString();
		}
		BookCaseBean bcbean=bookCaseService.findByBCID(BCID);
		bcbean.setBCName(BCName);
        bcbean.setCaseRank(CaseRank);
        bcbean.setDisplay(Display);        
        
        BookCaseBean updatebean=bookCaseService.update(bcbean);
		if(updatebean!=null){
			obj.put("change","1");
			return array.toString();
		}					
		obj.put("change","0");
		return array.toString();
         
	}
	
	
	@RequestMapping(value="/deleteBCD",method={RequestMethod.POST},produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String deleteBCD(String ISBN,String BCID){
		System.out.println("Controller" + ISBN);
		int delete=bcDetailService.delete(ISBN,BCID);
//		System.out.println("delete="+delete);
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
//		obj.put("action","delete");
//		obj.put("isbn",ISBN);
//		System.out.println(ISBN);
		obj.put("change",delete);
		array.put(obj);
		return array.toString();			
	}
	
}
