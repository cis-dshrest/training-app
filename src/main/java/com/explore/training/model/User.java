package com.explore.training.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "users")
public class User {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotEmpty
	@Size(min=3, max=20)
	@Column(name = "username", unique = true, nullable = false)
	private String username;
	
	@NotEmpty
	@Column(name = "password", nullable = false)
	private String password;
	
	@NotEmpty
	@Column(name = "firstname", nullable = false)
	private String firstName;
	
	@NotEmpty
	@Column(name = "lastname", nullable = false)
	private String lastName;

	@Column(name = "role", nullable = false)
	private String role = "USER";
	
	@Column(name = "is_active", nullable = false)
	private int isActive = 1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(this.getId() + " " );
		sb.append(this.getFirstName() + " ");
		sb.append(this.getLastName() + " ");
		sb.append(this.getUsername() + " ");
		sb.append(this.getRole() + " ");
		sb.append(this.getIsActive());
		
		return sb.toString();
	}


}
