package org.iii.eeit9503.ireading.misc.springMVC;

import java.util.Properties;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.iii.eeit9503.ireading.member.dao.PasswordResetImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.GenericWebApplicationContext;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("org.iii.eeit9503.ireading.controller")
public class SpringMVCJavaConfig extends WebMvcConfigurerAdapter implements  WebApplicationInitializer{

	private String TMP_FOLDER = "/tmp"; 
    private int MAX_UPLOAD_SIZE = 5 * 1024 * 1024; 
	
	@Autowired
	private ServletContext application;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
	  Resource resource=new ServletContextResource(application, "/WEB-INF/views.xml");
       XmlViewResolver XMLviewResolver=new XmlViewResolver();
       XMLviewResolver.setLocation(resource);
       registry.viewResolver(XMLviewResolver);
       
	}
	
//	@Bean
//	public ViewResolver jspViewResolver(){
//		InternalResourceViewResolver  InternalviewResolver=new InternalResourceViewResolver();
//      InternalviewResolver.setViewClass(JstlView.class);
//      InternalviewResolver.setOrder(10);
//     
//		return InternalviewResolver;
//		
//	}
//	
//	@Bean
//	public ViewResolver xmlViewResolver(){
//		Resource resource=new ServletContextResource(application, "/WEB-INF/views.xml");
//		XmlViewResolver XMLviewResolver=new XmlViewResolver();
//      XMLviewResolver.setLocation(resource);
//      XMLviewResolver.setOrder(1);
//     
//		return XMLviewResolver;
//		
//	}
	
	
	@Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        final CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setDefaultEncoding("UTF-8");
        multipartResolver.setMaxUploadSize(100000);
        return multipartResolver;
    }
	
	@Override
    public void onStartup(ServletContext sc) throws ServletException {
         
        ServletRegistration.Dynamic appServlet = sc.addServlet("mvc", new DispatcherServlet(
          new GenericWebApplicationContext()));
 
        appServlet.setLoadOnStartup(1);
         
        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(TMP_FOLDER, 
          MAX_UPLOAD_SIZE, MAX_UPLOAD_SIZE * 2, MAX_UPLOAD_SIZE / 2);
         
        appServlet.setMultipartConfig(multipartConfigElement);
    }
	
	//mail
	
	@Bean(name = "mailSender")
	public JavaMailSenderImpl mailSender(){
		JavaMailSenderImpl mailSeneder = new JavaMailSenderImpl();
		mailSeneder.setDefaultEncoding("UTF-8");
		mailSeneder.setHost("smtp.gmail.com");
		mailSeneder.setPort(587);
		
		Properties props = new Properties();
		
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		
		mailSeneder.setJavaMailProperties(props);
		mailSeneder.setUsername("ireadingeeit95");
		mailSeneder.setPassword("ireading123");
		return mailSeneder;
	}
	
	@Bean
	public SimpleMailMessage Message(){
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("ireadingeeit95@gmail.com");
		message.setSubject("享。閱：重設密碼通知信");
		return message;
	}
	
	public PasswordResetImpl passwordReset(){
		PasswordResetImpl pwdReset = new PasswordResetImpl();
		pwdReset.setMailSender(mailSender());
		pwdReset.setTemplateMessage(Message());
		return pwdReset;
	}
	

}
