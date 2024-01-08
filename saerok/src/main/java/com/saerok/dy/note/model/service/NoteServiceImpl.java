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
        // 여기서 적절한 DAO 메서드를 호출하여 받은 쪽지함을 가져옵니다.
        // 예를 들어, NoteDao의 getReceivedNotes 메서드를 호출할 수 있습니다.
        return noteDao.getReceivedNotes();
    }
    
    
    
}