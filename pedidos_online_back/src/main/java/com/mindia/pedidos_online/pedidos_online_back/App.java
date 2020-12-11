package com.mindia.pedidos_online.pedidos_online_back;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@EnableAutoConfiguration
@ComponentScan
@SpringBootApplication
public class App 
{
    public static void main( String[] args ) {
        System.out.println( "Hello World!, this is a Mindia application!" );
        SpringApplication.run(App.class, args);
    }
}
