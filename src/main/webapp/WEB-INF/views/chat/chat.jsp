<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- SockJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<div class="col-6">
		<label><b>${roomNum}번 채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
</div>
<script type="text/javascript">
/* @@님이 접속하셨습니다 메세지  */

//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	if($('#msg').val() == ''){
		alert('전송할 메세지를 입력하라');
		return;
	}
	sendMessage();
	$('#msg').val('')
});

$("#msg").keydown(function(event) {
    if (event.which === 13) {
        event.preventDefault();
        $("#button-send").click();
    }
});

// 접속할주소 설정
var id = '${userInfo.nname}'

if(id == ''){
	alert('로그인 후 이용하시오.');
	location.href='/project/login/login';
}

var room = '${roomNum}';

var serverAddress = '/project/chat';
var sock = new SockJS(serverAddress);

/* var client = Stomp.over(sock); */

sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage() {
	sock.send("ROOM"+room+":"+id+":"+$("#msg").val());
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	var cur_session = id; //현재 세션에 로그인 한 사람

	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		var str = "<div class='col-6' style='text-align : right;'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		$("#msgArea").append(str);
	}
	else{
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		$("#msgArea").append(str);
	}
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
	var user = id;
	var str = user + " 님이 퇴장하셨습니다.";
	$("#msgArea").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	var user = id;
	console.log(user);
	var str = user + "님이 입장하셨습니다.";
	$("#msgArea").append(str);
	$("#msg").val("님이 입장 하셨습니다.");
	$("#msg").val("");
	sock.send('ENTER:ROOM'+room+":"+id);
}

</script>
</body>

</html>