package com.saerok.dy.note.model.dao;

import java.util.List;

import com.saerok.dy.note.model.dto.NoteDTO;

public interface NoteDao {
    void insert(NoteDTO note);

    // 받은쪽지함
    List<NoteDTO> getReceivedNotes();
    
    // 보낸쪽지함
}
