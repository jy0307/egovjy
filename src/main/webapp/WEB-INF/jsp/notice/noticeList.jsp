<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jsp/notice/inc/header.jsp"%>
</head>
<script>
	function fn_egov_select_List(pageNo) {
		document.boardListFrm.pageIndex.value = pageNo;
		document.boardListFrm.action = "<c:url value='/noticeList.do'/>";
		document.boardListFrm.submit();
	}
	function fn_write() {

		document.noticeListFrm.action = "<c:url value='/noticeWritePage.do'/>";
		document.noticeListFrm.submit();
	}

	function fn_detail(bno) {
		document.noticeListFrm.bno.value = bno;
		document.noticeListFrm.action = "<c:url value='/noticeView.do'/>";
		document.noticeListFrm.submit();
	}
	function fn_searchKeyPressed(event) {
		if (event.keyCode == 13) {
			fn_egov_select_List('1');
		}
	}

	function fn_reset_searchWrd() {
		document.boardListFrm.searchCnd1.value = 0;
		document.boardListFrm.searchWrd.value = "";
	}
</script>
<body>
	<form name="noticeListFrm" id="noticeListFrm" method="post">
		<input type="hidden" name="bno" value="${noticeVO.bno}" /> <input
			type="hidden" name="pageIndex" value="${searchVO.pageIndex}" /> <input
			type="hidden" name="pageUnit" value="${searchVO.pageUnit}" />
		<!-- s:container -->
		<div class="container">
			<div class="inner">
				<ul class="sub_nav">
					<li>홈</li>
					<li>알림마당</li>
					<li>공지사항</li>
				</ul>

				<div class="titleBox">
					<h1>공지사항</h1>
				</div>

				<div class="category">
					<a href="#LINK" class="on">공지사항</a> <a href="#LINK">홍보자료</a> <a
						href="#LINK">FAQ</a>
				</div>

				<div class="table_wrap">
					<div class="search_area">
						<div class="table_count">
							<p>
								전체 <b><c:out value="${paginationInfo.totalRecordCount}" /></b>개
							</p>
							<select name="recordCountPerPage"
								onchange="fn_egov_select_List('1')">
								<option value="1"
									<c:out value="${paginationInfo.recordCountPerPage == 1 ? 'selected' : ''}"/>>1</option>
								<option value="10"
									<c:out value="${paginationInfo.recordCountPerPage == 10 ? 'selected' : ''}"/>>10</option>
								<option value="20"
									<c:out value="${paginationInfo.recordCountPerPage == 20 ? 'selected' : ''}"/>>20</option>
								<option value="40"
									<c:out value="${paginationInfo.recordCountPerPage == 40 ? 'selected' : ''}"/>>40</option>
								<option value="60"
									<c:out value="${paginationInfo.recordCountPerPage == 60 ? 'selected' : ''}"/>>60</option>
								<option value="100"
									<c:out value="${paginationInfo.recordCountPerPage == 100 ? 'selected' : ''}"/>>100</option>
							</select> <span>개씩 보기</span>
						</div>
						<div class="table_search">
							<select class="select2" name="searchCnd1">
								<option value="0"
									<c:if test='${searchVO.searchCnd1 == "0"}'> selected </c:if>>전체</option>
								<option value="1"
									<c:if test='${searchVO.searchCnd1 == "1"}'> selected </c:if>>제목</option>
								<option value="2"
									<c:if test='${searchVO.searchCnd1 == "2"}'> selected </c:if>>내용</option>
							</select>
							<div class="search_box">
								<input type="text" name="searchWrd"
									value="<c:out value="${searchVO.searchWrd }"/>"
									onkeypress="javascript:fn_searchKeyPressed(event);"
									placeholder="검색어를 입력하세요."><a href="#LINK"><img
									src="../../assets/images/ico_search.png" class="searchIcon"
									onclick="javascript:fn_egov_select_List('1')" alt="검색하기"></a>
							</div>
							<button class="btn06 btn_grey2 search_reset"
								onclick="javascript:fn_reset_searchWrd()">초기화</button>
						</div>
					</div>
					<table class="st03 notice_list">
						<caption>공지사항 목록을 정렬하였으며 번호, 제목, 첨부파일, 작성자, 작성일자, 조회를
							제공합니다.</caption>
						<colgroup>
							<col width="5%">
							<col>
							<col width="6.43%">
							<col width="8.125%">
							<col width="9.375%">
							<col width="5%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="noticeVO" varStatus="status">
								<c:choose>
									<c:when test="${noticeVO.fixtop eq 1}">
										<tr class="notice_top">
											<td><span>공지</span></td>
											<td><a href="#LINK"
												onclick="fn_detail('${noticeVO.bno}')">${noticeVO.title}</a></td>
											<td></td>
											<td>${noticeVO.user}</td>
											<td>${noticeVO.regdate}</td>
											<td>${noticeVO.view}</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td><c:out
													value="${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }" /></td>
											<td><a href="#LINK"
												onclick="fn_detail('${noticeVO.bno}')">${noticeVO.title}</a></td>
											<td></td>
											<td>${noticeVO.user}</td>
											<td>${noticeVO.regdate}</td>
											<td>${noticeVO.view}</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${empty list}">
						<tr>
							<td colspan="6">조회된 내역이 없습니다.</td>
						</tr>
					</c:if>
						</tbody>
					</table>

					<div class="page">
						<div>
							<ui:pagination paginationInfo="${paginationInfo}" type="bbs"
								jsFunction="fn_egov_select_List" />
						</div>
						<button class="add" onclick="fn_write()" type="button">등록</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- e:container -->
	<%@ include file="/WEB-INF/jsp/notice/inc/footer.jsp"%>
</body>
</html>