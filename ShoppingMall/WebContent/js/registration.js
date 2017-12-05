function registerCheckFunction() {
	var memId = $('#memId').val();
	$.ajax({
		type : 'POST',
		url : './MemberRegisterCheckServlet',
		data : {
			memId : memId
		},
		success : function(result) {
			if (result == 0) {
				$('#checkMessage').html('이미 존재하는 아이디입니다.');
				$('#checkType').attr('class', 'modal-content panel-info');
				$('#memId').val("");
			} else if (result == 2) {
				$('#checkMessage').html('입력을 해주세요.');
				$('#checkType').attr('class', 'modal-content panel-warning');
			} else if (result == 3) {
				$('#checkMessage').html('이메일 형식이 아닙니다.');
				$('#checkType').attr('class', 'modal-content panel-warning');
				$('#memId').val("");
			} else {
				$('#checkMessage').html('사용할 수 있는 아이디입니다.');
				$('#checkType').attr('class', 'modal-content panel-success');
			}
			$('#checkModal').modal('show');
		}
	});
}

function passwordCheckFunction() {
	var userPassword1 = $('#memPassword').val();
	var userPassword2 = $('#re_memPassword').val();

	if (userPassword1 != userPassword2) {
		$('#passwordCheckMessage').attr('style', 'color:red;text-align:center');
		$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
	} else {
		$('#passwordCheckMessage').html('');
	}
}