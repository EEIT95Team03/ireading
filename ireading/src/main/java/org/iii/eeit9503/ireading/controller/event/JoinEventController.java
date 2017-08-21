package org.iii.eeit9503.ireading.controller.event;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.iii.eeit9503.ireading.event.bean.JoinListBean;
import org.iii.eeit9503.ireading.event.model.EventService;
import org.iii.eeit9503.ireading.event.model.JoinListService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/joinevent.controller")
public class JoinEventController {

	// @InitBinder
	// public void initializePropertyEditor(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(java.sql.Date.class,
	// new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true));
	//
	// webDataBinder.registerCustomEditor(int.class, "max", new
	// PrimitiveNumberEditor(Integer.class, true));
	// }

	@Autowired
	private EventService eventService;
	
	@Autowired
	private JoinListService joinListService;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/joinEventList", method = RequestMethod.GET)
	public String eventlist(Model model) {

		// List<EventBean> list = eventService.select(null);
		// model.addAttribute("joinlist", list);

		// 日期排序取第一筆(第一排)
		List<Map<String, Object>> row1 = jdbcTemplate.queryForList("SELECT TOP 1  * FROM Event order by Deadline DESC");
		Timestamp temp = (Timestamp) row1.get(0).get("EventDate");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(temp.getTime());
		int year = cal.get(Calendar.YEAR);
		int monthtemp = cal.get(Calendar.MONTH);
		String month = setMonth(monthtemp+1);
		int day = cal.get(Calendar.DATE);
		
		String txt = (String)row1.get(0).get("EventContent");
//		System.out.println(txt+"\n");
		row1.get(0).put("EventContentSub", (txt.substring(0, 10) + "..."));
		

//		if (row1.get(0).get("EventImg") != null) {
//			String imgout = Base64.getEncoder().encodeToString((byte[]) row1.get(0).get("EventImg"));
//			row1.get(0).put("image", imgout);
//		}

//		System.out.println("Month:\t" + year + "\t" + month + "\t" + day);
		// List<EventBean> row1=eventService.EventWall(0, 1);
		row1.get(0).put("day", day);
		row1.get(0).put("month", month);

//		System.out.println("Block1------------");

		model.addAttribute("row1", row1);

//		System.out.println("row1:" + row1);

		// 日期排序取第2~4筆(第2排) //跳過1筆取3筆
		List<Map<String, Object>> row2 = jdbcTemplate
				.queryForList("SELECT * FROM Event order by Deadline DESC OFFSET 1 ROWS FETCH next 3 rows only");
		for (int i = 0; i <= 2; i++) {
			Timestamp temp1 = (Timestamp) row2.get(i).get("EventDate");
			Calendar cal1 = Calendar.getInstance();
			cal1.setTimeInMillis(temp1.getTime());
			int year1 = cal1.get(Calendar.YEAR);
			int monthtemp1 = cal1.get(Calendar.MONTH);
			String month1 = setMonth(monthtemp1+1);
			int day1 = cal1.get(Calendar.DATE);
			
			String txt1 = (String)row2.get(i).get("EventContent");
//			System.out.println(txt1+"\n");
			row2.get(i).put("EventContentSub",(txt1.substring(0, 10) + "..."));

//			if ((byte[]) row2.get(i).get("EventImg") != null) {
//				String imgout1 = Base64.getEncoder().encodeToString((byte[]) row2.get(i).get("EventImg"));
//				row2.get(i).put("image", imgout1);
//			}

//			System.out.println("Month:\t" + year1 + "\t" + month1 + "\t" + day1);
			// List<EventBean> row1=eventService.EventWall(0, 1);
			row2.get(i).put("day", day1);
			row2.get(i).put("month", month1);

		}

//		System.out.println("Block2------------");

		model.addAttribute("row2", row2);

		// 日期排序取第5~6筆(第3排) //跳過7筆取2筆
		List<Map<String, Object>> row3 = jdbcTemplate
				.queryForList("SELECT * FROM Event order by Deadline DESC OFFSET 4 ROWS FETCH next 2 rows only");

		for (int i = 0; i <= 1; i++) {
			Timestamp temp2 = (Timestamp) row3.get(i).get("EventDate");
			Calendar cal2 = Calendar.getInstance();
			cal2.setTimeInMillis(temp2.getTime());
			int year2 = cal2.get(Calendar.YEAR);
			int monthtemp2 = cal2.get(Calendar.MONTH);
			String month2 = setMonth(monthtemp2+1);
			int day2 = cal2.get(Calendar.DATE);
			
			String txt2 = (String)row3.get(i).get("EventContent");
//			System.out.println(txt2+"\n");
			row3.get(i).put("EventContentSub", (txt2.substring(0, 10) + "..."));

//			if (row3.get(i).get("EventImg") != null) {
//				String imgout2 = Base64.getEncoder().encodeToString((byte[]) row3.get(i).get("EventImg"));
//				row3.get(i).put("image", imgout2);
//			}

//			System.out.println("Month:\t" + year2 + "\t" + month2 + "\t" + day2);
			// List<EventBean> row1=eventService.EventWall(0, 1);
			row3.get(i).put("day", day2);
			row3.get(i).put("month", month2);

		}
//		System.out.println("Block3------------");

		model.addAttribute("row3", row3);

		// 日期排序取第7~9筆(第4排) //跳過6筆取3筆
		List<Map<String, Object>> row4 = jdbcTemplate
				.queryForList("SELECT * FROM Event order by Deadline DESC OFFSET 6 ROWS FETCH next 3 rows only");

		for (int i = 0; i <= 2; i++) {
			Timestamp temp3 = (Timestamp) row4.get(i).get("EventDate");
			// System.out.println(temp);
			Calendar cal3 = Calendar.getInstance();
			cal3.setTimeInMillis(temp3.getTime());
			int year3 = cal3.get(Calendar.YEAR);
			int monthtemp3 = cal3.get(Calendar.MONTH);
			String month3 = setMonth(monthtemp3+1);
			int day3 = cal3.get(Calendar.DATE);

			String txt3 = (String)row4.get(i).get("EventContent");
//			System.out.println(txt3+"\n");
			row4.get(i).put("EventContentSub", (txt3.substring(0, 10) + "..."));
			
//			if (row4.get(i).get("EventImg") != null) {
//				String imgout3 = Base64.getEncoder().encodeToString((byte[]) row4.get(i).get("EventImg"));
//				row4.get(i).put("image", imgout3);
//			}

//			System.out.println("Month:\t" + year3 + "\t" + month3 + "\t" + day3);
			// List<EventBean> row1=eventService.EventWall(0, 1);
			row4.get(i).put("day", day3);
			row4.get(i).put("month", month3);

		}

//		System.out.println("Block4------------");

		model.addAttribute("row4", row4);

		return "event.Wall";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "application/json;charset=utf8")
	@ResponseBody
	public String ProcessInsert(Model model,@RequestParam Map<String,Object> param,HttpServletRequest request){
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		
		
		String EventID=MapUtils.getString(param, "EventID");
		
		
		JSONArray arry = new JSONArray();
		JSONObject obj = new JSONObject();
		if(EventID!=null || MemberID!=null){
			JoinListBean jbean=new JoinListBean();
			jbean.setEventID(EventID);
			jbean.setMemberID(MemberID);
			if(joinListService.insert(jbean)==1){
			obj.put("insertResult", "success");
			System.out.println("insert success");}
			else{
				obj.put("insertResult", "failed");
				System.out.println("insert failed");
			}
		}
		else{
			obj.put("insertResult", "failed");
			System.out.println("insert failed");
		}
		arry.put(obj);
//		System.out.println("array:"+arry.toString());
		return arry.toString();
	}
	
