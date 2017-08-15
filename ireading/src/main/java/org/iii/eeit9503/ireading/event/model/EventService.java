package org.iii.eeit9503.ireading.event.model;

import java.util.ArrayList;
import java.util.List;

import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.iii.eeit9503.ireading.event.dao.EventDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventService {
	@Autowired
	private EventDAO eventDAO;

	public List<EventBean> select(EventBean eventBean) {
		List<EventBean> result = null;
		if (eventBean != null && eventBean.getEventID() != "") {
			EventBean temp = eventDAO.select(eventBean.getEventID());
			if (temp != null) {
				result = new ArrayList<EventBean>();
				result.add(temp);
			}
		} else {
			result = eventDAO.select();
		}
		return result;
	}

	public boolean insert(EventBean bean) {
		try {
			eventDAO.insert(bean);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public EventBean update(EventBean eventBean) {
		EventBean result = null;
		if (eventBean != null) {
			result = eventDAO.update(eventBean);
		}
		return result;
	}

	public int delete(String EventID) {
		int result = 0;
		if (EventID != null) {
			result = eventDAO.delete(EventID);
		}
		return result;
	}
	
	public String getLastID() {

		return eventDAO.getLastID();
	}

	public EventBean findByEventID(String EventID) {

		return eventDAO.findByEventID(EventID);
	}

}
