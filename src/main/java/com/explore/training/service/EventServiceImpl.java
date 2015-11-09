package com.explore.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.explore.training.dao.EventDao;
import com.explore.training.model.Event;

@Service("eventService")
@Transactional
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDao dao;
	
	@Override
	public Event findEventById(int id) {
		return dao.findEventById(id);
	}
	
	@Override
	public List<Event> findEventsByName(String eventname) {
		return dao.findEventsByName(eventname);
	}

	@Override
	public void saveEvent(Event event) {
		dao.saveEvent(event);
		
	}

	@Override
	public void deleteEvent(int eventid) {
		dao.deleteEvent(eventid);
		
	}

	@Override
	public List<Event> findAllEvents() {
		return dao.findAllEvents();
	}

}
