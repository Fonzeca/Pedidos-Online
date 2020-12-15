package com.mindia.pedidos_online.pedidos_online_back;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class TestingWebApplicationTests {

	@LocalServerPort
	private int serverPort;

	@Autowired
	private TestRestTemplate http;

	@Test
	public void itemControllerTest() {
		System.out.println("Get all items test");
		String result = http.getForObject("localhost:" + serverPort + "/list", String.class);
		
//		assertThat(, String.class));
		
	}

}
