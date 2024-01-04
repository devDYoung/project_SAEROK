package com.saerok.dy.note.model.dao;

import com.saerok.dy.note.model.dto.NoteDTO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoteDaoImpl implements NoteDao {

    private final JdbcTemplate jdbcTemplate;

    public NoteDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void insert(NoteDTO note) {
        String sql = "INSERT INTO notes (sender, recipient, subject, content) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, note.getSender(), note.getRecipient(), note.getSubject(), note.getContent());
    }
}
