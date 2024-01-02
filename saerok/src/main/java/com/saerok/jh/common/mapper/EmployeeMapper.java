package com.saerok.jh.common.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.saerok.jh.employee.model.dto.Employee;

@Mapper // Mapper 기능을 하는 인터페이스
public interface EmployeeMapper {

	//로그인 
	@Select("SELECT * FROM EMPLOYEE WHERE EMP_NO=#{empNo}")
    Employee selectEmployeeByEmpNo(String empNo);
	
//	
//	//마이페이지 수정 
//	@Update("UPDATE EMPLOYEE SET\r\n"
//			+ "		EMP_NAME=#{empName}, EMP_PW=#{password}, PHONE=#{phone},"
//			+ "		EMAIL=#{email}, ADDRESS=#{address} WHERE\r\n"
//			+ "		EMP_NAME=#{empName}")
//	int updateMypage(Employee m);
//	
//	
//	//사원전체조회
//	@Select("SELECT * FROM EMPLOYEE")
//	List<Employee> selectEmployeeAll();
//	
//	//밑에서부턴 다시 작성해야함
//	
//	//사원가입(추가)
//	@Insert("INSERT INTO EMPLOYEE" + "VALUES(#{empName},#{empPw},#{empNo},"
//			+ "#{empPhone},#{empEmail},#{deptCode},#{empAddr},#{empDetailAddr},#{jobCode},#{empDate},"
//			+ "")
//	int insertEmployee(Employee e);
//	
//	//사원정보수정
//	@Update("UPDATE EMPLOYEE SET\r\n"
//			+ "		EMP_NAME=#{empName}, EMP_PW=#{password}, GENDER=#{gender}, AGE=#{age},"
//			+ "		EMAIL=#{email}, PHONE=#{phone}, ADDRESS=#{address} WHERE\r\n"
//			+ "		USERID=#{userId}")
//	int updateEmployee(Employee m);
//
//	//사원삭제
//	@Delete("DELETE FROM MEMBER"
//			+ "		WHERE USERID=#{userId}")
//	int deleteMember(String userId);

}
