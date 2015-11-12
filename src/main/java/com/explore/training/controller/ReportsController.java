package com.explore.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.explore.training.model.User;
import com.explore.training.service.UserService;

@Controller
@RequestMapping("/reports")
public class ReportsController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = {""}, method = RequestMethod.GET)
	public String listReports(ModelMap model) {
		
		model.addAttribute("display", "none");
		return "reports";
	}
	
	/**
	 * Show the list of users in the report along with their preferences
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/listUsers"}, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		
		List<User> userList = userService.findAllUsers();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<table class='table'>" +
	        "<tr>\n" +
	          "  <td>First Name</td>\n" +
	          "  <td>Last Name</td>\n" +
	          "  <td>Username</td>\n" +
	          "  <td>Role</td>\n" +
	          "  <td>Active?</td>\n" +
	        "</tr>\n"
	    );
		
		for (User u : userList) {
			sb.append("<tr>\n");
			sb.append("  <td>" + u.getFirstName() + "</td>\n");
			sb.append("  <td>" + u.getLastName() + "</td>\n");
			sb.append("  <td>" + u.getUsername() + "</td>\n");
			sb.append("  <td>" + u.getRole() + "</td>\n");
			sb.append("  <td>" + u.getIsActive() + "</td>\n");
			sb.append("</tr>\n");
		}
		sb.append("</table>");
		
		model.addAttribute("title", "List of Registered Users");
		model.addAttribute("report", sb.toString());
		
		//show the div
		model.addAttribute("display", "block");
		return "reports";
	}
	
	@RequestMapping(value = {"/listAdmins"}, method = RequestMethod.GET)
	public String listAdmins(ModelMap model) {
		
		List<User> userList = userService.findAllUsers();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<table class='table'>" +
	        "<tr>\n" +
	          "  <td>First Name</td>\n" +
	          "  <td>Last Name</td>\n" +
	          "  <td>Username</td>\n" +
	          "  <td>Role</td>\n" +
	          "  <td>Active?</td>\n" +
	        "</tr>\n"
	    );
		
		for (User u : userList) {
			if (u.getRole().equals("ADMIN")) {
				sb.append("<tr>\n");
				sb.append("  <td>" + u.getFirstName() + "</td>\n");
				sb.append("  <td>" + u.getLastName() + "</td>\n");
				sb.append("  <td>" + u.getUsername() + "</td>\n");
				sb.append("  <td>" + u.getRole() + "</td>\n");
				sb.append("  <td>" + u.getIsActive() + "</td>\n");
				sb.append("</tr>\n");
			}
			
		}
		sb.append("</table>");
		
		model.addAttribute("title", "List of Registered Users");
		model.addAttribute("report", sb.toString());
		
		//show the div
		model.addAttribute("display", "block");
		return "reports";
	}
}
