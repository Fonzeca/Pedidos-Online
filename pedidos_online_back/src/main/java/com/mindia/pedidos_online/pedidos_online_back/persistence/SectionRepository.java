package com.mindia.pedidos_online.pedidos_online_back.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Section;

@Repository
public class SectionRepository {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	public List<Section> getSections() {
		return mongoTemplate.findAll(Section.class);
	}

}
