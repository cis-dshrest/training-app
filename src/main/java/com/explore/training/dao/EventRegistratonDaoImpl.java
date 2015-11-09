package com.explore.training.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.explore.training.model.EventRegistration;

@Repository("eventRegistrationDao")
public class EventRegistratonDaoImpl extends AbstractDao<Integer, EventRegistration> implements EventRegistrationDao {

	@Override
	public EventRegistration findEventRegistrationById(int id) {
		return getByKey(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EventRegistration> findEventRegistrationByUsername(String username) {
		Criteria criteria = getSession().createCriteria(EventRegistration.class);
		criteria.add(Restrictions.eq("username", username));
		return criteria.list();	
	}

	@Override
	public void saveEventRegistration(EventRegistration eventRegistration) {
		persist(eventRegistration);
		
	}

	@Override
	public void deleteEventRegistration(int eventid, String username) {
		Query query = getSession().createSQLQuery("delete from event_registration where username = :username and eventid = :eventid");
		query.setInteger("eventid", eventid);
		query.setString("username", username);
		query.executeUpdate();
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<EventRegistration> findAllEventRegistration() {
		Criteria criteria = createEntityCriteria();
		return (List<EventRegistration>) criteria.list();
	}

}
