package com.saerok.dy.note.model.dao;

import java.util.List;

import com.saerok.dy.note.model.dto.Note;

public interface NoteDao {
	void insert(Note note);

    // 받은 쪽지함
    List<Note> getReceivedNotes();

    // 보낸 쪽지함
    List<Note> getSentNotes();

    // 삭제된 쪽지함
    List<Note> getDeletedNotes();

    // 쪽지 삭제 처리
    void deleteNoteById(int noteNo);
}