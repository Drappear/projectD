package com.drappear.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drappear.spr.domain.BoardDto;
import com.drappear.spr.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// http://localhost:8080/spr/board/list
	@GetMapping("list")
	public String BoardMainList(Model model) {
		List<BoardDto> boardList = bService.boardList();		
		model.addAttribute("boardList", boardList);
		return "/myApp/boardList";
	}
}
