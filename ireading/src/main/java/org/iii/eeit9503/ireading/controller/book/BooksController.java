package org.iii.eeit9503.ireading.controller.book;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.book.model.CategoryService;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.misc.FileUploader;
import org.iii.eeit9503.ireading.transfer.IDGgenerator;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/books.controller")
public class BooksController {
	
	//型別轉換
	@InitBinder
	public void initializePropertyEditor(WebDataBinder webDataBinder) {
		
		//DATE型別轉換(util => sql)
		webDataBinder.registerCustomEditor(java.util.Date.class,
				"pub_Date", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
	@Autowired
	private BooksService booksService;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private FileUploader fileUploader;
	
	
	/**
	 * select
	 * 
	 * @param bean
	 * @param model
	 * @return Books.select
	 */
	@RequestMapping(value="/booksMainPage",method=RequestMethod.GET)
	public String select(BooksBean bean, Model model,@RequestParam(name = "action") String action) {

		List<BooksBean> list=booksService.select(bean);
//		List<Map<String,Object>> dataLs = jdbcTemplate.queryForList("SELECT T1.ISBN,T2.CategoryName,"
//				+ "T1.Title,T1.Cover,T1.Author,T1.Publisher,T1.Language,T1.Pub_Date,"
//				+ "T1.Ori_Price,T1.Abstract,T1.Click,T1.RateAvg,T1.Img FROM Books "
//				+ "T1 INNER JOIN Category T2 ON T1.CategoryID = T2.CategoryID".toString());
		   model.addAttribute("dataLs", list);
		
		return "Books.list";
				
	}
	
	
	/**
	 * select by ISBN and goUpdatePage
	 * 
	 * @param model
	 * @param ISBN
	 * @return String
	 */
	@RequestMapping(value="/goUpdatePage",method=RequestMethod.POST)
	public String goUpdatePage(Model model, @RequestParam Map<String,Object> params) {
//		System.out.println("goUpdatePage:"+params);
		
		String ISBN = MapUtils.getString(params, "ISBN");
		
		BooksBean bean = new BooksBean();
		bean.setISBN(ISBN);
		
		List<BooksBean> responseList = booksService.select(bean);
		model.addAttribute("responseData", responseList.get(0));
		
		System.out.println("responseData:"+ responseList);
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		
		return "Books.update";
	}

	
	/**
	 * Insert & update
	 * 
	 * @param dataMap
	 * @return String
	 */
	@RequestMapping(method={RequestMethod.POST})
//	@RequestMapping(method={RequestMethod.POST,RequestMethod.GET})
	public String method(BooksBean bean, BindingResult bindingResult, Model model,@RequestParam(name="prodaction") String prodaction
			,@RequestParam(value = "cover", required = false) CommonsMultipartFile file) throws IOException {

		//System.out.println("bean:"+bean);
		
//		System.out.println("insert start");
//接收資料
//轉換資料
		Map<String, String> errors = new HashMap<String, String>(); 
		model.addAttribute("errors", errors);


		//Insert
		if(prodaction.equals("Insert")) {
			System.out.println("insert here");
			if (!file.isEmpty()) {
				bean.setCover(fileUploader.toFileBean(file).getFileBinary());
//				System.out.println(bean.getByteArrayString());
			}
			
			System.out.println("controller:" + bean.getISBN() + "\t" + bean.getTitle());
			
			 booksService.insert(bean);
			
			return "Books.Index";
		}
		
		
		//Update
		else if(prodaction!=null && prodaction.equals("Update")) {
 
			
			
			if (!file.isEmpty()) {
				bean.setCover(fileUploader.toFileBean(file).getFileBinary());
//				System.out.println(bean.getByteArrayString());
			}else{
				Object cover=booksService.getCover(bean.getISBN());
				bean.setCover((byte[])cover);				
			}
			
			bean.setClick((int)booksService.getClick(bean.getISBN()));
			bean.setRateAvg((double)booksService.getRateAvg(bean.getISBN()));
			
			BooksBean result = booksService.update(bean);
			if(result==null) {
				errors.put("action", "Update fail");
			} else {
				model.addAttribute("update", result);
			}
			return "Books.Index";
		}else  {
			errors.put("action", "Unknown Action:"+prodaction);
			return "Books.Index";
		}
		
	}
	

	//delete
	@RequestMapping(value="/delete",method={RequestMethod.POST},produces={"application/json"})
	@ResponseBody
	public String delete(String ISBN){
		int delete=booksService.delete(ISBN);
//		System.out.println("delete="+delete);
		JSONArray array=new JSONArray();
		JSONObject obj=new JSONObject();
		obj.put("action","delete");
		obj.put("id",ISBN);
//		if(delete){obj.put("change","1");}
//		else{obj.put("change","0");}
		obj.put("change",delete);
		array.put(obj);
		return array.toString();		
	}
	
	private Date dateFormat(String dateString) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date returnDate = format.parse(dateString);

			return returnDate;
		} catch(Exception e) {
			e.printStackTrace();

		}
		
		return null; 
	}
	
}
