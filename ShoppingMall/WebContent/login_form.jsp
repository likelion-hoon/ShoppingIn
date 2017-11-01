<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<body>
		<%@ include file="nav.jsp" %>
		
	    <!--  로그인 화면 구현 시 -->
		<div class="container">
			<div class="col-lg-4"></div> <!-- 4grid 만큼 빼준다. -->
				<div class="col-lg-4">
					<div class="jumbotron" style="margin-top:10%;padding-top:20px;"> 
						<form class="form-inline" action="login.jsp" method="POST">
			
							<h3 style="text-align:center;"> 로그인 화면 </h3>
			
							<div class="form-group">
								<input type="text" class="form-control"  placeholder="아이디" name="memId">
							</div>
							<div class="form-group">
								<input type="password" class="form-control"  placeholder="비밀번호" name="memPassword">
							</div>
							
							<input type="submit" class="btn btn-success btn-block form-control" 
							style="margin-bottom:10px;" value="로그인">
							
							
							<input type="checkbox" class="form-check-input" style="margin-top:10-px;margin-bottom:10px"> 로그인 상태 유지<br>
			
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"> 아이디 찾기 </a></li>
								<li class="breadcrumb-itme"><a href="#"> 비밀번호 찾기 </a></li>
								<li class="breadcrumb-item"><a href="registration_form.jsp"> 회원가입 </a></li>
							</ol>
						</form>
					</div>
				</div>
		</div>
	</body>
</html>
