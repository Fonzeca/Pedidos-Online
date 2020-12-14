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

}
