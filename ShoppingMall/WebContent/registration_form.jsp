<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
	<%@ include file="nav.jsp"%>
	<div class="container"> 
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron"  style="margin-top:10%;"> 
					<h3> 회원가입 페이지 </h3>
					<form class="form-inline" action="registration.jsp" method="POST">
						
						<div class="form-group">
							<input type="email" class="form-control" id="id" placeholder="아이디(이메일)" name="memId" maxlength="40">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password" placeholder="비밀번호" name="memPassword" maxlength="30">
						</div>
					
						<div class="form-group">
							<input type="text" class="form-control" id="memName" placeholder="이름" name="memName" maxlength="20">
						</div>
						
						<div class="form-group" style="text-align:center;">
							<div class="btn-group" data-toggle="buttons"> 
								<label class="btn btn-success active">
									<input type="radio" name="memGender" autocomplete="off" value="man" checked> 남자
								</label>
								<label class="btn btn-success">
									<input type="radio" name="memGender" autocomplete="off" value="woman"> 여자
								</label>
							</div>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" id="memBirth" placeholder="생년월일" name="memBirth" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="memPhone" placeholder="휴대폰번호" name="memPhone" maxlength="20">
						</div>
									
						<button type="submit" class="btn btn-success btn-lg btn-block" >가입하기</button>
					</form>
			</div>
		</div>
	</div>
</body>

</html>