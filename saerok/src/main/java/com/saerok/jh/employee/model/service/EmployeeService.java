package com.saerok.jh.employee.model.service;

import java.util.List;
import java.util.Map;

import com.saerok.jh.employee.model.dto.Employee;

public interface EmployeeService {

    
   //사원등록
    int insertEmployeeEnd(Map<String,Object> param);
    
   //전체사원조회 
    List<Employee> selectEmployeeList();
    
   //사원수정
    int updateEmployee(Employee e);
   
   //사원삭제
    int deleteEmployee(Employee empNo);
    
   // 부서별 근태 현황 조회
    List<Employee> selectEmpDeptList(String deptCode);
    
    List<Employee> empFinderDeptList(Map<String, Object> param);
   
}