package com.saerok.dy.note.model.dao;

import java.util.List;

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

    @Override
    public List<NoteDTO> getReceivedNotes() {
        // 여기에 받은 쪽지함을 가져오는 적절한 SQL 쿼리 및 JDBC 로직을 추가합니다.
        // 예를 들어, SELECT 문을 사용하여 받은 쪽지함을 가져올 수 있습니다.
        return null;
    }
}
