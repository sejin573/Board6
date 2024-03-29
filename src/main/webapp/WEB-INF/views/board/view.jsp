<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
   input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: black;
      color : white;
      font-weight: bold;
   }
   #tr{
   padding:10px;
      width: 200px;
      text-align: center;
   background: black;
      color : white;
      font-weight: bold;
      
      
   }
   #con {
   text-align: left;
   vertical-align: top;
   }
   input[readonly] {
      background: #EEE;
   }
   textarea {
	height: 300px;
	width: 100%;
}

</style>
</head>
<body>
  <main>
  
  <%@include file="/WEB-INF/include/menus.jsp" %>
	<h2>게시글 내용 조회</h2>
	<table>
 	 <tr>
	   <td id="tr">메뉴</td>
	   <td colspan="3">${ vo.mname}</td>
	 </tr>
	 <tr>
	   <td id="tr">제목</td>
	   <td colspan="3">${ vo.title }</td>
	 </tr>
	<tr>
	   <td id="tr">게시글 번호</td>
	   <td>${ vo.bno }</td>
	   <td id="tr">조회수</td>
	   <td>${ vo.hit }</td>
	 </tr>
	 <tr>
	   <td id="tr">작성자</td>
	   <td>${ vo.writer }</td>
	   <td id="tr">작성일</td>
	   <td>${ vo.regdate }</td>
	 </tr>
	 <tr style="height: 400px; text-align: left;">
	   <td id="tr">내용</td>
	   <td colspan="3" id="con">${ vo.content }</td>
	 </tr>
	 <tr>
	   <td colspan="4">
	     
	    <a class="btn btn-primary btn-sm" role="button"
	     href="/Board/UpdateForm?bno=${ vo.bno }&menu_id=${ vo.menu_id }">게시글 수정</a>
	     
	    <a class="btn btn-primary btn-sm" role="button" 
	    href="/Board/Delete?menu_id=${ vo.menu_id }&bno=${ vo.bno }" >게시글삭제</a>
	    
	    <a class="btn btn-primary btn-sm" role="button" 
	    href="/Board/List?menu_id=${ vo.menu_id }" >목록</a>
	    
	    <a class="btn btn-primary btn-sm" role="button" 
	    href="/Board/List?menu_id=${ vo.menu_id }" >이전</a>
	    
	    <a class="btn btn-primary btn-sm" role="button" 
	    href="/" >Home</a> 
	   </td>
	 </tr>
	</table>	
	
  </main>
  
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Board/List';
  	})
  
  </script>
  
</body>
</html>





