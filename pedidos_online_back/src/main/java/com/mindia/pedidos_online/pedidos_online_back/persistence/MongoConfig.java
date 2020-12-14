package com.mindia.pedidos_online.pedidos_online_back.persistence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

@Configuration
public class MongoConfig {
	
	@Autowired
	private MongoDbProperties mongoProperties;
	
	@Bean
	public MongoClient mongo() {
		ConnectionString connectionString = new ConnectionString("mongodb://" + mongoProperties.getUser() + ":" + mongoProperties.getPassword() + "@" + mongoProperties.getIp() + ":" + mongoProperties.getPort() + "/" + mongoProperties.getDb());
		MongoClientSettings mongoClientSettings = MongoClientSettings.builder()
				.applyConnectionString(connectionString)
				.build();
		
		return MongoClients.create(mongoClientSettings);
	}

	@Bean
	public MongoTemplate mongoTemplate() throws Exception {
		return new MongoTemplate(mongo(), mongoProperties.getDb());
	}
	
}