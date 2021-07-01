package notice.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import notice.service.NoticeVO;
import notice.service.SearchVO;

@Repository("NoticeDAO")
public class NoticeDAO extends EgovComAbstractDAO{
	public List<?> selectNoticeList (SearchVO searchVO) throws Exception {
	  return selectList("NoticeDAO.selectNoticeList", searchVO);
	 }
	
	public int selectNoticeListCnt(SearchVO searchVO) throws Exception {
		return (Integer) selectOne("NoticeDAO.selectNoticeListCnt", searchVO);
	}
	
	public EgovMap selectDetailNotice(NoticeVO noticeVO) throws Exception {
		return selectOne("NoticeDAO.selectDetailNotice", noticeVO);
	}
	
	public void noticeWriteAction(NoticeVO noticeVO)throws Exception{
		insert("NoticeDAO.noticeWriteAction", noticeVO);
	}
	
	public EgovMap selectNoticeDetail(NoticeVO noticeVO) throws Exception {
		return selectOne("NoticeDAO.selectNoticeDetail", noticeVO);
	}
	
	public void noticeDeleteAction(NoticeVO noticeVO)throws Exception{
		delete("NoticeDAO.noticeDeleteAction", noticeVO);
	}
	
	public void noticeUpdateAction(NoticeVO noticeVO)throws Exception{
		update("NoticeDAO.noticeUpdateAction", noticeVO);
	}
	
	public void noticeUpdateCount(NoticeVO noticeVO) throws Exception{
		update("NoticeDAO.noticeUpdateCount", noticeVO);
	}
	
}