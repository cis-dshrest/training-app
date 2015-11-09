package com.explore.training.service;

import java.util.List;

import com.explore.training.model.User;


public interface UserService {
	
	public enum AuthCode
	{
	    FAIL, USER, ADMIN;
	}
	
	User findByUsername(String username);
	
	void saveUser(User user);
	
	void updateUser(User user);
	
	void deleteUserbyUsername(String username);

	List<User> findAllUsers(); 
	
	User findUserByFirstLast(String first, String last);

	boolean isUsernameUnique(String username);
	
	AuthCode login(String username, String password);
	
}
