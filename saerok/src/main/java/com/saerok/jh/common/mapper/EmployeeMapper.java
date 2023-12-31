package com.saerok.jh.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.saerok.jh.employee.model.dto.Employee;

@Mapper // Mapper 기능을 하는 인터페이스
public interface EmployeeMapper {

	//사원전체조회
	@Select("SELECT * FROM EMPLOYEE")
	List<Employee> selectEmployeeAll();
	
	//로그인 
	@Select("SELECT * FROM EMPLOYEE WHERE EMP_NO=#{empNo}")
	Employee selectEmployeeByEmpNo(String empNo);

	//사원가입(추가)
	@Insert("INSERT INTO EMPLOYEE" + "VALUES(#{empName},#{empPw},#{empNo},"
			+ "#{empPhone},#{empEmail},#{deptCode},#{empAddr},#{empDetailAddr},#{jobCode},#{empDate}")
	int insertEmployee(Employee e);
	
	//마
	@Update("UPDATE EMPLOYEE SET\r\n"
			+ "		EMP_NAME=#{empName}, EMP_PW=#{password}, GENDER=#{gender}, AGE=#{age},"
			+ "		EMAIL=#{email}, PHONE=#{phone}, ADDRESS=#{address} WHERE\r\n"
			+ "		USERID=#{userId}")
	int updateMember(Employee m);

	@Delete("DELETE FROM MEMBER"
			+ "		WHERE USERID=#{userId}")
	int deleteMember(String userId);

}
