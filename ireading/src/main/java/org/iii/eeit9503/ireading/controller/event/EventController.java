package org.iii.eeit9503.ireading.controller.event;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.iii.eeit9503.ireading.event.model.EventService;
import org.iii.eeit9503.ireading.transfer.DateTansfer;
import org.iii.eeit9503.ireading.transfer.PrimitiveNumberEditor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/event.controller")
public class EventController {

	@InitBinder
	public void initializePropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.sql.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm"), true));

		webDataBinder.registerCustomEditor(int.class, "max", new PrimitiveNumberEditor(Integer.class, true));
	}

	@Autowired
	private EventService eventService;

//	@RequestMapping(method = { RequestMethod.GET})
//	public String method(EventBean bean, BindingResult bindingResult, Model model,
//			@RequestParam(name = "prodaction") String prodaction) {
//		// 接收資料
//		// 轉換資料
//		Map<String, String> errors = new HashMap<String, String>();
//		model.addAttribute("errors", errors);
//
//		if (bindingResult != null && bindingResult.hasErrors()) {
//			if (bindingResult.getFieldError("eventID") != null) {
//				errors.put("eventID", "ID為必填");
//			}
//
//			if (bindingResult.getFieldError("eventDate") != null) {
//				errors.put("eventDate", "EventDate必須是符合YYYY-MM-DD格式的日期");
//
//			}
//
//			if (bindingResult.getFieldError("EventImg") != null) {
//				errors.put("eventImg", "請放入EventImg");
//			}
//
//			if (bindingResult.getFieldError("deadline") != null) {
//				errors.put("deadline", "Deadline必須是符合YYYY-MM-DD格式的日期");
//			}
//
//			if (bindingResult.getFieldError("max") != null) {
//				errors.put("max", "Max為必填");
//			}
//
//			if (prodaction.equals("Insert")) {
//				bean.setEventID(eventService.getLastID());
//			}
//		}
//
//		// 驗證資料
//		if (prodaction != null) {
//			if (prodaction.equals("Insert") || prodaction.equals("Update") || prodaction.equals("Delete")) {
//				if (bean.getEventID().trim().length() == 0 && !errors.containsKey("eventID")) {
//					errors.put("eventID", "請輸入ID以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getEventName().trim().length() == 0 && !errors.containsKey("eventName")) {
//					errors.put("eventName", "請輸入活動名稱以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getEventDate() == null && !errors.containsKey("eventDate")) {
//					errors.put("eventDate", "請輸入日期以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getHost().trim().length() == 0 && !errors.containsKey("host")) {
//					errors.put("host", "請輸入主辦單位以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getEventPhone().trim().length() == 0 && !errors.containsKey("eventPhone")) {
//					errors.put("eventPhone", "請輸入連絡電話以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getEventPlace().trim().length() == 0 && !errors.containsKey("eventPlace")) {
//					errors.put("eventPlace", "請輸入活動地點以便於執行" + prodaction + " (MVC)");
//				}
//
//				if (bean.getDeadline() == null && !errors.containsKey("deadline")) {
//					errors.put("deadline", "請輸入截止日期以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getEventContent().trim().length() == 0 && !errors.containsKey("eventContent")) {
//					errors.put("eventContent", "請輸入活動內容以便於執行" + prodaction + " (MVC)");
//				}
//				if (bean.getMax() == 0 && !errors.containsKey("max")) {
//					errors.put("max", "請輸入人數上限以便於執行" + prodaction + " (MVC)");
//				}
//			}
//		}
//
//		if (errors != null && !errors.isEmpty()) {
//			return "event.update";
//		}
//		
////		 呼叫Model
////		 根據Model執行結果，呼叫View
//		if ("Select".equals(prodaction)) {
//
//			List<EventBean> result = null;
//			
//			result = eventService.select(bean);
//			model.addAttribute("select", result);
//
//			return "event.select";
//
//		}
//
//	}
	
	
	
	@RequestMapping(value="/seeAllEvent",method=RequestMethod.GET)
	public String select(Model model) {
		
     	List<EventBean> result = eventService.select(null);
     	model.addAttribute("select", result);
     	return "event.select";
				
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public String insert(@RequestParam Map<String, Object> dataMap) {
//		String EventID = MapUtils.getString(dataMap, "EventID");
		String EventName = MapUtils.getString(dataMap, "EventName");
		String EventDate = MapUtils.getString(dataMap, "EventDate");
		String Host = MapUtils.getString(dataMap, "Host");
		String EventPhone = MapUtils.getString(dataMap, "EventPhone");
		String EventPlace = MapUtils.getString(dataMap, "EventPlace");
		String EventImg = MapUtils.getString(dataMap, "EventImg");
		String Deadline = MapUtils.getString(dataMap, "Deadline");
		String EventContent = MapUtils.getString(dataMap, "EventContent");
		String Max = MapUtils.getString(dataMap, "Max");
		
		
		EventBean bean = new EventBean();
		bean.setEventID(eventService.getLastID());
//		bean.setEventID(EventID);
		bean.setEventName(EventName);
		bean.setEventDate(DateTansfer.getTimeMin(EventDate));
		bean.setHost(Host);
		bean.setEventPhone(EventPhone);
		bean.setEventPlace(EventPlace);
//		bean.setEventImg(EventImg);
		bean.setDeadline(DateTansfer.getTimeMin(Deadline));
		bean.setEventContent(EventContent);
		bean.setMax(Integer.parseInt(Max));
		
		System.out.println("bean date1:\t" + bean.getEventDate());
		System.out.println("bean date2:\t" + bean.getDeadline());

		boolean insertEvent = eventService.insert(bean);

		if (insertEvent) {
			return "1";
		}
		return "0";
	}


	@RequestMapping(value = "/delete", method = { RequestMethod.POST }, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String delete(String EventID) {
		System.out.println("Controller" + EventID);
		int delete = eventService.delete(EventID);
		// System.out.println("delete="+delete);
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("action", "delete");
		obj.put("eventID", EventID);
		// if(delete){obj.put("change","1");}
		// else{obj.put("change","0");}
		obj.put("change", delete);
		array.put(obj);
		return array.toString();
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String updateEvent(@RequestParam Map<String, Object> params) {
		JSONArray array = new JSONArray();
		JSONObject obj = new JSONObject();
		array.put(obj);
	
		
		String EventID = MapUtils.getString(params, "EventID");
		System.out.println(EventID);
		String EventName = MapUtils.getString(params, "EventName");
        String EventDate = MapUtils.getString(params, "EventDate")+":00";
		String Host = MapUtils.getString(params, "Host");
		String EventPhone = MapUtils.getString(params, "EventPhone");
		String EventPlace = MapUtils.getString(params, "EventPlace");
//		String EventImg = MapUtils.getString(params, "EventImg");
		String Deadline = MapUtils.getString(params, "Deadline")+":00";
		String EventContent = MapUtils.getString(params, "EventContent");
		
		int Max = 0;
		try {
			Max = Integer.parseInt(MapUtils.getString(params, "Max"));
		} catch (Exception e) {
			System.out.println("Int轉型失敗");
			obj.put("error", "資料格式錯誤");
			obj.put("change", "0");
			return array.toString();
		}

		EventBean eventBean = eventService.findByEventID(EventID);
		
		eventBean.setEventName(EventName);
		eventBean.setEventDate(DateTansfer.getTime(EventDate));
		eventBean.setHost(Host);
		eventBean.setEventPhone(EventPhone);
		eventBean.setEventPlace(EventPlace);
//		eventBean.setEventImg(EventImg);
		eventBean.setDeadline(DateTansfer.getTime(Deadline));
		eventBean.setEventContent(EventContent);
		eventBean.setMax(Max);
		

		EventBean updatebean = eventService.update(eventBean);
		if (updatebean != null) {
			obj.put("change", "1");
			return array.toString();
		}
		obj.put("change", "0");
		return array.toString();

	}

}
