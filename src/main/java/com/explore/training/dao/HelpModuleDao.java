package com.explore.training.dao;

import java.util.List;

import com.explore.training.model.HelpModule;

public interface HelpModuleDao {

	HelpModule findHelpModuleByPageTitle(String pageTitle);
	
	void saveHelpModule(HelpModule helpModule);
	
	void deleteHelpModuleByPageTitle(String pageTitle);
	
	List<HelpModule> findAllHelpModules();

	
	
}
