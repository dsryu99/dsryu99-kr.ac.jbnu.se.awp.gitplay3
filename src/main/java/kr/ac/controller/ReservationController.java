package kr.ac.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.service.ReservationService;
import kr.ac.vo.ReservationVO;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@Inject
	ReservationService service;
	
	// 헌혈 예약
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String update(ReservationVO reservationVO, RedirectAttributes rttr) throws Exception {
		logger.info("resWrite");
		
		service.write(reservationVO);

		return "redirect:/reservation/resList";
	}
	

	// 예약 목록 조회 
	@RequestMapping(value = "/resList", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("reslist");

		model.addAttribute("reslist", service.list());

		return "reservation/resList";
	}
	
	// 예약받은 목록
	@RequestMapping(value = "/receivedResList", method = RequestMethod.GET)
	public String receivedlist(Model model) throws Exception {
		logger.info("reslist");

		model.addAttribute("reslist", service.list());

		return "reservation/receivedResList";
	}
	
	// 예약 확정 
	@RequestMapping(value = "/confirm", method = {RequestMethod.GET, RequestMethod.POST})
	public String confirm(ReservationVO reservationVO) throws Exception {
		System.out.println(reservationVO.getBno());
		service.confirm(reservationVO.getBno());

		return "redirect:/reservation/resList";
	}
	
	// 예약 취소
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(ReservationVO reservationVO, RedirectAttributes rttr) throws Exception {
		logger.info("delete");
		service.delete(reservationVO.getBno());

		return "redirect:/reservation/resList";
	}	
}