package org.iii.eeit9503.ireading.controller;

import org.iii.eeit9503.ireading.event.model.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event2.controller")
public class EventController {
	
	@Autowired
	private EventService eventService;

	@RequestMapping(method={RequestMethod.GET, RequestMethod.POST})
	public String proccess(){
		System.out.println("---------------------");
		
		
		
		return "Event.update";
	}
	
	
}
