<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
	<body>
		<%@ include file="nav.jsp"%>
		
		<div class="container" style="text-align:center;">
			<div class="row">
				<ul class="list-inline">
					 <li><a href="http://www.gmarket.co.kr" class="btn btn-success" target="_black"> Gmarket </a></li>
					 <li><a href="http://www.interpark.com" class="btn btn-success" target="_black"> 인터파크 </a></li>
					 <li><a href="http://www.auction.co.kr" class="btn btn-success" target="_black"> 옥션  </a></li>
					 <li><a href="http://www.11st.co.kr" class="btn btn-success" target="_black"> 11번가 </a></li>
					 <li><a href="http://www.ticketmonster.co.kr" class="btn btn-success" target="_black"> 티몬 </a></li>
					 <li><a href="http://www.coupang.com" class="btn btn-success" target="_black"> 쿠팡 </a></li>
					 <li><a href="http://wemakeprice.com" class="btn btn-success" target="_black"> 위메프  </a></li>
					 <li><a href="http://emart.ssg.com" class="btn btn-success" target="_black"> 이마트몰 </a></li>
					 <li><a href="http://with.gsshop.com" class="btn btn-success" target="_black"> GS샵  </a></li>
					 <li><a href="http://shinsegaemall.ssg.com" class="btn btn-success" target="_black"> 신세계몰 </a></li>
					 <li><a href="http://www.lotteimall.com" class="btn btn-success" target="_black"> 롯데I몰 </a></li>
					 <li><a href="http://display.cjmall.com" class="btn btn-success" target="_black"> CJ몰 </a></li>
					 <li><a href="http://www.hyundaihmall.com" class="btn btn-success" target="_black"> 현대H몰 </a></li>
					 <li><a href="http://www.oliveyoung.co.kr" class="btn btn-success" target="_black"> 올리브영 </a></li>
				</ul>
			</div>
		</div>
		
		<hr>
		
		<div class="jumbotron"> 
				<h1 class="text-center"> Shopping-In을 소개합니다!. </h1>
				<p class="text-center"> Shopping-In은 쇼핑에 관한 모든 컨텐츠를 포함하고 있습니다.
				  Shopping-In을 이용하여 합리적인 쇼핑을 시작해보세요! </p>
				<p class="text-center"><a class="btn btn-success btn-lg" href="registration_form.jsp" role="button"> 회원가입하기 </a></p>
		</div>
		
		<div class="container"> 
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				 <!-- Indicators -->
				 <ol class="carousel-indicators">
				   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				   <li data-target="#myCarousel" data-slide-to="1"></li>
				   <li data-target="#myCarousel" data-slide-to="2"></li>
				 </ol>
				
				 <!-- Wrapper for slides -->
				 <div class="carousel-inner">
				   <div class="item active">
				     <img src="images/main3.png" alt="쇼핑사진">
				   </div>
				
				   <div class="item">
				     <img src="images/main2.png" alt="쇼핑사진">
				   </div>
				
				   <div class="item">
				     <img src="images/main1.png" alt="쇼핑사진">
				   </div>
				 </div>
				
				 <!-- Left and right controls -->
				 <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				   <span class="glyphicon glyphicon-chevron-left"></span>
				   <span class="sr-only">Previous</span>
				 </a>
				 <a class="right carousel-control" href="#myCarousel" data-slide="next">
				   <span class="glyphicon glyphicon-chevron-right"></span>
				   <span class="sr-only">Next</span>
				 </a>
			</div>
		</div>
		<hr>
		
		
		
		<!-- 푸터의 시작 --> 
		<footer class="page-footer blue center-on-small-only">
				<!--Footer Links-->
    <div class="container-fluid">
        <div class="row">

            <!--First column-->
            <div class="col-md-6">
                <h5 class="title">Footer Content</h5>
                <p>Here you can use rows and columns here to organize your footer content.</p>
            </div>
            <!--/.First column-->

            <!--Second column-->
            <div class="col-md-6">
                <h5 class="title">Links</h5>
                <ul>
                    <li><a href="#!">Link 1</a></li>
                    <li><a href="#!">Link 2</a></li>
                    <li><a href="#!">Link 3</a></li>
                    <li><a href="#!">Link 4</a></li>
                </ul>
            </div>
            <!--/.Second column-->
        </div>
    </div>
    <!--/.Footer Links-->

    <!--Copyright-->
    <div class="footer-copyright">
        <div class="container-fluid">
            © 2015 Copyright: <a href="https://www.MDBootstrap.com"> MDBootstrap.com </a>

        </div>
    </div>
    <!--/.Copyright-->
		</footer>
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
