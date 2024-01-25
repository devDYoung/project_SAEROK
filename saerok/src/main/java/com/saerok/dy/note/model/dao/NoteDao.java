package com.saerok.dy.note.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saerok.dy.note.model.dto.Note;
import com.saerok.jh.employee.model.dto.Employee;

public interface NoteDao {

	// 어떤 사용자가 받은 쪽지함을 조회할 것인지
	List<Note> getReceivedNotes(SqlSession session);
	
	// 어떤 사용자가 보낸 쪽지함을 조회할 것인지
	List<Note> getSentNotes(String empNo, SqlSession session);

	// 이름으로 사원 조회
	List<Employee> selectEmpByName(SqlSession session);

	// 쪽지를 DB에 저장하는 메소드
	int insertNote(SqlSession session, Note note);
	
	// 휴지통으로 이동하는 메소드
	int updateNoteDelStatus(SqlSession sessoin, Note note);

	Note getNoteByNoteNo(int noteNo, SqlSession session);

}