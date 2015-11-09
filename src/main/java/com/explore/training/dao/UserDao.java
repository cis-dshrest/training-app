package com.explore.training.dao;

import java.util.List;

import com.explore.training.model.User;

public interface UserDao {
	User findByUsername(String username);

	void saveUser(User user);
	
	void deleteUserByUsername(String username);
	
	List<User> findAllUsers();

	User findUserByRealName(String first, String last);
}
