package com.explore.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.explore.training.dao.EventRegistrationDao;
import com.explore.training.model.EventRegistration;

@Service("eventRegistrationService")
@Transactional
public class EventRegistrationServiceImpl implements EventRegistrationService {

	@Autowired
	private EventRegistrationDao dao;
	@Override
	public EventRegistration findEventRegistrationById(int id) {
		return dao.findEventRegistrationById(id);
	}


	@Override
	public void saveEventRegistration(EventRegistration eventRegistration) {
		dao.saveEventRegistration(eventRegistration);
	}

	@Override
	public void deleteEventRegistration(int eventid, String username) {
		dao.deleteEventRegistration(eventid, username);
		
	}
	
	@Override
	public List<EventRegistration> findAllEventRegistration() {
		return dao.findAllEventRegistration();
	}


	@Override
	public List<EventRegistration> findEventRegistrationByUsername(String username) {
		return dao.findEventRegistrationByUsername(username);
	}

}
