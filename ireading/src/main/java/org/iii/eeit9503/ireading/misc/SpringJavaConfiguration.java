package org.iii.eeit9503.ireading.misc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

@Configuration
@ComponentScan("org.iii.eeit9503.ireading")
public class SpringJavaConfiguration {
	@Bean
    public DataSource dataSource(){
    
    DriverManagerDataSource dmds=new DriverManagerDataSource();

    dmds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    dmds.setUrl("jdbc:sqlserver://localhost:1433;database=ireadDB");
    dmds.setUsername("sa");
    dmds.setPassword("P@ssw0rd");

    return dmds;           
    }
	
	@Bean
    public SessionFactory sessionFactory(){

        LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource());
        
        Properties prop=new Properties();       
        prop.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
        prop.put("hibernate.current_session_context_class", "thread");
        prop.put("hibernate.show_sql", "true");
        builder.addProperties(prop);

        builder.addAnnotatedClasses(OrderBean.class);//maping class       
        
        return builder.buildSessionFactory();       
    }


}