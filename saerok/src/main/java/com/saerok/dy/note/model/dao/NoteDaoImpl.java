package com.saerok.dy.note.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saerok.dy.note.model.dto.Note;

@Repository
public class NoteDaoImpl implements NoteDao {

	 private final SqlSessionTemplate sqlSessionTemplate;

	    @Autowired
	    public NoteDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
	        this.sqlSessionTemplate = sqlSessionTemplate;
	    }

	    @Override
	    public void insert(Note note) {
	        sqlSessionTemplate.insert("com.saerok.dy.note.model.dao.NoteDao.insert", note);
	    }

	    @Override
	    public List<Note> getReceivedNotes() {
	        return sqlSessionTemplate.selectList("com.saerok.dy.note.model.dao.NoteDao.getReceivedNotes");
	    }

	    @Override
	    public List<Note> getSentNotes() {
	        return sqlSessionTemplate.selectList("com.saerok.dy.note.model.dao.NoteDao.getSentNotes");
	    }

	    @Override
	    public List<Note> getDeletedNotes() {
	        return sqlSessionTemplate.selectList("com.saerok.dy.note.model.dao.NoteDao.getDeletedNotes");
	    }

	    @Override
	    public void deleteNoteById(int noteNo) {
	        sqlSessionTemplate.delete("com.saerok.dy.note.model.dao.NoteDao.deleteNoteById", noteNo);
	    }
	}
