package kr.ac.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.dao.ReservationDAO;
import kr.ac.vo.BoardVO;
import kr.ac.vo.ReservationVO;
import kr.ac.vo.SearchCriteria;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Inject
	private ReservationDAO dao;
	
	@Override
	public List<ReservationVO> list() throws Exception {
		// TODO Auto-generated method stub
		
		return dao.list();
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.listCount(scri);
	}

	@Override
	public ReservationVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public void write(ReservationVO reservationVO) throws Exception {
		// TODO Auto-generated method stub
		dao.write(reservationVO);
	}

	@Override
	public List<ReservationVO> receivedList() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void confirm(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.confirm(bno);
	}

}
