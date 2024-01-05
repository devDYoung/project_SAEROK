package com.saerok.dy.note.model.service;

import java.util.List;

import com.saerok.dy.note.model.dto.NoteDTO;

public interface NoteService {
    void writeNote(NoteDTO note);
    
    List<NoteDTO> getReceivedNotes();
}
