package com.mindia.pedidos_online.pedidos_online_back.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;

@Repository
public class ItemRepository {
	
	/**
	 * Esta clase se debe utilizar para acceder a la tabla de 'item', ya sea para guardar, editar, eliminar registros, etc.
	 * A su vez esta clase será accedida a través de 'itemManager'.
	 */
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	/**
	 * Solo para tests 
	 */
	public void newItem(Item item) {
		mongoTemplate.insert(item);
	}
	
	/**
	 * Solo para tests 
	 */
	public void deleteItem(String name) {
		Query query = new Query();
		query.addCriteria(Criteria.where("name").is(name));
		
		mongoTemplate.remove(query, "items");
	}

	public List<Item> getItems() {
		return mongoTemplate.findAll(Item.class);
	}
	

}
