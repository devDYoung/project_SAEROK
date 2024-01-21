package com.saerok.dy.note.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.dy.note.model.dto.Note;
import com.saerok.jh.employee.model.dto.Employee;

@Repository
public class NoteDaoImpl implements NoteDao {

	// 받은 쪽지 조회
	@Override
	public List<Note> getReceivedNotes(SqlSession session) {
		return session.selectList("note.getReceivedNotes");
	}

	// 이름으로 사원 조회
	@Override
	public List<Employee> selectEmpByName(SqlSession session) {
		return session.selectList("note.selectEmpByName");
	}
	
	@Override
	public int insertNote(SqlSession session, Note note) {
		return session.insert("note.insertNote", note);
	}
}
