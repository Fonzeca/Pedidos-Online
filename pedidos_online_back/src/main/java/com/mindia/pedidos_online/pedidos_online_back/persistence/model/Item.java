package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "items")
@TypeAlias("Item")
public class Item {
	@Id
	private ObjectId id;
	//TODO: ingresar los datos de la base, apliqué unos base para que se tenga una idea.. Mongo or Sql?
	/**
	 * Campos:
	 * 	name, nombre del producto.
	 * 	description, breve descripción.
	 * 	price, precio a la venta.
	 * 	image, imagen que se muestra junto al producto.
	 */
	
	private String name;
	private String description;
	private String price;
	private String image;
	private String section;
	
	
	public Item (String name, String description, String price, String image, String section) {
		this.name=name;
		this.description=description;
		this.setSection(section);
		this.price=price;
		this.image=image;
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	
}
