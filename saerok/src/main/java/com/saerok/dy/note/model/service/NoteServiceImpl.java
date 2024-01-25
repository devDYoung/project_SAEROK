package com.saerok.dy.note.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saerok.dy.note.model.dao.NoteDao;
import com.saerok.dy.note.model.dto.Note;
import com.saerok.jh.employee.model.dto.Employee;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoteServiceImpl implements NoteService {

	private final NoteDao dao;
	private final SqlSession session;

	// 받은 쪽지 조회
	@Override
	public List<Note> getReceivedNotes() {
		// TODO Auto-generated method stub
		return dao.getReceivedNotes(session);
	}

	// 보낸 쪽지 조회
	@Override
	public List<Note> getSentNotes(String empNo){
		return dao.getSentNotes(empNo, session);
	}
	
	// 이름으로 사원 조회
	@Override
	public List<Employee> selectEmpByName(String empName) {
		// TODO Auto-generated method stub
		return dao.selectEmpByName(session);
	}
	
	@Override
	@Transactional() //트랜젝션 처리 어노테이션 
	public boolean sendNote(Note note) {
		int result = dao.insertNote(session, note);
    	if(result > 0) {
    		return true; // 성공적으로 전송되었을 경우 true 반환
    	}
        return false;
	}
}
