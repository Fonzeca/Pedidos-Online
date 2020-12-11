package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

public class Item {
	
	//TODO: ingresar los datos de la base, apliqué unos base para que se tenga una idea.. Mongo or Sql?
	/**
	 * Campos:
	 * 	name, nombre del producto.
	 * 	description, breve descripción.
	 * 	price, precio a la venta.
	 * 	image, imágen que se muestra junto al producto.
	 */
	private String name;
	private String description;
	private String price;
	private String image;
	
	
	public Item (String name, String description, String price) {
		this.description=description;
		this.name=name;
		this.price=price;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
}
