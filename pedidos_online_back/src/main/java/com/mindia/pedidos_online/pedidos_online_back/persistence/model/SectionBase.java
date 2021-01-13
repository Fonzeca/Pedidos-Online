package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;

public abstract class SectionBase {
	@Id
	protected ObjectId id;

	protected String name;
	protected String image;
	
	public SectionBase(String name, String image) {
		this.name = name;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
}
