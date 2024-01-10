package com.saerok.dy.note.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.saerok.dy.note.model.dao.NoteDao;
import com.saerok.dy.note.model.dto.Note;

@Service
public class NoteServiceImpl implements NoteService {
	
	private final NoteDao noteDao;

	public NoteServiceImpl(NoteDao noteDao) {
		this.noteDao = noteDao;
	}

	@Override
	public List<Note> getReceivedNotes(String revEmpNo) {
		// TODO Auto-generated method stub
		return noteDao.getReceivedNotes(revEmpNo);
	}

	@Override
	public void writeNote(Note note) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Note> getSentNotes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Note> getDeletedNotes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteNote(int noteNo) {
		// TODO Auto-generated method stub

	}

}