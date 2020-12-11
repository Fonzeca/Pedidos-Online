package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import java.util.List;

public class Section {
	

	private List<Item> items;
	private String name;
	private String image;
	
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
