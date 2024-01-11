package com.saerok.dy.note.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

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
	public List<Note> getReceivedNotes(String revEmpNo) {
		// TODO Auto-generated method stub
		return dao.getReceivedNotes(session);
	}

	// 이름으로 사원 조회
	@Override
	public List<Employee> selectEmpByName(String empName) {
		// TODO Auto-generated method stub
		return dao.selectEmpByName(session);
	}
}