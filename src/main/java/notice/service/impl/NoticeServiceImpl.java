package notice.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import notice.service.NoticeService;
import notice.service.NoticeVO;
import notice.service.SearchVO;

@Service("NoticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {
 
	@Resource(name = "NoticeDAO")
	private NoticeDAO noticeDAO;
	
	@Resource(name = "egovNttCodeGnrService")
	private EgovIdGnrService egovNttCodeGnrService;
	
	@Override
	public List<?> selectNoticeList(SearchVO searchVO) throws Exception {
	     return noticeDAO.selectNoticeList(searchVO);
	     }
	
	@Override
	public int selectNoticeListCnt(SearchVO searchVO) throws Exception {
		return noticeDAO.selectNoticeListCnt(searchVO);
	}
	
	@Override
	public void noticeWriteAction(NoticeVO noticeVO) throws Exception{
		int popupCode = egovNttCodeGnrService.getNextIntegerId();
		noticeVO.setBno(popupCode);
		
		noticeDAO.noticeWriteAction(noticeVO);
	} 
	
	@Override
	public EgovMap selectNoticeDetail(NoticeVO noticeVO) throws Exception{
		return noticeDAO.selectNoticeDetail(noticeVO);
	}
	
	@Override
	public void noticeDeleteAction(NoticeVO noticeVO) throws Exception{
		noticeDAO.noticeDeleteAction(noticeVO);
	}
	
	@Override
	public void noticeUpdateAction(NoticeVO noticeVO) throws Exception{
		noticeDAO.noticeUpdateAction(noticeVO);
	}
	
	@Override
	public void noticeUpdateCount(NoticeVO noticeVO) throws Exception{
		noticeDAO.noticeUpdateCount(noticeVO);
	}
	
}
