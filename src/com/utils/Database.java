package com.utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class Database {
private static SessionFactory factory = null;
    
    public static SessionFactory getConnection(){
    
        if(factory == null){
        
        	StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
    		
    		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();
    		
    		factory = meta.getSessionFactoryBuilder().build();
    	
    }
        
       return factory;
    }

}
