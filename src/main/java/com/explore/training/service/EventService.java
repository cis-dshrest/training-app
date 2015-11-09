package com.explore.training.service;

import java.util.List;

import com.explore.training.model.Event;

public interface EventService {

	Event findEventById(int id);
	
	List<Event> findEventsByName(String username);

	void saveEvent(Event event);
	
	void deleteEvent(int eventid);
	
	List<Event> findAllEvents();
}
