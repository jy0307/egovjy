<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
 
<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
 
<!-- 공통 JavaScript -->
<script type="text/javascript" src="/js/common/jquery.js"></script>
<script type="text/javascript">
 
    $(document).ready(function(){    
        getBoardList();
    });        
    
    /** 게시판 - 상세 페이지 이동 */
    function goBoardDetail(boardSeq){                
        location.href = "/board/boardDetail?boardSeq="+ boardSeq;
    }
    
    /** 게시판 - 작성 페이지 이동 */
    function goBoardWrite(){        
        location.href = "/board/boardWrite";
    }
 
</script>
</head>
<body>
<div id="wrap">
    <div id="container">
        <div class="inner">        
            <h2>게시글 목록</h2>            
            <form id="boardForm" name="boardForm">
                <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
                <input type="hidden" id="current_page_no" name="current_page_no" value="1" />
                
                <div class="page_info">
                    <span class="total_count"><strong>전체</strong> : <span id="total_count" class="t_red">0</span>개</span>
                </div>
                
                <table width="100%" class="table01">
                    <colgroup>
                        <col width="10%" />
                        <col width="25%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col width="20%" />
                    </colgroup>
                    <thead>        
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    
                    </tbody>    
                </table>
            </form>            
            <div class="btn_right mt15">
                <button type="button" class="btn black mr5" onclick="javascript:goBoardWrite();">작성하기</button>
            </div>
        </div>
        
        <div id="pagination"></div>
        
    </div>
</div>
</body>
</html>
