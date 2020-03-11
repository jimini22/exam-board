package org.ji.service;

import java.util.List;

import javax.inject.Inject;

import org.ji.dao.BoardDAO;
import org.ji.vo.BoardVO;
import org.ji.vo.Criteria;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
			//dao에 있는 list()함수를 호출해서 반환하겠다
	}
	
	// 게시물 총 갯수
	public int listCount() throws Exception {
		return dao.listCount();
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception { 
		return dao.read(bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception { 
		dao.delete(bno);
	}
	
}