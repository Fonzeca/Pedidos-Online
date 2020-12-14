package com.mindia.pedidos_online.pedidos_online_back.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
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
	
	public void newItem(Item item) {
		//TODO: connect to db and upload the item itself weee re yankee
		System.out.println("Producto "+item.getName()+" cargado con éxito!");

	}

	public List<Item> getItems() {
		return mongoTemplate.findAll(Item.class);

	}
	

}
