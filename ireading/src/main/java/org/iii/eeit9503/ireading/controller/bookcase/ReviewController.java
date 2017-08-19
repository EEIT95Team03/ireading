package org.iii.eeit9503.ireading.controller.bookcase;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.book.model.ReviewService;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
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
@RequestMapping(path={"review.controller"})
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BooksService booksService;

	
	@RequestMapping(value="select",method={RequestMethod.GET})
	public String ReviewList(Model model){
		System.out.println("----------------");
		List<ReviewBean>list = reviewService.getAll();
		model.addAttribute("review",list);
		return "review.list";
	}
	
	@RequestMapping(value="/{MemberID}",method = { RequestMethod.GET})
	public String findByMemberID(@PathVariable("MemberID") String MemberID, Model model){		
		List<ReviewBean> list= reviewService.findByMemberID(MemberID);		
		model.addAttribute("findByMemberID",list);
		model.addAttribute("MemberID", MemberID);
		System.out.println(MemberID);
		return "reviewM.list";		
	}
	
	@RequestMapping(value="/getReview",method = { RequestMethod.GET})
	public String getMemberIDReview(Model model,HttpServletRequest request){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		List<Map<String, Object>> list= reviewService.getMemberReview(MemberID);
		int index=0;
		for(Map<String, Object> map:list){
			BooksBean book=booksService.findByID((String)map.get("ISBN"));
			list.get(index).put("Cover",book.getByteArrayString());
			list.get(index).put("Title",book.getTitle());
			index++;
		}
		
		model.addAttribute("Reviews",list);
		model.addAttribute("MemberID", MemberID);
		System.out.println(MemberID);
		return "user.review";		
	}
	
	
	@RequestMapping(value="delete",method={RequestMethod.POST},produces={"application/json"})
	@ResponseBody
	public String delete(String ISBN,String MemberID){
		int delete = reviewService.delete(ISBN, MemberID);
		System.out.println("ISBN"+ISBN+"MID"+MemberID);
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
//		obj.put("action", "delete");
//		obj.put("isbn", ISBN);
//		obj.put("memberID",MemberID);
		obj.put("change",delete);
		array.put(obj);	
		AvgRate(ISBN);
		return array.toString();		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST, produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String upCont(@RequestParam Map<String, Object> params){
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		array.put(obj);
		
		String ISBN = MapUtils.getString(params, "ISBN");
		String MemberID = MapUtils.getString(params, "MemberID");
		String cont = MapUtils.getString(params, "Cont");
		int rate = Integer.parseInt(MapUtils.getString(params, "rate"));
		
		
		ReviewBean reviewBean = reviewService.findByMemberIDandISBN(ISBN, MemberID);
		reviewBean.setCont(cont);
		reviewBean.setRate(rate);
		reviewBean.setPostTime(DateTansfer.Now());
		
		int update= reviewService.update(reviewBean);
		if(update!=0){
			AvgRate(ISBN);
			obj.put("change","1");
			return array.toString();
		}	
		else{
		obj.put("change","0");
		return array.toString();//         
	}
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST,produces={"application/json"})
	@ResponseBody
	public String insert(@RequestParam Map<String,Object>dataMap,HttpServletRequest request){
		
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}				
		
		String ISBN = MapUtils.getString(dataMap, "ISBN");
		String Cont = MapUtils.getString(dataMap, "Cont");
		int rate = Integer.parseInt(MapUtils.getString(dataMap, "rate"));
		
		ReviewBean bean = new ReviewBean();
		bean.setISBN(ISBN);
		bean.setMemberID(MemberID);
		bean.setCont(Cont);
		bean.setRate(rate);
		bean.setPostTime(DateTansfer.Now());
		int insertReview = reviewService.insert(bean);
		if(insertReview==1){
			AvgRate(ISBN);
			return "1";}		
		return "0";		
		}
	
	public void AvgRate(String ISBN){
		List<ReviewBean> list=reviewService.findByISBN(ISBN);
		BooksBean bookbean=booksService.findByID(ISBN);
		if(list.size()==0)
		{bookbean.setRateAvg(0.0);		
		}
		else{
			double sumRate=0.0;
			int count=0;
			for(ReviewBean rbean:list){
				sumRate=sumRate+rbean.getRate();
				count++;
			}
			double avgRate=sumRate/count;
			bookbean.setRateAvg(avgRate);			
		}
		booksService.update(bookbean);	
		
	}
	
	

}
