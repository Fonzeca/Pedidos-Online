package com.mindia.pedidos_online.pedidos_online_back.view;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
	"name",
	"description",
	"section",
	"price",
	"image"
})
public class PojoItem {
	@JsonProperty("name")
	String name;
	@JsonProperty("description")
	String description;
	@JsonProperty("section")
	String section;
	@JsonProperty("price")
	String price;
	@JsonProperty("image")
	String image;
	
	public PojoItem(Item item) {
		name=item.getName();
		description=item.getDescription();
		section=item.getSection();
		price=item.getPrice();
		image=item.getImage();
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
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
