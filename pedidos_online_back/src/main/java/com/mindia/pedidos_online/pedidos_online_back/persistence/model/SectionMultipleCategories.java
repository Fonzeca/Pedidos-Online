package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sections")
@TypeAlias("SectionMultipleCategories")
public class SectionMultipleCategories extends SectionBase{

	private int type;
	private List<String> categories;
	
	public SectionMultipleCategories(String name, String image, int type, List<String> categories) {
		super(name, image);
		this.type = type;
		this.categories = categories;
		if(categories == null) {
			this.categories = new ArrayList<String>();
		}
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	
}
