package com.saerok.jh.employee.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.saerok.jh.security.MyAuthority;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Employee implements UserDetails {
	private static final long serialVersionUID = 2435809537311076622L;
	private String empNo;
	private String empPw;
	private String empName;
	private String empPhone;
	private String empEmail;
	private String empAddr;
	private String empDetailAddr;
	private Date empDate;
	private String workYn;
	private String oriFileName;
	private String destFileName;
	private double issueAnnu;
	private double useAnnu;

	private String deptCode; // 부서코드
	private String deptName; // 부서이름
	private String jobCode; // 직급코드
	private String jobName; // 직급이름

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
	   // 권한 정보를 담을 리스트를 생성
	   List<GrantedAuthority> auth = new ArrayList<>();
	   if (deptCode.equals("100") && (jobCode.equals("10") || jobCode.equals("20") || jobCode.equals("30"))) {
	      auth.add(new SimpleGrantedAuthority(MyAuthority.HR.name())); //인사팀 -> HR
	   } else if (deptCode.equals("100") && jobCode.equals("10")) {
	      auth.add(new SimpleGrantedAuthority(MyAuthority.HR_MASTER.name())); // 인사부장 -> HR_MASTER
	   } else if (deptCode.equals("400") && jobCode.equals("40")) {
	      auth.add(new SimpleGrantedAuthority(MyAuthority.BRANCHER.name())); // 지점장 -> BRANCHER
	   }else if(deptCode.equals("200") && (jobCode.equals("10") || jobCode.equals("20") || jobCode.equals("30"))) {
		   auth.add(new SimpleGrantedAuthority(MyAuthority.MG.name())); // 관리팀 -> MG
	   }else if(deptCode.equals("300") && (jobCode.equals("10") || jobCode.equals("20") || jobCode.equals("30"))) {
		   auth.add(new SimpleGrantedAuthority(MyAuthority.SA.name())); // 영업팀 -> SA
	   }
	   
	   
	   return auth;
	}


	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.empNo;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.empPw;
	}

}