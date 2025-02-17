<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  
	<h2>게시글 수정</h2>
	<form action="/Board/Update?bno=${ vo.bno }&menu_id=${ vo.menu_id }" method="POST">
	<table>
	 <tr>
	   <td>제목</td>
	   <td><input type="text" name="title" value="${ vo.title }"/></td>
	 </tr>
	 <tr>
	   <td>작성자</td>
	   <td><input type="text" name="writer" value="${ vo.writer }"/></td>
	 </tr>
	 <tr>
	   <td>내용</td>
	   <td><textarea name="content">${ vo.content }</textarea></td>
	 </tr>	
	 <tr>
	   <td colspan="2">
	    <input type="submit" value="수정" />
	    <input type="button" value="목록" id="goList" />
	   </td>
	 </tr>
	
	</table>	
	</form>   
	
  </main>
  
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Board/List';
  	})
  
  </script>
  
</body>
</html>





