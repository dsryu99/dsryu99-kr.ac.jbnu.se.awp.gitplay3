package kr.ac.service;

import java.util.List;

import kr.ac.vo.BoardVO;
import kr.ac.vo.ReservationVO;
import kr.ac.vo.SearchCriteria;

public interface ReservationService {
	

		public void write(ReservationVO reservationVO) throws Exception;
		

		public List<ReservationVO> list() throws Exception;
		
		public List<ReservationVO> receivedList() throws Exception;

		public int listCount(SearchCriteria scri) throws Exception;
			
		public ReservationVO read(int bno) throws Exception;
			
		public void delete(int bno) throws Exception;
		
		public void confirm(int bno) throws Exception;

}
