//package com.saerok.jy.commute.mapper;
//
//import org.apache.ibatis.annotations.Mapper;
//
//import com.saerok.jy.commute.dao.Insert;
//import com.saerok.jy.commute.dao.List;
//import com.saerok.jy.commute.dao.Map;
//import com.saerok.jy.commute.dao.Select;
//import com.saerok.jy.commute.dao.Update;
//import com.saerok.jy.commute.dao.WorkingManagement;
//
//@Mapper
//public class CommuteMapper {
//	
//	@Select("select * from commute where commute_no = #{commuteno}")
//	Commute selectStartwork(String commuteNo);
//
//	@Select("select count(*) from commute where emp_no= #{empNo} AND TRUNC(reg_date) = TO_DATE(#{time})")
//	int checkStartwork(Map<String, Object> param);
//
//	@Select("select * from commute where emp_no = #{empNo} AND TRUNC(reg_date) = TO_DATE(#{time})")
//	WorkingManagement checkWorkTime(Map<String, Object> param);
//
//	@Update("update commute set end_work = TO_TIMESTAMP_TZ(TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'Asia/Seoul', 'YYYY-MM-DD HH24:MI:SS.FF3'), 'YYYY-MM-DD HH24:MI:SS.FF3 TZR TZD'), state = '업무종료' where emp_no = #{empNo} AND TRUNC(reg_date) = TO_DATE(#{time})")
//	int updateEndWork(Map<String, Object> param);
//
//	//퇴근버튼 누를 시 하루 총근무시간 계산
//	int updateDayWorkTime(Map<String, Object> param);
//
//	@Select("select * from commute where reg_date like '%' || #{date} || '%' and emp_no = #{empNo}")
//	List<WorkingManagement> selectMonthWok(Map<String, Object> param);
//
//	@Select("select * from commute where emp_id = #{empNo} and reg_date between #{start} and to_date(#{end})+0.5 order by reg_date")
//	List<WorkingManagement> selectWeekDatas(Map<String, Object> param);
//
//	@Select("select nvl(sum(day_work_time),0) from commute where emp_no = #{empNo} and reg_date between #{start} and to_date(#{end})+0.5 order by reg_date")
//	int weekTotalTime(Map<String, Object> param);
//
//	@Select("select nvl(sum(day_work_time),0) from commute where reg_date like '%' || #{monthTime} || '%' and emp_no = #{empNo}")
//	int totalMonthTime(Map<String, Object> param);
//
//	//주간 기본근무시간 가져오기
//	@Select("select nvl(sum(day_work_time),0) from commute where emp_no = #{empNo} and reg_date between #{start} and to_date(#{end})+0.5 order by reg_date")
//	int selectWeekWorkTime(Map<String, Object> startEndMap);
//
//	//주간 연장근무시간 가져오기
//	@Select("select nvl(sum(overtime),0) from commute where emp_no = #{empNo} and reg_date between #{start} and to_date(#{end}) order by reg_date")
//	int selectWeekOverTime(Map<String, Object> startEndMap);
//
//	//월 연장근무시간 가져오기
//	@Select("select nvl(sum(overtime),0) from commute where reg_date like '%' || #{monthTime} || '%' and emp_no = #{empNo}")
//	int monthOverTime(Map<String, Object> startEndMap);
//	
//	@Insert("insert into commute values(seq_commute_no.nextval, null, null, null, #{regDate}, #{state}, #{dayWorkTime}, #{empNo})")
//	int insertRegDateState(WorkingManagement working);
//
//}
