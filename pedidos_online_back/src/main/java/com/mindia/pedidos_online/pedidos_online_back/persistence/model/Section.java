package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "sections")
@TypeAlias("Section")
public class Section extends SectionBase{
	
	public Section(String name, String image) {
		super(name, image);
	}
	
	
}
