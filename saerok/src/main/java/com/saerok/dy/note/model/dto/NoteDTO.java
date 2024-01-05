package com.saerok.dy.note.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoteDTO {
    private String sender;
    private String recipient;
    private String subject;
    private String content;
}
