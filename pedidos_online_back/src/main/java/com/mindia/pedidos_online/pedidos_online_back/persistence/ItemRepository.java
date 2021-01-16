package com.mindia.pedidos_online.pedidos_online_back.persistence;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.ItemBase;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.ItemMultiplePrices;

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
	public void newItem(ItemBase item) {
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

	public List<ItemBase> getItems() {
		List<ItemBase> list = new ArrayList<ItemBase>();
		list.addAll(mongoTemplate.find(Query.query(Criteria.where("_class").is(Item.class.getSimpleName())), Item.class, "items"));
		list.addAll(mongoTemplate.find(Query.query(Criteria.where("_class").is(ItemMultiplePrices.class.getSimpleName())), ItemMultiplePrices.class, "items"));
		list.sort(Comparator.comparing(ItemBase::getId));
		return list;
	}
	

}
