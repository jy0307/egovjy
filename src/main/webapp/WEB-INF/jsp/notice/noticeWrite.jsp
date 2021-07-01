<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file ="/WEB-INF/jsp/notice/inc/header.jsp" %>
</head>
<script>
function fn_save(){
	document.noticeWriteFrm.action = "<c:url value='/noticeWriteAction.do'/>";
	document.noticeWritefrm.submit();
}

function fn_checked(obj){
	 var checked = obj.checked;
	 if(checked) {
	  obj.value = "1";
	 } else {
	  obj.value = "0";
	 }
	}
</script>
<body>
<form name="noticeWriteFrm" id="noticeWriteFrm" method = "post" enctype="multipart/form-data">
   <input type="hidden" name="bno" value="${noticeVO.bno}" />
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
                    <a href="#LINK" class="on">공지사항</a>
                    <a href="#LINK">홍보자료</a>
                    <a href="#LINK">FAQ</a>
                </div>
                
                <div class="table_wrap">
                    <table class="st02">
                        <caption>협의체 네트워킹을 정렬하였으며 제목, 협의체, 작성자, 첨부파일, 내용을 제공합니다.</caption>
                        <colgroup>
                            <col width="7.81%">
                            <col>
                            <col width="7.81%">
                            <col width="18.25%">
                        </colgroup>
                        
                        <tr>
                            <th>제목</th>
                            <td colspan="3">
                                <input type="text" class="inputW1000" name="title">
                            </td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <input type="text" name ="user">
                            </td>
                     
                            <th>상단고정</th>
                            <td>
                                <input type="checkbox" id="fixtop" value="0" name="fixtop" onchange="fn_checked(this)">
                                <label for="fixtop"></label>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3" class="file">
                                <div>
                                    <input type="text" class="inputW600">
                                    <button type="button" class="btn12 btn_grey">파일선택</button>
                                </div>
                                <div>
                                    <p>협의체 네트워킹 소개.pdf</p>
                                    <button type="button"><img src="../../assets/images/file_delete.png"></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="table_text" > <textarea name="content"></textarea></td>
                        </tr>
                    </table>
                    
                    <div class="tableBtn_area">
                        <div class="leftBtn">
                            <a href="#LINK" class="btn10 btn_grey_line" onclick="fn_cancel()">취소</a>
                        </div>
                        <div class="rightBtn">
                            <button class="btn10 btn_blue" onclick="fn_save()">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- e:container -->
        <%@ include file ="/WEB-INF/jsp/notice/inc/footer.jsp" %>
</body>
</html>