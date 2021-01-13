package com.mindia.pedidos_online.pedidos_online_back.view;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionBase;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionMultipleCategories;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
	"name",
	"image",
	"categories"
})
public class PojoSection {
	@JsonProperty("name")
	String name;
	@JsonProperty("image")
	String image;
	@JsonProperty("categories")
	List<String> categories;
	
	public PojoSection(SectionBase section) {
		this.name = section.getName();
		this.image = section.getImage();
		
		if(section instanceof SectionMultipleCategories) {
			categories = ((SectionMultipleCategories)section).getCategories();
		}
		
	}

}
