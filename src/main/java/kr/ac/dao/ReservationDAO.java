package kr.ac.dao;

import java.util.List;

import kr.ac.vo.ReservationVO;
import kr.ac.vo.SearchCriteria;

public interface ReservationDAO {

	public void write(ReservationVO ReservationVO) throws Exception;
	
	public List<ReservationVO> list() throws Exception;
	
	public List<ReservationVO> receivedList() throws Exception;
	
	public int listCount(SearchCriteria scri)  throws Exception;
	
	public ReservationVO read(int bno) throws Exception;
		
	public void delete(int bno) throws Exception;

	void confirm(int bno) throws Exception;
	
}
