package com.saerok.dy.note.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saerok.dy.note.model.dao.NoteDao;
import com.saerok.dy.note.model.dto.Note;

@Service
public class NoteServiceImpl implements NoteService {

    private final NoteDao noteDao;

    @Autowired
    public NoteServiceImpl(NoteDao noteDao) {
        this.noteDao = noteDao;
    }

    @Override
    public void writeNote(Note note) {
        noteDao.insert(note);
    }

    @Override
    public List<Note> getReceivedNotes() {
        return noteDao.getReceivedNotes();
    }

    @Override
    public List<Note> getSentNotes() {
        return noteDao.getSentNotes();
    }

    @Override
    public List<Note> getDeletedNotes() {
        return noteDao.getDeletedNotes();
    }

    @Override
    public void deleteNote(int noteNo) {
        noteDao.deleteNoteById(noteNo);
    }
}