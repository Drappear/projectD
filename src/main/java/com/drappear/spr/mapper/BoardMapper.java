package com.drappear.spr.mapper;

import java.util.List;

import com.drappear.spr.domain.BoardDto;

public interface BoardMapper {

	List<BoardDto> selectBoardList();

	BoardDto selectBoardById(int id);

	int insertBoard(BoardDto board);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

}
