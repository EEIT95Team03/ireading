package org.iii.eeit9503.ireading.misc.springMVC;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("org.iii.eeit9503.ireading.controller")
public class SpringMVCJavaConfig extends WebMvcConfigurerAdapter{

	@Autowired
	private ServletContext application;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// TODO Auto-generated method stub
       Resource resource=new ServletContextResource(application, "/WEB-INF/views.xml");
       XmlViewResolver viewResolver=new XmlViewResolver();
       viewResolver.setLocation(resource);
       registry.viewResolver(viewResolver);
	}
	
	
	

}
