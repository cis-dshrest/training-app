package com.explore.training.controller;


import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.explore.training.model.HelpModule;
import com.explore.training.model.User;
import com.explore.training.service.HelpModuleService;
import com.explore.training.service.UserService;

/**
 * This controller should take care of all the links in the navigation bar
 * for visitors.
 * 
 * @author David S.
 * @since  08/17/2015
 *
 */

@Controller
@RequestMapping("/")
public class UIController {

	@Autowired
	HelpModuleService helpModuleService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MessageSource messageSource;
	


	
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String listHelpMessage(ModelMap model) {

//		List<HelpModule> hmList = helpModuleService.findAllEmployees();
//		model.addAttribute("employees", hmList);
		
//		List<User> userList = userService.findAllUsers();
//		model.addAttribute("users", userList);
	
		return "home";
	}

	
	/** 
	 * Implementation of the help module for all the pages.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = { "/help" }, method = RequestMethod.GET)
	public void newEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");

		HelpModule hm = helpModuleService.findHelpModuleByPageTitle(title);
		
		// Send response back		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(hm.getHelpMessage());
		out.close();

	}
	
	@RequestMapping(value = { "/about" }, method = RequestMethod.GET)
	public String about(ModelMap model) {
		return "about";
	}
	
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, ModelMap model) {
		
		HttpSession session = request.getSession(true);
		if (session != null && session.getAttribute("username") != null) {
			return "redirect:/user/profile";
		}
		
		
		model.addAttribute("errorMsg", "none");
		return "login";
	}
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String newUser(HttpServletRequest request, ModelMap model) {
		
		HttpSession session = request.getSession(true);
		if (session != null && session.getAttribute("username") != null) {
			return "redirect:/user/profile";
		}
		
		User user = new User();
		model.addAttribute("user", user);
		return "register";
	}
	
	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result,
			HttpServletRequest request, ModelMap model) {
		
		HttpSession session = request.getSession(true);
		if (session != null && session.getAttribute("username") != null) {
			return "redirect:/user/profile";
		}
		
		System.out.println("\n\nsaving user: " + user);
		
		if (result.hasErrors()) {
			System.out.println("errors in registering user");
			return "register";
		}
		
		boolean uniqueUser = userService.isUsernameUnique(user.getUsername());
		if(!uniqueUser){
			FieldError duplicateUserError =new FieldError("user","username",messageSource.getMessage("non.unique.username", new String[]{user.getUsername()}, Locale.getDefault()));
		    result.addError(duplicateUserError);
			return "register";
		}
		
		userService.saveUser(user);
		
		return registrationSuccess(model);
	}
	
	@RequestMapping(value = { "/registerSuccess" }, method = RequestMethod.GET)
	public String registrationSuccess(ModelMap model) {
		return "registerSuccess";
	}
	
	@RequestMapping(value = {"/403"}, method = RequestMethod.GET)
	public String accessDenied(ModelMap model) {
		return "403";
	}

}
