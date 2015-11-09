package com.explore.training.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.explore.training.model.HelpModule;

@Repository("helpModuleDao")
public class HelpModuleDaoImpl extends AbstractDao<Integer, HelpModule> implements HelpModuleDao {

	@Override
	public HelpModule findHelpModuleByPageTitle(String pageTitle) {
		Criteria criteria = getSession().createCriteria(HelpModule.class);
		criteria.add(Restrictions.eq("pageTitle", pageTitle));
		return (HelpModule) criteria.uniqueResult();		
	}
	
	@Override
	public void saveHelpModule(HelpModule helpModule) {
		persist(helpModule);	
	}
	
	@Override
	public void deleteHelpModuleByPageTitle(String pageTitle) {
		Query query = getSession().createSQLQuery("delete from helpmessage where title = :title");
		query.setString("title", pageTitle);
		query.executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	public List<HelpModule> findAllHelpModules() {
		Criteria criteria = createEntityCriteria();
		return (List<HelpModule>) criteria.list();
	}

}
