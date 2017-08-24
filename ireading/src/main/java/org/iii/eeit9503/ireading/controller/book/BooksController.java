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
	public String select(BooksBean bean, Model model,@RequestParam Map<String,Object> param) {

		String ISBN = MapUtils.getString(param, "ISBN");
		String Title = MapUtils.getString(param, "Title");
		String CategoryID = MapUtils.getString(param, "CategoryID");
		String Author = MapUtils.getString(param, "Author");
		String Publisher = MapUtils.getString(param, "Publisher");
		String Year = MapUtils.getString(param, "Year");
		if(Year==null){
			Year="";
		}
		
		String sqltext = null;
		
		if(ISBN.trim().length()==0 && Title.trim().length()==0 && CategoryID.trim().length()==0 && Author.trim().length()==0 && Publisher.trim().length()==0 && Year.trim().length()==0){
			sqltext = "select * from books ";
			
		}else{
			sqltext = "select * from books "
					+ "where (Title like '%"+Title+"%' OR Title is null) "
					+ "AND (CategoryID like '%"+CategoryID+"%' OR CategoryID is null)"
					+ "AND (Author like '%"+Author+"%' OR Author is null)"
					+ "AND (Publisher like '%"+Publisher+"%' OR Publisher is null)"
					+ "AND (ISBN like '%"+ISBN+"%' OR ISBN is null) ";

			if(Year.trim().length()!=0){
				sqltext=sqltext+" AND YEAR(Pub_Date) ="+Year+" ";
			}
		}
		

		List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(sqltext.toString());
		int index=0;
		for(Map<String,Object> map:booksdataList)
		{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
		booksdataList.get(index).put("Cover",bbean.getByteArrayString());
		
		Object count=booksService.getSellBookByISBN((String)map.get("ISBN"));		
		booksdataList.get(index).put("Count",count);
		
		index++;
		}
		model.addAttribute("dataLs", booksdataList);
		
		return "manager.Bookslist";
				
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
		
//		System.out.println("responseData:"+ responseList);
		
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
			
			 booksService.insert(bean);
			
			return "manager.Bookslist";
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
			return "manager.Bookslist";
		}else  {
			errors.put("action", "Unknown Action:"+prodaction);
			return "manager.Bookslist";
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
