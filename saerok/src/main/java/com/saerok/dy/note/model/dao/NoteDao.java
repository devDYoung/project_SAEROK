package com.saerok.dy.note.model.dao;

import java.util.List;

import com.saerok.dy.note.model.dto.Note;

public interface NoteDao {
    void insert(Note note);

    // 받은쪽지함
    List<Note> getReceivedNotes();
    
    // 보낸쪽지함
}