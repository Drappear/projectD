package com.drappear.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drappear.spr.domain.BoardDto;
import com.drappear.spr.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper bMapper;
	
	public List<BoardDto> boardList() {
		return bMapper.selectBoardList();
	}

	public BoardDto getBoard(int id) {
		return bMapper.selectBoardById(id);
	}

	public boolean addBoard(BoardDto board) {
		board.setInserted(LocalDateTime.now());
		int cnt = bMapper.insertBoard(board);
		return cnt == 1;
	}

	public boolean updateBoard(BoardDto board) {
		int cnt = bMapper.updateBoard(board);
		return cnt == 1;
	}

	public boolean deleteBoardById(int id) {
		int cnt = bMapper.deleteBoard(id);
		return cnt == 1;
	}

}
