package com.drappear.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.drappear.spr.domain.BoardDto;

public interface BoardMapper {

	List<BoardDto> selectBoardList(@Param("from") int from, @Param("rowPerPage") int rowPerPage);

	BoardDto selectBoardById(int id);

	int insertBoard(BoardDto board);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int totalBoard();

}
