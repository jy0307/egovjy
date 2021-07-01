package notice.service;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class NTPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	ServletContext servletContext;
	
	public void initVariables(){

		firstPageLabel    = "<a title=\"맨 처음 페이지\" class=\"ago_prev\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><em class=\"sr-only\">맨 처음 페이지</em></a>";
        previousPageLabel = "<a class=\"prev\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><em class=\"sr-only\">이전 페이지</em></a>";
        currentPageLabel  = "<a href=\"#\" class=\"on\">{0}</a>&nbsp;";
        otherPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>&nbsp";
        nextPageLabel     = "<a class=\"next\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><em class=\"sr-only\">다음 페이지</em></a>";
        lastPageLabel     = "<a class=\"ago_next\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><em class=\"sr-only\">맨 끝 페이지</em></a>";

	}



	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}