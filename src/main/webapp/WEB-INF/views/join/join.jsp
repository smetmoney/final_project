<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FINAL_PROJECT</title>

        <!-- css CDN추가 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">

    </style>
    </head>
    <body style="background-image: url(./img/backGround.jpg);" id="main_image"
        	alt="main_image">
        <!-- <img src="./img/backGround.jpg" id="main_image" alt="main_image"> -->
        <!-- <div class="position-absolute top-0 end-0" style="padding-top: 10px;">
            <a href="#">Login</a><a href="#" style="margin: 20px;">Register</a>	
        </div> -->
        <!-- header -->
        <div class="header">

            <!-- logo image -->
            <div class="position-relative" style="text-align: center;
                padding-top: 3%;"><a href="${pageContext.request.contextPath}/"><img
                        src="${pageContext.request.contextPath}/resources/images/joinIMG/poe_logo6.png" id="logo_image"></a></div>
            <!-- nav bar -->

            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 mx-auto">
                        <li class="nav-item">
                            <a class="nav-link active text-primary"
                                aria-current="page" href="./poe_home.html">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-primary"
                                href="./poe_game.html">GAME소개</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="./poe_community.html">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="./poe_shop.html">상점</a>
                        </li>
                    </ul>
                </div>
            </nav>


            <!-- main -->
            <form id="join_form" method="get" action="./poe_home.html">
                <div id="enter1">
                    <div id="content">
                        <div class="enter2">
                            <strong>아이디</strong>
                            <div style="margin-top: 10px;">
                                <span class="box1">
                                    <input type="text" name="Id"
                                        placeholder="아이디"
                                        class="int">
                                </span>
                            </div>
                            <br><br>
                            <strong>비밀번호</strong>
                            <div style="margin-top: 10px;">
                                <span class="box2"><input type="password"
                                        name="password" placeholder="8-10자 사이의 대,소문자를 구분해서 작성해주세요" class="int"></span>
                            </div>
                            <br><br>
                            <strong>비밀번호 재확인</strong>
                            <div style="margin-top: 10px;">
                                <span class="box2"><input type="password"
                                        name="password" placeholder="다시 입력해주세요"
                                        class="int"></span>
                            </div>
                        </div>
                        <br><br>
                        <strong>이메일</strong>
                        <div class="enter2">
                            <div class="mail">
                                <strong></strong>
                                <div class="mail1">
                                    <span class="box3">
                                        <input type="text" placeholder="이메일"
                                            name="e-mail" class="email">
                                    </span>
                                </div>
                                &nbsp;
                                <div class="mail2">
                                    <span class="box3">
                                        <select name="e=mail" class="email">
                                            <option>선택</option>
                                            <option>@naver.com</option>
                                            <option>@daum.net</option>
                                            <option>@gmail.com</option>
                                            <option>@hanmail.com</option>
                                            <option>직접입력</option>
                                        </select>
                                    </span>
                                </div>
                            </div>
                            <br><br>
                            <strong>이름</strong>
                            <div style="margin-top: 10px;">
                                <span class="box2">
                                    <input type="text" name="name"
                                        placeholder="성함"
                                        class="int">
                                </span>
                            </div>
                            <br><br>
                            <strong>생년월일</strong>
                            <div id="birth">
                                <div id="birth_yy" style="padding-left: 0px;">
                                    <span class="box4">
                                        <input type="text" placeholder="년(4자)"
                                            id="brith_year" class="int2">&nbsp;
                                    </span>
                                </div>
                                <div id="birth_mm">
                                    <span class="box4">
                                        <select name="year" placeholder="월"
                                            id="birth_month" class="int2">
                                            <option>1월</option>
                                            <option>2월</option>
                                            <option>3월</option>
                                            <option>4월</option>
                                            <option>5월</option>
                                            <option>6월</option>
                                            <option>7월</option>
                                            <option>8월</option>
                                            <option>9월</option>
                                            <option>10월</option>
                                            <option>11월</option>
                                            <option>12월</option>

                                        </select>
                                        &nbsp;
                                    </span>
                                </div>
                                <div id="birth_dd">
                                    <span class="box4">
                                        <input type="text" placeholder="일"
                                            id="brith_day" class="int2">
                                    </span>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <span>
                            <div class="enter3">
                                <select name="성별" class="sex" placeholder="성별">
                                    <option>성별</option>
                                    <option>남성</option>
                                    <option>여성</option>
                                    <option>선택안함</option>
                                </select>
                             </div>
                            </span>
                            <br><br>
                            개인정보 처리방침 동의여부 :&nbsp;<input type="radio"
                                name="agree"
                                value="Y">동의 &nbsp;
                            <input type="radio" name="agree" value="N">비동의
                            <br><br>
                            <a href="./poe_home.html">
                            	<div class="row wide">
                            		<div class="element">
                                        <input type="submit" name="submit" value="계정 생성">
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </form>
                
				<!-- footer -->
<!-- 				<div class="footer" class="fixed-bottom">
				    <div class="bottom">
				        <div class="social_icon">
				            <h3 style="margin-top: 50px;">Offical Channels</h3>
				            <a href="#" target="_blank" class="bg-twitter" title="Twitter"><img src="./img/twitter.png"></a>
				            <a href="#" target="_blank" class="bg-facebook" title="Facebook"><img src="./img/facebook.png"></a>
				            <a href="#" target="_blank" class="bg-youtube" title="Youtube"><img src="./img/youtube.png"></a>
				            <a href="#" target="_blank" class="bg-twitch" title="Twitch"><img src="./img/twitch.jpg"></a>
				        </div>
				    </div>
				</div> -->
				
				<jsp:include page="${pageContext.request.contextPath}/views/common/footer.jsp" />


<!--                 JS CDN추가
                <script
                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script> -->
            </body>
        </html>