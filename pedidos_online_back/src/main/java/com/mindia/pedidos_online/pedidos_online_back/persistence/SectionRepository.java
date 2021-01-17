package com.mindia.pedidos_online.pedidos_online_back.persistence;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Section;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionBase;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionMultipleCategories;

@Repository
public class SectionRepository {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	public List<SectionBase> getSections() {
		List<SectionBase> sections = new ArrayList<SectionBase>();
		
		sections.addAll(mongoTemplate.find(Query.query(Criteria.where("_class").is(Section.class.getSimpleName())), Section.class, "sections"));
		sections.addAll(mongoTemplate.find(Query.query(Criteria.where("_class").is(SectionMultipleCategories.class.getSimpleName())), SectionMultipleCategories.class, "sections"));
		sections.sort(Comparator.comparing(SectionBase::getId));
		
		return sections;
	}
	
	public void newSection(SectionBase section) {
		mongoTemplate.insert(section);
	}
	
	public void deleteSection(String name) {
		mongoTemplate.remove(Query.query(Criteria.where("name").is(name)), SectionBase.class);
	}

}
