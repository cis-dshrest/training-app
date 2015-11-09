package com.explore.training.dao;

import java.util.List;

import com.explore.training.model.Event;

public interface EventDao {
	
	Event findEventById(int id);
	
	List<Event> findEventsByName(String username);

	void saveEvent(Event event);
	
	void deleteEvent(int eventid);
	
	List<Event> findAllEvents();

}