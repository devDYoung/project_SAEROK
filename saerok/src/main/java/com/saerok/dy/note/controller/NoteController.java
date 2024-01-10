package com.saerok.dy.note.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saerok.dy.note.model.dto.Note;
import com.saerok.dy.note.model.service.NoteService;

@Controller
@RequestMapping("/note")
public class NoteController {

    private final NoteService noteService;

    @Autowired
    public NoteController(NoteService noteService) {
        this.noteService = noteService;
    }

    // 쪽지 쓰기 페이지로 이동
    @GetMapping("/write")
    public String noteWritePage(Model model) {
        return "note/noteWrite";
    }

     // 받은 쪽지함 페이지로 이동
    @GetMapping("/get")
    public String readNotePage(Model model) {
    	
        return "note/noteRead";
    }

    // 보낸 쪽지함 페이지로 이동
    @GetMapping("/send")
    public String sendNotePage(Model model) {
        return "note/noteSend";
    }

    // 휴지통 페이지로 이동
    @GetMapping("/basket")
    public String deleteNotePage(Model model) {
        return "note/noteDelete";
    }

    
}
