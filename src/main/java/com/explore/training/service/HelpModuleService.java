package com.explore.training.service;

import java.util.List;

import com.explore.training.model.HelpModule;

public interface HelpModuleService {
	
	HelpModule findHelpModuleByPageTitle(String pageTitle);
	
	void saveHelpModule(HelpModule helpModule);
	
	void updateHelpModule(HelpModule employee);
	
	void deleteHelpModuleByPageTitle(String pageTitle);

	List<HelpModule> findAllEmployees(); 

	boolean isHelpModuleUnique(String pageTitle);
	
}
