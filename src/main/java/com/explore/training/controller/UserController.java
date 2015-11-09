package com.explore.training.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.CannotCreateTransactionException;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.explore.training.model.User;
import com.explore.training.service.UserService;
import com.explore.training.service.UserService.AuthCode;


/**
 * This controller should take care of all the endpoints for registered users.
 * 
 * @author David S.
 * @since  08/17/2015
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	public static boolean isLoggedIn(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("username") == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	@RequestMapping(value = { ""}, method = RequestMethod.GET)
	public String urlUser() {
		return "redirect:/user/profile";
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String executeLogin(HttpServletRequest request, HttpServletResponse response,
			ModelMap model, HttpSession session) throws Exception {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		
		// Authenticate
		AuthCode authCode = userService.login(username, password);

		if (authCode == AuthCode.USER) {
			session.setAttribute("username",  username);
			session.setAttribute("role", "user");
			return getUserProfile(model, session);
		}
		else if(authCode == AuthCode.ADMIN) {
			session.setAttribute("username", username);
			session.setAttribute("role", "admin");
			
			return getUserProfile(model, session);
		}
		
		else if (authCode == AuthCode.FAIL) {
			model.addAttribute("errorMsg", "block");
			model.addAttribute("errorLogin", "The username and password you entered do not match.");
		}
		return "login";

	}
	
	@ExceptionHandler(CannotCreateTransactionException.class)
	public ModelMap handleTransactionException() {
		ModelMap model = new ModelMap("403");
		model.addAttribute("errorMsg", "The database service is down at the moment. Please contact the admin to enable the service.");
		return model;
	}
	
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		return "redirect:/home";
	}
	
	@RequestMapping(value = { "/profile" }, method = RequestMethod.GET)
	public String getUserProfile(ModelMap model, HttpSession session) {
		
		//Get username from current session saved during login.
		String username = (String) session.getAttribute("username");
		
		User user = userService.findByUsername(username);
		String realName = user.getFirstName() + " " + user.getLastName();		
		model.addAttribute("realName", realName);
		model.addAttribute("user", user);
		return "profile";
	}
	
	@RequestMapping(value = { "/modify" }, method = RequestMethod.POST)
	public String modify(@Valid User user, BindingResult result,
			ModelMap model) {
		userService.updateUser(user);
		return "modifySuccess";
	}
	
	@RequestMapping(value = {"/listusers" }, method = RequestMethod.GET)
	public String editUsers(ModelMap model, HttpSession session) {
		String role = (String) session.getAttribute("role");
		
		if (role.equalsIgnoreCase("ADMIN")) {
			return "listUsers";
		}
		
		return "redirect:/403";
	}
	
	@RequestMapping(value = {"/resetaccount" }, method = RequestMethod.GET)
	public String resetAccount(ModelMap model) {
		return "resetAccount";
	}
		
	
}
