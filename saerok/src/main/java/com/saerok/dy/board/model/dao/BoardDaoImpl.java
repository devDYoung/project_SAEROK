
package com.saerok.dy.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saerok.dy.board.model.dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
   
   private final SqlSession sqlSession;
   
   public BoardDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

   // 전체게시판 조회
   @Override
   public List<Board> boardAll(SqlSession session) {
      return session.selectList("board.boardAll");
   }

   // 부서별 게시판 조회
   @Override
   public List<Board> boardPart(SqlSession session) {
      return session.selectList("board.boardPart");

   }
   
   // 게시글 저장
   @Override
   public void save(Board board) {
      sqlSession.insert("board.save",board);
   }
}