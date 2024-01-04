package com.saerok.dy.note.model.service;

import com.saerok.dy.note.model.dao.NoteDao;
import com.saerok.dy.note.model.dto.NoteDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoteServiceImpl implements NoteService {

    private final NoteDao noteDao;

    @Autowired
    public NoteServiceImpl(NoteDao noteDao) {
        this.noteDao = noteDao;
    }

    @Override
    public void writeNote(NoteDTO note) {
        noteDao.insert(note);
    }
}
