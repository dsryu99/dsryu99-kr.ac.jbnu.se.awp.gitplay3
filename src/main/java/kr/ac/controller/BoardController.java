package kr.ac.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.service.BoardService;
import kr.ac.service.ReplyService;
import kr.ac.service.ReservationService;
import kr.ac.vo.BoardVO;
import kr.ac.vo.PageMaker;
import kr.ac.vo.ReplyVO;
import kr.ac.vo.ReservationVO;
import kr.ac.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService boardService;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	ReservationService reservationService;
	
	// 寃뚯떆�뙋 湲� �옉�꽦 get
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");
	}

	// 寃뚯떆�뙋 湲� �옉�꽦 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, 
			@RequestParam(value = "bloodtype") String bloodtype, 
			@RequestParam(value = "bloodtypeRH", required = false) String bRH) throws Exception {
		logger.info("write");
		String bt = bloodtype + "+";
		
		if(bRH != null) {	
			if(bRH.equals("RH-"))
				bt = bloodtype + "-"; 	
		}
		
		boardVO.setBloodtype(bt);
		
		boardService.write(boardVO);

		return "redirect:/board/list";
	}
	
	// 寃뚯떆�뙋 湲� 議고쉶
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", boardService.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = (List<ReplyVO>) replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		return "board/readView";
	}

	// 寃뚯떆�뙋 紐⑸줉 議고쉶
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board/list";

	}

	// 寃뚯떆�뙋 �닔�젙酉�
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("updateView");

		model.addAttribute("update", boardService.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		return "board/updateView";
	}

	// 寃뚯떆�뙋 �닔�젙
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, 
			@RequestParam(value = "bloodtype") String bloodtype, 
			@RequestParam(value = "bloodtypeRH", required = false) String bRH) throws Exception {
		
		logger.info("update");
		
		String bt = bloodtype + "+";
		
		if(bRH != null) {	
			if(bRH.equals("RH-"))
				bt = bloodtype + "-"; 	
		}
		
		boardVO.setBloodtype(bt);
		
		boardService.update(boardVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/list";
	}

	// 寃뚯떆�뙋 �궘�젣 諛� �삁�빟 �엳�쑝硫� �궘�젣
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, ReservationVO reservationVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {
		logger.info("delete");

		boardService.delete(boardVO.getBno());
		reservationService.delete(reservationVO.getBno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/list";
	}
	
	//�뙎湲� �옉�꽦
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		replyService.writeReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/board/readView";
	}
		
	//�뙎湲� �닔�젙 GET
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyUpdate", replyService.selectReply(((kr.ac.vo.ReplyVO) vo).getRno()));
		model.addAttribute("scri", scri);
			
		return "board/replyUpdateView";
	}
		
	//�뙎湲� �닔�젙 POST
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		replyService.updateReply(vo);;
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/board/readView";
	}

	//�뙎湲� �궘�젣 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyDeleteView";
	}
		
	//�뙎湲� �궘�젣 POST
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		replyService.deleteReply(vo);
			
		rttr.addAttribute("bno", (vo.getBno()));
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/board/readView";
	}
	 
}