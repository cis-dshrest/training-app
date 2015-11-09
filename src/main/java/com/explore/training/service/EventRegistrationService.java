package com.explore.training.service;

import java.util.List;

import com.explore.training.model.EventRegistration;

public interface EventRegistrationService {
	EventRegistration findEventRegistrationById(int id);
	
	List<EventRegistration> findEventRegistrationByUsername(String username);

	void saveEventRegistration(EventRegistration eventRegistration);
	
	void deleteEventRegistration(int eventid, String username);
	
	List<EventRegistration> findAllEventRegistration();
}
