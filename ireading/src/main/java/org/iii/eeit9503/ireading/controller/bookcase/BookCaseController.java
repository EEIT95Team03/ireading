package org.iii.eeit9503.ireading.controller.bookcase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.bookcase.model.BCDetailService;
import org.iii.eeit9503.ireading.bookcase.model.BookCaseService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/bookcase.controller")
public class BookCaseController {
	// @InitBinder
	// public void initializePropertyEditor(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(java.util.Date.class,
	// "BCID", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	// webDataBinder.registerCustomEditor(double.class,
	// "price", new PrimitiveNumberEditor(Double.class, true));
	// webDataBinder.registerCustomEditor(
	// int.class, new PrimitiveNumberEditor(Integer.class, true));
	// }

	@Autowired
	private BookCaseService bookCaseService;
	@Autowired
	private BCDetailService bcDetailService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private BooksService booksService;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String method(BookCaseBean bean, BindingResult bindingResult, Model model,
			@RequestParam(name = "prodaction") String prodaction) {

		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (bindingResult != null && bindingResult.hasErrors()) {
			if (bindingResult.getFieldError("BCID") != null) {

				errors.put("BCID", "BCID必須是BC+8位數字 (mvc)");
			}
			// if (bindingResult.getFieldError("MemberID") != null) {
			// errors.put("MemberID", "MemberID必須是整數 (mvc)");
			//
			// }
			// if (bindingResult.getFieldError("BCName") != null) {
			// errors.put("BCName", "BCName必須是整數 (mvc)");
			//
			// }
			// if (bindingResult.getFieldError("CaseRank") != null) {
			// errors.put("CaseRank", "CaseRank必須是符合YYYY-MM-DD格式的日期 (mvc)");
			//
			// }
			// if (bindingResult.getFieldError("Display") != null) {
			// errors.put("Display", "Expire必須是整數 (mvc)");
			// }
		}
		if (prodaction.equals("Insert")){
			bean.setBCID(bookCaseService.getlastID());
		}
		

		// 驗證資料
		if (prodaction != null) {
			if (prodaction.equals("Insert") || prodaction.equals("Update") || prodaction.equals("Delete")) {
				if (bean.getBCID().trim().length() == 0 && !errors.containsKey("BCID")) {
					errors.put("BCID", "請輸入BCID以便於執行" + prodaction + "(必要欄位)");
					// String str = bean.getBCID().substring(0, 1);
					// if(str=="BC")
					// System.out.println(str);
					// }
				}
				if (bean.getMemberID().trim().length() == 0 && !errors.containsKey("MemberID")) {
					errors.put("memberID", "請輸入MemberID以便於執行" + prodaction + "(必要欄位)");
				}
				if (bean.getBCName().trim().length() == 0 && !errors.containsKey("BCName")) {
					errors.put("BCName", "請輸入BCName以便於執行" + prodaction + "(必要欄位)");
				}
				if (bean.getCaseRank() == 0 && !errors.containsKey("CaseRank")) {
					errors.put("caseRank", "請輸入數字以便於執行" + prodaction + "(必要欄位)");
				}

				// if(bean.getBCID().substring(1, 2)!="BC" &&
				// try {Integer.parseInt( bean.getBCID().substring(3, 9));
				// } catch (NumberFormatException e) { errors.put("BCID",
				// "請輸入BCID以便於執行" + prodaction + "(必要欄位)");
				// }

				if (errors != null && !errors.isEmpty()) {
					return "bookcase.insert";
				}
			}
		}

		// 呼叫Model
		// 根據Model執行結果，呼叫View
		
		
		// select
		if ("Select".equals(prodaction)) {
			List<BookCaseBean> result = bookCaseService.select(bean);
			// "select"對應到Booklist.jsp內的<c:forEach var="bean" items="${select}">
			model.addAttribute("select", result);
			return "bookcaselist.select";
		}

// insert
//		else if (prodaction != null && prodaction.equals("Insert")) {
//			BookCaseBean result = bookCaseService.insert(bean);
//			if (result == null) {
//				errors.put("action", "Insert fail");
//			} else {
//				model.addAttribute("insert", result);
//			}
//			return "bookcase.insert";
//		}
// Update
//		else if (prodaction != null && prodaction.equals("Update")) {
//			BookCaseBean result = bookCaseService.update(bean);
//			if (result == null) {
//				errors.put("action", "Update fail");
//			} else {
//				model.addAttribute("update", result);
//			}
//			return "bookcase.insert";
//		}
// Delete
//		else if (prodaction != null && prodaction.equals("Delete")) {
//			boolean result = bookCaseService.delete(bean);
//			if (!result) {
//				model.addAttribute("delete", 0);
//			} else {
//				model.addAttribute("delete", 1);
//			}
//			return "bookcase.insert";
//		} 
		else {
			errors.put("action", "Unknown Action:" + prodaction);
			return "bookcase.insert";
		}
		

		
	}
	
