package com.explore.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.explore.training.dao.UserDao;
import com.explore.training.model.User;


@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Override
	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public void saveUser(User user) {
		dao.saveUser(user);
		
	}

	@Override
	public void updateUser(User user) {
		User entity = dao.findByUsername(user.getUsername());
		if(entity!=null){
			entity.setFirstName(user.getFirstName());
			entity.setLastName(user.getLastName());
			entity.setPassword(user.getPassword());
			entity.setRole(user.getRole());
			entity.setIsActive(user.getIsActive());
		}
		
	}

	@Override
	public void deleteUserbyUsername(String username) {
		dao.deleteUserByUsername(username);
		
	}

	@Override
	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	@Override
	public User findUserByFirstLast(String first, String last) {
		return dao.findUserByRealName(first, last);
	}

	@Override
	public boolean isUsernameUnique(String username) {
		User user = findByUsername(username);
		return (user == null);
	}
	
	@Override
	public AuthCode login(String username, String password) {
		
		User user = dao.findByUsername(username);
		
		if (user == null) {
			return AuthCode.FAIL;
		}
		
		if (username.equals(user.getUsername()) && 
			password.equals(user.getPassword())) {
			
			if(user.getRole().equals("ADMIN")) {
				return AuthCode.ADMIN;
			}
			else if(user.getRole().equals("USER")) {
				return AuthCode.USER;
			}
		}
		
		return AuthCode.FAIL;
		
	}

}
