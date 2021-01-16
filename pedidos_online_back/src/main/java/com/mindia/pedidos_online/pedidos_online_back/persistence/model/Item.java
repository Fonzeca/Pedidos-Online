package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import org.bson.codecs.pojo.annotations.BsonDiscriminator;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@BsonDiscriminator(key = "disci", value = "Item")
@Document(collection = "items")
@TypeAlias("Item")
public class Item extends ItemBase{
	
	private String price;
	
	public Item (String name, String description, String image, String section, String price) {
		super(name,description,image,section);
		this.price=price;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}
