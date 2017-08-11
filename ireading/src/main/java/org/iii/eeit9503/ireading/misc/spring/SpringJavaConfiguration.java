package org.iii.eeit9503.ireading.misc.spring;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.bean.CategoryBean;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.bookcase.bean.BCDetailBean;
import org.iii.eeit9503.ireading.bookcase.bean.BookCaseBean;
import org.iii.eeit9503.ireading.event.bean.EventBean;
import org.iii.eeit9503.ireading.event.bean.JoinListBean;
import org.iii.eeit9503.ireading.member.bean.MemberBean;
import org.iii.eeit9503.ireading.member.bean.OutputBean;
import org.iii.eeit9503.ireading.member.bean.PaymentBean;
import org.iii.eeit9503.ireading.order.bean.OrderBean;
import org.iii.eeit9503.ireading.order.bean.OrderDetailBean;
import org.iii.eeit9503.ireading.order.bean.OrderStatusBean;
import org.iii.eeit9503.ireading.order.bean.PayBean;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.bean.ProductStatusBean;
import org.iii.eeit9503.ireading.product.bean.SellListBean;
import org.iii.eeit9503.ireading.product.bean.SellListStatusBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

@Configuration
@ComponentScan("org.iii.eeit9503.ireading")
public class SpringJavaConfiguration {
	@Bean
    public DataSource dataSource(){
    
//    DriverManagerDataSource dmds=new DriverManagerDataSource();
//
//    dmds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//    dmds.setUrl("jdbc:sqlserver://localhost:1433;database=ireadDB");
//    dmds.setUsername("sa");
//    dmds.setPassword("P@ssw0rd");
//    return dmds;    
		
		DataSource dataSource=null;
		try {
			Context ctx=new InitialContext();
			dataSource=(DataSource) ctx.lookup("java:/comp/env/jdbc/ireadDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dataSource;
    }
	
	@Bean
    public SessionFactory sessionFactory(){

        LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource());
        
        Properties prop=new Properties();       
        prop.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
        prop.put("hibernate.current_session_context_class", "thread");
        prop.put("hibernate.show_sql", "true");

        builder.addProperties(prop);

        builder.addAnnotatedClasses(OrderBean.class,OrderDetailBean.class,PayBean.class,OrderStatusBean.class,
        		ProductBean.class,ProductStatusBean.class,SellListBean.class,SellListStatusBean.class,
        		ReviewBean.class,BookCaseBean.class,BCDetailBean.class,
        		BooksBean.class,CategoryBean.class,
        		MemberBean.class,OutputBean.class,PaymentBean.class,
        		EventBean.class,JoinListBean.class
        		);//maping class       

        return builder.buildSessionFactory();       
    }


	/**
	 * 1 JdbcTemplate
	 *
	 * @return JdbcTemplate
	 */
	@Bean
	public JdbcTemplate jdbcTemplate() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSource());
		return jdbcTemplate;
	}

	/**
	 * 2
	 * 
	 * @return namedParameterJdbcTemplate
	 */
	@Bean
	public NamedParameterJdbcTemplate namedParameterJdbcTemplate() {
		NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource());
		return namedParameterJdbcTemplate;
	}

	
}
