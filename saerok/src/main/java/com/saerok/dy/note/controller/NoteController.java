package com.saerok.dy.note.controller;

import com.saerok.dy.note.model.dto.NoteDTO;
import com.saerok.dy.note.model.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String writeNote(NoteDTO note) {
        noteService.writeNote(note);
        return "redirect:/noteWrite";
    }
}
