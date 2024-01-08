package com.saerok.dy.note.model.service;

import java.util.List;

import com.saerok.dy.note.model.dto.Note;

public interface NoteService {
    void writeNote(Note note);
    
    List<Note> getReceivedNotes();
}