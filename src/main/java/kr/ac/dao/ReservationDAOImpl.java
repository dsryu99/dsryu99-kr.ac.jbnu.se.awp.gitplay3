package kr.ac.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.vo.ReservationVO;
import kr.ac.vo.SearchCriteria;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(ReservationVO ReservationVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("reservationMapper.insert", ReservationVO);

	}

	@Override
	public List<ReservationVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservationMapper.listPage");
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.listCount", scri);
	}

	@Override
	public ReservationVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.read", bno);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("reservationMapper.delete", bno);
	}

	@Override
	public List<ReservationVO> receivedList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservationMapper.listPage");
	}

	@Override
	public void confirm(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("reservationMapper.confirm", bno);
	}


}
