package com.saerok.jh.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

@Configuration
@EnableWebSecurity
public class SecurityConfig{
   
   //SecurityFilterChain클래스를 bean으로 등록
   @Autowired
   private DBConnectionProvider dbprovider;
   
   
   @Bean 
   SecurityFilterChain authenticationPath(HttpSecurity http) 
         throws Exception{
      return http
            .csrf(csrf->csrf.disable()) // CSRF 보호 비활성화 (CSRF 공격을 막기 위해서 설정함) 
            .authorizeHttpRequests(request->{ // HTTP 요청 권한 설정
               request.requestMatchers("/loginPage").permitAll() // 루트 경로 ("/")에 대한 모든 사용자 허용
               .requestMatchers("/resources/**").permitAll()
               .requestMatchers(req->CorsUtils.isPreFlightRequest(req)).permitAll()
               .requestMatchers("/WEB-INF/views/**").permitAll() // "/WEB-INF/views/**" 경로에 대한 모든 사용자 허용
               .requestMatchers("/insertemp").hasAnyAuthority(MyAuthority.HR.name())
            //   .requestMatchers("/insertemp").hasRole(MyAuthority.HR_MASTER.name())
               .requestMatchers("/selectemp").hasAnyAuthority(MyAuthority.HR.name())
               
               //메소드 방식으로 선언할 수도 있다. 
               .anyRequest().authenticated(); //권한이 있어야 해!  // 나머지 모든 요청에 대해 인증이 필요함
               // 폼 로그인 설정
            }).formLogin(formlogin->{
               formlogin
               .loginPage("/loginPage")
                     /* .loginProcessingUrl("/loginPage") */
               //.failureForwardUrl("/loginfail")
               .successForwardUrl("/")
               .usernameParameter("empNo")
               .passwordParameter("empPw");
            })
            .logout(logout -> logout
                  .logoutUrl("/logoutpage")
            ).rememberMe(remember->{
            	remember
            	.rememberMeParameter("remember-id")
            	.tokenValiditySeconds(60*60*24)
            	.userDetailsService(dbprovider)
            	;
            })
            .exceptionHandling(
                    exceptionHandle 
                    ->exceptionHandle.accessDeniedHandler(
                          new MyAccessDeniedHandler()))
            .authenticationProvider(dbprovider) // DB와 연동하여 인증 처리
            .build(); // SecurityFilterChain 빌드 및 반환
         }
      }

	
