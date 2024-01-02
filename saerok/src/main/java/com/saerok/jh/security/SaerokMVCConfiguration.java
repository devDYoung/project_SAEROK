package com.saerok.jh.security;

import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class SaerokMVCConfiguration implements WebMvcConfigurer {
	
	//view설정 
	
		@Override
		public void addViewControllers(ViewControllerRegistry registry) {
			registry.addViewController("/").setViewName("index");
			
			
			
		}
	
	
		
		
		
		
		
		
		
		
}
