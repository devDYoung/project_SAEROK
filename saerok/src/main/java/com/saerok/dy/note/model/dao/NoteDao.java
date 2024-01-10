package com.saerok.dy.note.model.dao;

import java.util.List;

import com.saerok.dy.note.model.dto.Note;

public interface NoteDao {
	void insert(Note note);

	// 어떤 사용자가 받은 쪽지함을 조회할 것인지
	List<Note> getReceivedNotes(String revEmpNo);

}