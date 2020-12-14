package com.mindia.pedidos_online.pedidos_online_back.view;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
	"name",
	"image"
})
public class PojoSection {
	@JsonProperty("name")
	String name;
	@JsonProperty("image")
	String image;
	
	public PojoSection(String name, String image) {
		this.name=name;
		this.image=image;
	}

}
