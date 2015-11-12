package com.explore.training.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.explore.training.model.Event;

@Repository("eventDao")
public class EventDaoImpl extends AbstractDao<Integer, Event> implements EventDao {

	@Override
	public Event findEventById(int id) {
		return getByKey(id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Event> findEventsByName(String eventname) {
		Criteria criteria = getSession().createCriteria(Event.class);
		criteria.add(Restrictions.eq("eventname", eventname));
		return (List<Event>) criteria.uniqueResult();	
	}

	@Override
	public void saveEvent(Event event) {
		persist(event);
	}

	@Override
	public void deleteEvent(int eventid) {
		//remoev event from events table.
		Query query = getSession().createSQLQuery("delete from events where id = :id");
		query.setInteger("id", eventid);
		query.executeUpdate();
		
		//update event_registration table to remove event from there as well.
		query = getSession().createSQLQuery("delete from event_registration where eventid = :eventid");
		query.setInteger("eventid", eventid);
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> findAllEvents() {
		Criteria criteria = createEntityCriteria();
		return (List<Event>) criteria.list();
	}

}
