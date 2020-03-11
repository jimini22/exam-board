package org.ji.controller;

import javax.inject.Inject;

import org.ji.service.BoardService;
import org.ji.vo.BoardVO;
import org.ji.vo.Criteria;
import org.ji.vo.PageMaker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {
		logger.info("writeView");
		
		return "/board/writeView"; 
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)	//value는 url
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		
		service.write(boardVO);
		
		return "/board/list"; 
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception {			//oracle(DB) > dao > service > controller로 가져온 데이터들을 model 이라는 그릇에 담을거임
		logger.info("list");
		
		model.addAttribute("list", service.list(cri));		//service.list()에 담긴 데이터를 'list'라는 이름으로 담을거임
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/board/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));		//bno값들은 BoardVO에 들어있기 때문에 서비스를 실행할 때 그 번호를 넣어주어서 read라는 이름으로 값을 저장한다
		
		return "/board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception {
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "/board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception { 
		logger.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/list";
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception { 
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/board/list";
	}
	
}
