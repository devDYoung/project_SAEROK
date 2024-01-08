package com.saerok.dy.note.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.saerok.dy.note.model.dto.Note;
import com.saerok.dy.note.model.service.NoteService;

@Controller
public class NoteController {

    private final NoteService noteService;

    @Autowired
    public NoteController(NoteService noteService) {
        this.noteService = noteService;
    }

    @GetMapping("/noteWrite")
    public String noteWritePage(Model model) {
        return "note/noteWrite";
    }

    @PostMapping("/noteWrite")
    public String writeNote(Note note) {
        noteService.writeNote(note);
        return "redirect:/noteWrite";
    }
    
    @GetMapping("/noteRead")
    public String readNotePage(Model model) {
        List<Note> receivedNotes = noteService.getReceivedNotes();
        model.addAttribute("receivedNotes", receivedNotes);
        return "note/noteRead";
    }
}