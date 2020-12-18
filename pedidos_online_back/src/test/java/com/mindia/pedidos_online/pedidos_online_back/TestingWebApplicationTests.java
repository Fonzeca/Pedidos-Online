package com.mindia.pedidos_online.pedidos_online_back;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;

import com.mindia.pedidos_online.pedidos_online_back.controller.ItemController;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoItem;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT) 
public class TestingWebApplicationTests { 
 
	@LocalServerPort 
	private int serverPort; 
 
	@Autowired 
	private ItemController controller; 
 
	@Test 
	public void itemControllerTest() { 
		Item item = new Item("Item prueba " + Math.random()*100, "Este item es de prueba", "20.0", "", "");
		
		assertNotNull(controller, "Se inyecto el controller exitosamente!");
		
		controller.newItem(item.getName(), item.getDescription(), item.getPrice(), item.getImage(), item.getSection());

		
		List<PojoItem> items = controller.getAllItems();
		items = items.stream().filter(x -> x.getName().equals(item.getName())).collect(Collectors.toList());
		
		assertEquals(true, items.size() == 1, "Se obtuvo correctamente el item");
		
		
		controller.deleteItem(item.getName());
		
		items = controller.getAllItems();
		items = items.stream().filter(x -> x.getName().equals(item.getName())).collect(Collectors.toList());
		
		assertEquals(true, items.size() == 0, "Se borro correctamente el item");
	}
 
}