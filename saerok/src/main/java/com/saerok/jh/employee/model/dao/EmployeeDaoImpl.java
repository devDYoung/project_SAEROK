package com.saerok.jh.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.jh.employee.model.dto.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

   
   //사원등록
   @Override
   public int insertEmployeeEnd(SqlSession session, Map<String,Object> param) {
      return session.insert("emp.insertEmployeeEnd", param);
   }
   
   //전체사원조회
   @Override
   public List<Employee> selectEmployeeList(SqlSession session) {
      return session.selectList("emp.selectEmployeeList");
   }
   
   //사원수정
   @Override
   public int updateEmployee(SqlSession session, Employee e) {
      return session.update("emp.updateEmployee",e);
   }

   //사원삭제
   @Override
   public int deleteEmployee(SqlSession session, Employee empNo) {
      return session.delete("emp.deleteEmployee",empNo);
   }
   
   
   
   
   

}