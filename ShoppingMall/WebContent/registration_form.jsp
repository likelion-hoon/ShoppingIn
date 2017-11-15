<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<style type="text/css">
		table {
			width:100%;		
		}
		h5 {
			text-align:center;
		}
	</style>
	<script type="text/javascript"> 
		function registerCheckFunction() {
	
			var memId = $('#memId').val(); 
			$.ajax({
				type: 'POST',
				url: './MemberRegisterCheckServlet',
				data: {memId: memId},
				success: function(result) {
				
					if(result==0) {
						$('#checkMessage').html('이미 존재하는 아이디입니다.');
						$('#checkType').attr('class','modal-content panel-info');
						$('#memId').val("");
					} else if(result==2) {
						$('#checkMessage').html('입력을 해주세요.');
						$('#checkType').attr('class','modal-content panel-warning');
					} else if(result==3){
						$('#checkMessage').html('이메일 형식이 아닙니다.');
						$('#checkType').attr('class','modal-content panel-warning');
						$('#memId').val("");
					} else {
						$('#checkMessage').html('사용할 수 있는 아이디입니다.');
						$('#checkType').attr('class','modal-content panel-success'); 
					}
					$('#checkModal').modal('show'); 
				}
			});
		}
		
		function passwordCheckFunction() {
			var userPassword1 = $('#memPassword').val(); 
			var userPassword2 = $('#re_memPassword').val(); 
			
			if(userPassword1 != userPassword2) {
				$('#passwordCheckMessage').attr('style','color:red;text-align:center');
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			} else  {
				$('#passwordCheckMessage').html(''); 
			} 
		}
		</script>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%
		if(memId != null) {
			session.setAttribute("messageType","오류 메시지"); 
			session.setAttribute("messageContent","현재 로그인이 되어 있는 상태입니다.");
			response.sendRedirect("main.jsp"); 
			return; 
		}
	%>
	
	<div class="container-fluid" style="margin-top:60px;"> 
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<form class="form-inline" action="registration.jsp" method="POST" role="form">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th colspan="3" style="text-align:center;"><h3> 회원 등록 양식 </h3></th>
						</tr>
					</thead>
					
				 	<tbody>
						<tr>
							<td style="width:110px;"><h5> 아이디 </h5></td>
							<td>
								<div class="form-group has-success has-feedback">
									<input type="email" class="form-control" id="memId" placeholder="아이디(이메일)" name="memId" maxlength="40">
									<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
								</div>
							</td>
							<td>
								<div class="form-group">
									<button class="btn btn-success" onclick="registerCheckFunction();" type="button">중복확인 </button>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:110px;"><h5> 비밀번호 </h5></td>
							<td colspan="2">
								<div class="form-group has-success has-feedback">
									<input onkeyup="passwordCheckFunction();" type="password" class="form-control"  id="memPassword" placeholder="비밀번호" name="memPassword" maxlength="30">
									<span class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:110px;"><h5> 비밀번호 확인</h5></td>
							<td colspan="2">
								<div class="form-group has-success has-feedback">
									<input onkeyup="passwordCheckFunction();" type="password" class="form-control" id="re_memPassword" placeholder="비밀번호 재확인" name="re_memPassword" maxlength="30">
									<span class="glyphicon glyphicon-ok-circle form-control-feedback"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:110px;"><h5> 이름 </h5></td>
							<td colspan="2">
								<div class="form-group has-success">
									<input type="text" class="form-control" id="memName" placeholder="이름" name="memName" maxlength="20">
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:110px;"><h5> 성별 </h5></td>
							<td>
								<div class="form-group">
									<div class="btn-group" data-toggle="buttons"> 
										<label class="btn btn-success active">
											<input type="radio" id="radio" name="memGender" autocomplete="off" value="남" checked> 남자
										</label>
										<label class="btn btn-success">
											<input type="radio" id="radio" name="memGender" autocomplete="off" value="여"> 여자
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr> 
							<td style="width:110px;"><h5> 생년월일 </h5></td>
							<td colspan="2">
								<div class="form-group has-success">
									<input type="text" class="form-control" id="memBirth" placeholder="생년월일" name="memBirth" maxlength="20">
								</div>
							</td>
						</tr>
						<tr>
							<td style="width:110px;"><h5> 핸드폰번호 </h5></td>
							<td colspan="2">
								<div class="form-group has-success">
									<input type="text" class="form-control" id="memPhone" placeholder="휴대폰번호" name="memPhone" maxlength="20">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="submit" class="btn btn-success btn-lg btn-block" >가입하기</button>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<h4 id="passwordCheckMessage"></h4>
							</td>
						</tr>	
					</tbody>
				</table>
			</form>
		</div> <!--  col-lg-4의 마지막 -->
		
		<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<h4 class="modal-title">
							확인 메시지 
						</h4>  
					</div>
					<div id="checkMessage" class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal"> 확인 </button>
					</div>
				</div>
			</div> <!-- modal-dialog 마지막  -->
		</div>
	</div>
</body>

</html>