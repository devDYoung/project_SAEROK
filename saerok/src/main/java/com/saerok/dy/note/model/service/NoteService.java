package com.saerok.dy.note.model.service;

import java.util.List;

import com.saerok.dy.note.model.dto.Note;

public interface NoteService {
   

    // 받은 쪽지함 가져오기
    List<Note> getReceivedNotes(String rcvEmpNo);
    
    void writeNote(Note note);

    // 보낸 쪽지함 가져오기
    List<Note> getSentNotes();

    // 삭제된 쪽지함 가져오기
    List<Note> getDeletedNotes();

    // 쪽지 삭제 처리
    void deleteNote(int noteNo);
}
