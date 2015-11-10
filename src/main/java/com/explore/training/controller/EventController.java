package com.explore.training.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.explore.training.model.Event;
import com.explore.training.model.EventRegistration;
import com.explore.training.model.User;
import com.explore.training.service.EventRegistrationService;
import com.explore.training.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	EventService eventService;
	
	@Autowired
	EventRegistrationService eventRegistrationService;
	  
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	public String getEventInfo(HttpServletRequest request, 
	        HttpServletResponse response, HttpSession session, ModelMap model) {
		
		if (UserController.isLoggedIn(request, response) == false) {
			return "redirect:/403";
		}
		
		String username = (String) session.getAttribute("username");
		
		List<EventRegistration> eventRegistrationList = eventRegistrationService.findEventRegistrationByUsername(username);
		List<Event> eventList = eventService.findAllEvents();
		
		List<Event> registeredEvents = new ArrayList<Event>();
		
		//get event objects that the user has registered for
		for(int i = 0; i < eventRegistrationList.size(); i++) {
			int eventId = eventRegistrationList.get(i).getEventId();
			registeredEvents.add(eventService.findEventById(eventId));			
		}
		
		System.out.println("registered for#: " + registeredEvents.size());
		for(int i = 0; i < registeredEvents.size(); i++) {
			cleanupEvents(eventList, registeredEvents.get(i));
		}
		System.out.println("after removal for#: " + registeredEvents.size());
		if (eventList.size() > 0) {
			model.addAttribute("events", eventList);
		}
		
		return "eventRegistration";
		
	}
	
	public void cleanupEvents(List<Event> eventList, Event e) {
		for(int i =0; i < eventList.size(); i++) {
			if (eventList.get(i).getId() == e.getId()) {
				eventList.remove(i);
			}
		}
	}
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.POST)
	public String registerForEvent(HttpServletRequest request, 
	        HttpServletResponse response, HttpSession sess,ModelMap model) {
		
		String username = (String) sess.getAttribute("username");

		String[] events = request.getParameterValues("registerCheck");
		
		if (events != null) {
			for(String event : events) {
				EventRegistration ev = new EventRegistration();
				ev.setId(0);
				ev.setEventId(Integer.parseInt(event));
				ev.setUsername(username);
				eventRegistrationService.saveEventRegistration(ev);
				
			}
		}
		
		return "redirect:/event/list";
	}
	
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String listOfRegisteredEvents(HttpServletRequest request, 
	        HttpServletResponse response, HttpSession session,ModelMap model) {
		
		if (UserController.isLoggedIn(request, response) == false) {
			return "redirect:/403";
		}
		
		String username = (String) session.getAttribute("username");
		
		List<EventRegistration> eventRegistrationList = eventRegistrationService.findEventRegistrationByUsername(username);
		
		List<Event> registeredEvents = new ArrayList<Event>();
		
		for(int i = 0; i < eventRegistrationList.size(); i++) {
			int eventId = eventRegistrationList.get(i).getEventId();
			registeredEvents.add(eventService.findEventById(eventId));			
		}
		
		model.addAttribute("eventRegistrations", registeredEvents);
		return "eventRegistrationList";
		
	}

	
	@RequestMapping(value = { "/unregister-{eventid}" }, method = RequestMethod.GET)
	public String removeFromRegistration(@PathVariable String eventid, HttpServletRequest request, 
	        HttpServletResponse response, HttpSession session, ModelMap model) {
		
		if (UserController.isLoggedIn(request, response) == false) {
			return "redirect:/403";
		}
		
		String username = (String) session.getAttribute("username");
		
		eventRegistrationService.deleteEventRegistration(Integer.parseInt(eventid), username);
		
		return listOfRegisteredEvents(request, response, session, model);
	}
	
	@RequestMapping(value = { "/new" }, method = RequestMethod.GET)
	public String getCreateEvent(HttpServletRequest request, 
	        HttpServletResponse response, ModelMap model) {
		
		if (UserController.isLoggedIn(request, response) == false) {
			return "redirect:/403";
		}
		
		Event e = new Event();
		model.addAttribute("event", e);
		return "createEvent";
	}
	

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 dateFormat.setLenient(false);
		 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	
	@RequestMapping(value = {"/new" }, method = RequestMethod.POST)
	public String submitCreateEvent(@Valid Event event, BindingResult result, ModelMap model) {
	
		if (result.hasErrors()) {
			System.out.println("errors in creating event.");
			return "createEvent";
		}
		
		eventService.saveEvent(event);
		
		return "eventCreateSuccess";
	}
	
	@RequestMapping(value = {"/edit" }, method = RequestMethod.GET)
	public String getEventsForEdit(HttpSession session, ModelMap model) {
		
		String role = (String) session.getAttribute("role");
		
		// List users if the role is admin, otherwise redirect other users.
		if(role.equalsIgnoreCase("admin")) {
			
			List<Event> eventList = eventService.findAllEvents();
			model.addAttribute("events", eventList);
			return "listEvents";
		}
		else {
			return "redirect:/403";
		}

	}
	
	@RequestMapping(value = {"/delete-{eventid}" }, method = RequestMethod.GET)
	public String deleteEventAdmin(@PathVariable String eventid, HttpSession session, ModelMap model) {
		
		String role = (String) session.getAttribute("role");
		
		// Only if the role is admin, otherwise redirect other users.
		if(role.equalsIgnoreCase("admin")) {
			
			//delete event
			eventService.deleteEvent(Integer.parseInt(eventid));
			
		}
		else {
			return "redirect:/403";
		}
		
		return getEventsForEdit(session,model);
	}
	
//	//TODO
	@RequestMapping(value = {"/edit-{eventid}" }, method = RequestMethod.GET)
	public String editEventAdmin(@PathVariable String eventid, HttpSession session, ModelMap model) {
		
		String role = (String) session.getAttribute("role");
		
		// Only if the role is admin, otherwise redirect other users.
		if(role.equalsIgnoreCase("admin")) {
			
			Event event = eventService.findEventById((Integer.parseInt(eventid)));
			
			model.addAttribute("event", event);		
			return "edituser";
			
		}
		else {
			return "redirect:/403";
		}
	}
}
