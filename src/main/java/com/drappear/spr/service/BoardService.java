package com.drappear.spr.service;

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

}
