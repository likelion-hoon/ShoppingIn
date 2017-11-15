<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
	<body>
		<%@ include file="nav.jsp"%>
		
		<!-- 홈페이지 소개 -->
		<div class="container">
			<div class="jumbotron"> 
				<h1 class="text-center"> Shopping-In 소개합니다!. </h1>
				<p class="text-center"> Shopping-In은 쇼핑과 관련된 모든 정보를 제공합니다. Shopping-In을 사용하여 합리적인 쇼핑을 즐길 수 있습니다. </p>
				<p class="text-center"><a class="btn btn-success btn-lg"  data-target="#modal" data-toggle="modal" href="#" role="button"> 관심 품목 설문조사 하러가기 </a>
			</div>

			<div class="row">
				모든 쇼핑사이트 모음 예정
			</div>
		</div> <!-- 점보 트론의 끝 --> 
		<hr>

		<!-- 패널의 시작 --> 
		<div class="container"> 
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-heading"><span class="glyphicon glyphicon-pencil"> </span>
					&nbsp;&nbsp;최신 강의 목록 </h3>
			 	</div>

			 	<div class="panel-body">
			 		<div class="media">
			 			<div class="media-left">
			 				<a href="#"><img style="width:96px;height:96px;" class="media-object" src="images/c.png" alt="C언어 강의">
			 			</a>
			 			</div>
			 			<div class="media-body">
			 				<h4 class="media-heading"><a href="#"> C언어 기초 프로그래밍 강의 </a>&nbsp;<span class="badge"> New </span></h4>
			 				C언어 강의는 기초 프로그래밍 강의입니다.
			 			</div>
			 		</div>
			 		<hr>
			 		<div class="media">
			 			<div class="media-left">
			 				<a href="#"><img style="width:96px;height:96px;" class="media-object" src="images/java.png" alt="자바 강의">
			 			</a>
			 			</div>
			 			<div class="media-body">
			 				<h4 class="media-heading"><a href="#"> 자바 기초 프로그래밍 강의 </a>&nbsp;<span class="badge"> New </span></h4>
			 				자바 강의는 기초 프로그래밍 강의입니다.
			 			</div>
			 		</div>
			 		<hr>
			 		<div class="media">
			 			<div class="media-left">
			 				<a href="#"><img style="width:96px;height:96px;" class="media-object" src="images/android.png" alt="안드로이드 언어 강의">
			 				</a>
			 			</div>
			 			<div class="media-body">
			 				<h4 class="media-heading"><a href="#"> 안드로이드 기초 프로그래밍 강의 </a>&nbsp;<span class="badge"> New </span></h4>
			 				안드로이드 강의는 기초 프로그래밍 강의입니다.
			 			</div>
			 		</div>
			 	</div>
			</div>
		</div>
		
		<!-- 푸터의 시작 --> 
		<div class="container">
			<footer style="background-color: #000000; color: #ffffff">
					<br>
					<div class="row">
						<div class="col-sm-2" style="text-align: center;"><h5>
						Copyright &copy; 2017</h5><h5>이종훈</h5></div>
						<div class="col-sm-4"><h4>대표자 소개</h4><p> 안녕하세요 개발자 이종훈입니다. </p></div>
						<div class="col-sm-2"><h4 style="text-align: center;">내비게이션</h4>
							<div class="list-group">
								<a href="#" class="list-group-item"> 소개  </a>
								<a href="#" class="list-group-item"> 강사진 </a>
								<a href="#" class="list-group-item"> 강의  </a>
							</div>
						</div>

						<div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
							<div class="list-group">
								<a href="#" class="list-group-item"> 페이스북  </a>
								<a href="#" class="list-group-item"> 유투브 </a>
								<a href="#" class="list-group-item"> 네이버 TV  </a>
							</div>
						</div>

						<div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp; by 이종훈 </h4></div>
					</div>
			</footer>
		</div>
		<!-- 푸터의 끝 --> 
		
		
		<!-- 버튼을 눌렀을 때 나오는 모달창 정의 --> 
		<div class="row">
			<div class="modal" id="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							코딩 부스터의 특징
							<button class="close" data-dismiss="modal">&times;</button>
							<div class="modal-body" style="text-align:center;">
								저희 서비스의 특징은 바로 강의를 들을 수 있다는 점입니다. <br>
								특히 다양한 무료 강의가 유투브와 연동되어 제공됩니다. <br><br>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</body>
</html>
