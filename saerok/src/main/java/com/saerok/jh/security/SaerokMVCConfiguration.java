package com.saerok.jh.security;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

@Configuration
@EnableAspectJAutoProxy
public class SaerokMVCConfiguration implements WebMvcConfigurer {
	
	//view설정 
	
		@Override
		public void addViewControllers(ViewControllerRegistry registry) {
			registry.addViewController("/").setViewName("index");
			registry.addViewController("/mypage").setViewName("login/mypage");
			
		}
	
		@Bean
		@Primary
		HandlerExceptionResolver handlerException() {
			Properties exceptionProp=new Properties();
			
			//추가적인 exception 페이지 설정 가능
			exceptionProp.setProperty(AccessDeniedException.class.getName(), "common/errorpage");
			SimpleMappingExceptionResolver exceptionResolver= new SimpleMappingExceptionResolver();
			exceptionResolver.setExceptionMappings(exceptionProp);

			return exceptionResolver;
		}
//		
		
		
		
		
		
		
		
}
