<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"> --%>
<link rel="stylesheet" href="../resources/css/join.css">

<!-- 스크립트 추가해놨는데 일단 주석 처리함 -->

<%--

<script>

function joincheck() {
	var confirmPassword = document.forms["join_form"]["confirmPassword"].value;
    var agree = document.forms["join_form"]["agree"].value;
    var birthYear = document.getElementById("brith_year").value;
    var birthDay = document.getElementById("brith_day").value;

    if (birthYear.length !== 4) {
        alert("년도는 4자리로 입력해주세요.");
        return false;
    }

    if (birthDay.length > 2) {
        alert("일은 최대 2자리로 입력해주세요.");
        return false;
    }
    
    if (password.length < 8) {
        alert("비밀번호는 최소 8자 이상이어야 합니다.");
        return false;
    }
    
    if (PASS !== confirmPassword) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    
    if (agree !== "Y") {
        alert("개인정보 처리방침에 동의해야 가입할 수 있습니다.");
        return false;
    }
}

</script>

 --%>

    <!-- main -->
    <form id="join_form" method="post" action="join" onsubmit="return joincheck()">
        <div id="enter1">
            <div id="content">
                <div class="enter2">
                    <strong>아이디</strong>
                    <div style="margin-top: 10px;">
                        <span class="box1">
                            <input type="text" name="id" placeholder="아이디" class="int" required>
                        </span>
                    </div>
                    <br><br>
                    <strong>닉네임</strong>
                    <div style="margin-top: 10px;">
                        <span class="box1">
                            <input type="text" name="nname" placeholder="아이디" class="int">
                        </span>
                    </div>
                    <br><br>
                    <strong>비밀번호</strong>
                    <div style="margin-top: 10px;">
                        <span class="box2">
                        <input type="password" name="pass" placeholder="8-10자 사이의 대,소문자를 구분해서 작성해주세요" class="int">
                        </span>
                    </div>
                    <br><br>
                    <strong>비밀번호 재확인</strong>
                    <div style="margin-top: 10px;">
                        <span class="box2">
                        <input type="password" name="confirmPassword" placeholder="비밀번호 재확인" class="int">
                        </span>
                    </div>
                </div>
                <br><br>
                <strong>이메일</strong>
                <div class="enter2">
                    <div class="mail">
                        <strong></strong>
                        <div class="mail1">
                            <span class="box3">
                                <input type="text" placeholder="이메일" name="email" class="email">
                            </span>
                        </div>
                        &nbsp;
                        <div class="mail2">
                            <span class="box3">
                                <select name="email" class="email">
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
                            <input type="text" name="name" placeholder="성함" class="int">
                        </span>
                    </div>
                    <br><br>
                    <strong>생년월일</strong>
                    <div id="birth">
                        <div id="birth_yy" style="padding-left: 0px;">
                            <span class="box4">
                                <input type="text" placeholder="년(4자)" id="birthdate" class="int2">&nbsp;
                            </span>
                        </div>
                        <div id="birth_mm">
                            <span class="box4">
                                <select name="year" placeholder="월" id="birthdate" class="int2">
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
                                <input type="text" placeholder="일" id="birthdate" class="int2">
                            </span>
                        </div>
                    </div>
                </div>
                <br><br>
                <span>
                    <div class="enter3">
                        <select name="gender" placeholder="성별">
                            <option>성별</option>
                            <option>남성</option>
                            <option>여성</option>
                            <option>선택안함</option>
                        </select>
                     </div>
                    </span>
                    <br><br>
                    개인정보 처리방침 동의여부 :&nbsp;
                    <input type="radio" name="agree" value="Y">동의 &nbsp;
                    <input type="radio" name="agree" value="N">비동의
                    <br><br>
                    <a href="home">
                    	<div>
                    		<div class="element">
                                <input type="submit" name="submit" value="계정 생성">
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </form>
				
<jsp:include page="../common/footer.jsp" />