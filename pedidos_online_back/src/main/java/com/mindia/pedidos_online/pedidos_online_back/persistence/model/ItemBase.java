package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "items")
public abstract class ItemBase {
	@Id
	protected ObjectId id;
	
	//TODO: ingresar los datos de la base, apliqué unos base para que se tenga una idea.. Mongo or Sql?
	/**
	 * Campos:
	 * 	name, nombre del producto.
	 * 	description, breve descripción.
	 * 	price, precio a la venta.
	 * 	image, imagen que se muestra junto al producto.
	 */
	
	protected String name;
	protected String description;
	protected String image;
	protected String section;
	
	public ItemBase (String name, String description, String image, String section) {
		this.name=name;
		this.description=description;
		this.image=image;
		this.section = section;
	}

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
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