	@RequestMapping(value="/{MemberID}",method = { RequestMethod.GET})
	public String findByMemberID(@PathVariable("MemberID") String MemberID, Model model){		
		List<BookCaseBean> list= bookCaseService.selectMemberID(MemberID);
		
		model.addAttribute("bookCases",list);
		model.addAttribute("MemberID", MemberID);
		return "bookcaselistM.select";		
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
	
//	@RequestMapping(value="/update", method=RequestMethod.POST)
//	public String update(Model model,@RequestParam Map<String, Object> params){
//		String BCID = MapUtils.getString(params, "BCID");
//		
//		BookCaseBean bean = new BookCaseBean();
//		bean.setBCID(BCID);
//		
//		List<BookCaseBean> responseList = bookCaseService.select(bean);
//		model.addAttribute("responseData", responseList.get(0));
//		
//		JdbcTemplate jdbcTemplate = new JdbcTemplate();
//		
//		return "bookcaselistM.select";
//		
//	}
	
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

	
	
	@RequestMapping(value="/searchBooksList",method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchBooksList(BooksBean bean,Model model , @RequestParam Map<String,Object> param){
//		System.out.println("param:" + param);
		String sgson=null;
		//陣列轉字串                                                             //search = 對應輸入框的name="search"
		String searchName = MapUtils.getString(param, "search");
//		System.out.println("searchName:" + searchName);
		String books =null;
		if(searchName.trim().length()!=0){
			String[] str=searchName.split(" ");
			if(str.length>1){
				 books = "Select * FROM Books Where ";
			for(int i=0;i<str.length;i++){
				if(i==0){books=books+" (Title LIKE '%" + str[i] + "%' or Author LIKE '%" + str[i] + "%') ";}
				else{books=books+" and (Title LIKE '%" + str[i] + "%' or Author LIKE '%" + str[i] + "%') ";}	
			}
			
			}
			else{
				 books = "Select * FROM Books Where Title LIKE '%" + searchName + "%' or Author LIKE '%" + searchName + "%'";	
			}

		List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(books.toString());
		int index=0;
		for(Map<String,Object> map:booksdataList)
		{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
		booksdataList.get(index).put("Cover",bbean.getByteArrayString());		
		index++;
		}
        Gson gson=new Gson();
        sgson=gson.toJson(booksdataList);
        System.out.println(gson.toJson(sgson));
		model.addAttribute("booksdataList", booksdataList);
		model.addAttribute("selectCount", index);
		}
		else{
			books = "Select * FROM Books";

			List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(books.toString());
			int index=0;
			for(Map<String,Object> map:booksdataList)
			{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
			booksdataList.get(index).put("Cover",bbean.getByteArrayString());		
			index++;
			}
//			System.out.println("dataList:" + dataList);
	        Gson gson=new Gson();
	        sgson=gson.toJson(booksdataList);
	        System.out.println(gson.toJson(sgson));
			model.addAttribute("booksdataList", booksdataList);
			model.addAttribute("selectCount", index);
//			List<BooksBean> list = booksService.select(bean);
//			model.addAttribute("dataLs", list);
		}

		return sgson;
		
	}
}
