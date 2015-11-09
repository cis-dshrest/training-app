package com.explore.training.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "helpmessage")
public class HelpModule {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "title", unique = true, nullable = false)
	private String pageTitle;
	
	@NotEmpty
	@Column(name = "body", nullable = false)
	private String helpMessage;
	
	
	public HelpModule() { }
	
	public int getId() { return id; }
	
	public void setId(int i) { this.id = i; }
	
	public String getPageTitle() { return pageTitle; }
	
	public void setPageTitle(String pageTitle) { this.pageTitle = pageTitle; }
	
	public String getHelpMessage() { return helpMessage; }
	
	public void setHelpMessage(String helpMessage) { this.helpMessage = helpMessage; }
	
}
