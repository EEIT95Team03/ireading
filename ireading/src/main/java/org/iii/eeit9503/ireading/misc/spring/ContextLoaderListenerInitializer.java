package org.iii.eeit9503.ireading.misc.spring;

import org.springframework.web.context.AbstractContextLoaderInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

public class ContextLoaderListenerInitializer extends AbstractContextLoaderInitializer{

	@Override
	protected WebApplicationContext createRootApplicationContext() {
		// TODO Auto-generated method stub
		AnnotationConfigWebApplicationContext result=new AnnotationConfigWebApplicationContext();
		result.register(SpringJavaConfiguration.class);
		return result;
	}

}
