package notice.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import notice.service.NoticeVO;

public interface NoticeService {
	
    public List<?> selectNoticeList(SearchVO searchVO) throws Exception;
  
    public int selectNoticeListCnt(SearchVO searchVO) throws Exception;
    
    public void noticeWriteAction(NoticeVO noticeVO)throws Exception;
    
    public EgovMap selectNoticeDetail(NoticeVO noticeVO)throws Exception;
 
    public void noticeDeleteAction(NoticeVO noticeVO)throws Exception;
    
    public void noticeUpdateAction(NoticeVO noticeVO)throws Exception;
    
    public void noticeUpdateCount(NoticeVO noticeVO) throws Exception;
}
