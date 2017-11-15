<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" href="css/loginAndRegist.css">
	</head>
	<body>
	<%@ include file="nav.jsp" %>
	
    <!--  로그인 화면 구현 시 -->
	<div class="container" style="margin-top:60px;">
		<div class="col-lg-4"></div> <!-- 4grid 만큼 빼준다. -->
			<div class="col-lg-4">
				<form class="form-inline" action="login.jsp" method="POST">
					<table class="table-condensed">
						<thead>
							<tr>
								<td><h3 id="loginText" style="text-align:center;"> 로그인 화면 </h3></td>
							</tr>									
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="form-group has-success has-feedback">
										<input type="email" class="form-control"  placeholder="이메일" name="memId" size="36%">
										<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group has-success has-feedback">
										<input type="password" class="form-control"  placeholder="비밀번호" name="memPassword" size="36%">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" class="btn btn-success btn-block form-control"  value="로그인">
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<input type="checkbox" id="checkbox" class="form-check-input"> 로그인 상태 유지<br>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group" style="text-align:center;">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="#"> 이메일 찾기 </a></li>
											<li class="breadcrumb-itme"><a href="#"> 비밀번호 찾기 </a></li>
											<li class="breadcrumb-item"><a href="registration_form.jsp"> 회원가입 </a></li>
										</ol>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
	</div>
	</body>
</html>
