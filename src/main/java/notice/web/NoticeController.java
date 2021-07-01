package notice.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import notice.service.NoticeVO;
import notice.service.SearchVO;
import notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@RequestMapping(value = "/noticeList.do")
	public String noticeListDo(@ModelAttribute("noticeVO") NoticeVO noticeVO
			                  ,@ModelAttribute("searchVO") SearchVO searchVO
			                  , Model model) throws Exception {
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		List<?> listData =  noticeService.selectNoticeList(searchVO);
        int totalCnt = noticeService.selectNoticeListCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totalCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("list", listData);
		return "notice/noticeList";
	}
	
	@RequestMapping(value = "/noticeWritePage.do")
	public String noticeWritheDo(@ModelAttribute("noticeVO") NoticeVO noticeVO
			, Model model) throws Exception {
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/noticeWrite";
	}
	
	@RequestMapping("/noticeWriteAction.do")
	public String noticeWriteAction(@ModelAttribute("noticeVO") NoticeVO noticeVO
							, RedirectAttributes redirectAttributes) throws Exception {
		
		noticeService.noticeWriteAction(noticeVO);
		
		return "redirect:/noticeList.do";
		
	}
	
	@RequestMapping("/noticeView.do")
	public String noticeViewDo(@ModelAttribute("noticeVO") NoticeVO noticeVO
							, ModelMap model) throws Exception {
		
		EgovMap resultVO = noticeService.selectNoticeDetail(noticeVO);
		
	    noticeService.noticeUpdateCount(noticeVO);
		
		int bno = (int) resultVO.get("bno");
		model.addAttribute("resultVO", resultVO);
		
		return "notice/noticeView";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String boardDelete(@ModelAttribute("noticeVO") NoticeVO noticeVO
							, RedirectAttributes redirectAttributes) throws Exception {

		noticeService.noticeDeleteAction(noticeVO);
		
		return "redirect:/noticeList.do";
	}
	
	@RequestMapping("noticeUpdatePage.do")
	public String boardUpdatePage(@ModelAttribute("noticeVO") NoticeVO noticeVO
							, ModelMap model) throws Exception {
		
		EgovMap resultVO = noticeService.selectNoticeDetail(noticeVO);
		
		model.addAttribute("resultVO", resultVO);
		return "notice/noticeUpdate";
	}
	
	@RequestMapping("/noticeUpdateAction.do")
	public String noticeUpdateAction(@ModelAttribute("noticeVO") NoticeVO noticeVO
							, RedirectAttributes redirectAttributes) throws Exception {
		
		noticeService.noticeUpdateAction(noticeVO);
		return "redirect:/noticeList.do";
		
	}
}
