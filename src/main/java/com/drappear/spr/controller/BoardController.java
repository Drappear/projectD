package com.drappear.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drappear.spr.domain.BoardDto;
import com.drappear.spr.domain.ReplyDto;
import com.drappear.spr.service.BoardService;
import com.drappear.spr.service.ReplyService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	@Autowired
	private ReplyService rService;
	
	// http://localhost:8080/spr/board/list
	@GetMapping("list")
	public String boardGetMainList(Model model) {
		List<BoardDto> boardList = bService.boardList();		
		model.addAttribute("boardList", boardList);
		return "/myApp/boardList";
	}
	
	@PostMapping("list")
	public String boardPostMainList(Model model) {
		List<BoardDto> boardList = bService.boardList();		
		model.addAttribute("boardList", boardList);
		return "redirect:/board/list";
	}
	
	@GetMapping("get/{id}")
	public String boardGetById(Model model, @PathVariable("id") int boardId) {
		BoardDto board = bService.getBoard(boardId);
		List<ReplyDto> replyList = rService.getReplyList(boardId);
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		
		return "/myApp/boardGet";
	}
	
	@GetMapping("write")
	public String boardWriteForm() {
		return "/myApp/boardWrite";
	}
	
	@PostMapping("write")
	public String boardWrite(BoardDto board) {
		boolean success = bService.addBoard(board);
		if(success) {
			
		} else {
			
		}
		
		return "redirect:/board/get/" + board.getId();
	}
	
	@PostMapping("edit")
	public String boardEdit(Model model, BoardDto board) {
		model.addAttribute("board", board);
		return "/myApp/boardUpdate";
	}
	
	@PostMapping("update")
	public String boardUpdate(BoardDto board) {
		boolean success = bService.updateBoard(board);
		if(success) {
			
		} else {
			
		}
		
		return "redirect:/board/get/" + board.getId();
	}
	
	@PostMapping("delete")
	public String deleteBoard(int id) {
		boolean success = bService.deleteBoardById(id);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/board/list";
	}
}