	@RequestMapping(value = "/myEventList", method = RequestMethod.GET)
	public String select(JoinListBean bean, Model model,HttpServletRequest request) {

		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}
		
		String sqltxt ="SELECT * FROM Event e INNER JOIN JoinList j ON e.EventID = j.EventID where j.MemberID = '"+MemberID+"' ";

		List<Map<String,Object>> myjoinlist = jdbcTemplate.queryForList(sqltxt.toString());
		
		model.addAttribute("myjoinlist", myjoinlist);
		System.out.println("myjoinlist:"+myjoinlist);
		
		return "event.myeventlist";
				
	}
	
	@RequestMapping(value = "/delete", method = { RequestMethod.POST }, produces={"application/json;charset=utf8"})
	@ResponseBody
	public String delete(String EventID,String MemberID) {
//		System.out.println("Controller" + EventID);
		int delete = joinListService.delete(EventID, MemberID);
		// System.out.println("delete="+delete);
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("action", "delete");
		obj.put("EventID", EventID);
		obj.put("MemberID", MemberID);
//		 if(delete){obj.put("change","1");}
//		 else{obj.put("change","0");}
		obj.put("change", delete);
		array.put(obj);
		return array.toString();

	}
	

	public String setMonth(int month) {
		String out = null;
		switch (month) {
		case 1:
			out = "JAN";
			break;
		case 2:
			out = "FEB";
			break;
		case 3:
			out = "MAR";
			break;
		case 4:
			out = "APR";
			break;
		case 5:
			out = "MAY";
			break;
		case 6:
			out = "JUN";
			break;
		case 7:
			out = "JUL";
			break;
		case 8:
			out = "AUG";
			break;
		case 9:
			out = "SEP";
			break;
		case 10:
			out = "OCT";
			break;
		case 11:
			out = "NOV";
			break;
		case 12:
			out = "DEC";
			break;
		default:
			break;
		}

		return out;
	}

}
