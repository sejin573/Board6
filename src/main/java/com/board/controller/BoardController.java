package com.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;
import com.board.user.domain.UserVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {

	@Autowired
	private   MenuMapper    menuMapper;
	
	@Autowired
	private   BoardMapper   boardMapper;
	
	//  /Board/List?menu_id=MENU01
	@RequestMapping("/List")
	public   ModelAndView   list(MenuVo  menuVo) {
		
		log.info("menuVo : {}", menuVo );
		
		// 메뉴 목록
		List<MenuVo>  menuList   =  menuMapper.getMenuList();
		
		// 게시물 목록
		List<BoardVo> boardList  =  boardMapper.getBoardList( menuVo  );
		System.out.println( boardList );
				
		String menu_id = menuVo.getMenu_id();
		
		ModelAndView  mv         =  new ModelAndView();
		mv.addObject("menu_id", menu_id);
		mv.addObject("menuList",   menuList );
		mv.addObject("boardList",  boardList );
		mv.setViewName("board/list");
		return   mv;
		
	}
	
	//  /Board/WriteForm?menu_id=MENU02
	@RequestMapping("/WriteForm")
	public  ModelAndView   writeForm(MenuVo menuVo) {
		
		String menu_id = menuVo.getMenu_id();
		List<MenuVo> menuList = menuMapper.getMenuList();
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menuList",menuList);
		mv.addObject("menu_id",menu_id);
		mv.setViewName("board/write");
		return mv;	
		
	}
	@RequestMapping("Write")
	public ModelAndView write(BoardVo boardVo) {
		
		//넘어온 값 저장
		
		String menu_id = boardVo.getMenu_id();
		boardMapper.insertBoard(boardVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id="+ menu_id);
		return mv;
	}
	@RequestMapping("View")
	public ModelAndView view(BoardVo boardVo) {

		List<MenuVo> menuList = menuMapper.getMenuList();
		
		boardMapper.incHit(boardVo);
		
		
		HashMap<String, Object> map = boardMapper.getBoard(boardVo);
		
		String content = (String) map.get("content");
		if(content != null) {
			content           =  content.replace("\n", "<br>");	
			map.put("content", content);
		}
		log.info("map : {}",map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("menuList",menuList);
		mv.addObject("vo", map);
		mv.setViewName("board/view");
		return mv;
	}
	@RequestMapping("/Delete")
	public   ModelAndView   delete( BoardVo boardVo ) {
		
		// 삭제
	
		boardMapper.deleteBoard(boardVo);
		String menu_id = boardVo.getMenu_id();
		ModelAndView  mv  = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return  mv;
	}
	@RequestMapping("UpdateForm")
	public ModelAndView updateForm(BoardVo boardVo) {
		HashMap<String, Object> map = boardMapper.getBoard(boardVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", map);
		mv.setViewName("board/update");
		
		return mv;
	}
	@RequestMapping("/Update")
	public   ModelAndView   update( BoardVo boardVo) {
		
		log.info( "boardVo : {}",  boardVo  );
		// 수정
		
		boardMapper.updateBoard( boardVo ); 
		String menu_id = boardVo.getMenu_id();
		ModelAndView   mv  =  new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return  mv;
	}
}
	







