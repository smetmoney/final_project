<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<style>
	#openChatBot{
    	border: 1px solid black;
	    position: fixed;
	    height: 50px;
	    left: 95%;
	    top: 45%;
    }

	#chatBotBox{
    	border: 1px solid black;
    	position: fixed;
    	width: 90%;
    	margin-left: 5%;
    	margin-right: 5%;
    	padding: 10px;
    	top: 33%;
    	background: aliceblue;
    	z-index: 2;
    	border-radius: 10px;
    	display:none;
	}
	
	#chatBotText{
		display: flex;
    	flex-direction: column;
	}
	
	#chatBotClient{
		display: flex;
    	flex-direction: row;
	}
	
	#chatPrompt{
		width:90%;
	};
	
	#chatBotBtn{
		width:10%;
		margin-left: 3%;    
		border: solid 1px black;
    	padding: 3px;
    }
    
	 #closeChatBot {
		filter:none;
		background: red;
		font-size: 15pt;
	    border: solid 2px black;
	    border-radius:5px;
	    width: 50px;
	    height: 50px;
	    z-index: 2;
	    cursor: pointer;
	    position: absolute;
	    right: 2%;
	}
	
	#closeChatBot:before, #closeChatBot:after {
	  position: absolute;
	  left: 22px;
	  content: ' ';
	  height: 48px;
	  width: 3px;
	  background-color: #000000;
	}
	
	#closeChatBot:before {
	  transform: rotate(45deg);
	}
	
	#closeChatBot:after {
	  transform: rotate(-45deg);
	}
</style>
<div id="openChatBot">도우미키기</div>
<div id="chatBotBox">
	<div id="closeChatBot"></div>
	<h1 style="text-align:center;">안녕하세요 도우미입니다. 무엇이든 물어보세요</h1>
	<div id="chatBotText">
	
	</div>
	<div id="chatBotClient">
		<input type="text" id="chatPrompt" autocomplete="off"/>
		<div id="chatBotBtn" style="margin-left: 3%;">보내기</div>
	</div>
</div>
<script>
	let apiKey;
	let ENDPOINT;
	
	document.querySelector("#openChatBot").addEventListener("click",() => {
		document.querySelector("#chatBotBox").style.display = 'block';
		document.querySelector("#openChatBot").style.display = 'none';
	});
	
	document.querySelector("#closeChatBot").addEventListener("click",() => {
		document.querySelector("#chatBotBox").style.display = 'none';
		document.querySelector("#openChatBot").style.display = 'block';
	});
	
	document.querySelector("#chatBotBtn").addEventListener("click", () => {
	    handleChat();
	});

	document.querySelector("#chatPrompt").addEventListener("keydown", (e) => {
	    if (e.key === "Enter") {
	        handleChat();
	    }
	});

	function handleChat() {
	    const prompt = document.querySelector("#chatPrompt").value;
	    const trimPrompt = prompt.trim();
	    console.log(trimPrompt);
	    if (trimPrompt != '') {
	    	switch(prompt){
	    		case '공지사항' :
	    			location.href = '${path}/notice/noticeList';
	    			break;
	    		case '채팅' :
	    			location.href = '${path}/chat/chatRoom';
	    			break;
	    		case '이미지게시판' :
	    		case '이미지' :
	    			location.href = "${path}/imageBoard/imgBoard_list";
	    			break;
	    		case '자유게시판' :
	    		case '자게' :
	    			location.href = "${path}/freeBoard/freeBoard_list";
	    			break;
	    		case 'QNA' :
	    		case '질문' :
	    		case 'qna' :
	    			location.href = "${path}/qna/qnaPage";
	    			break;
	    		case '내정보' :
	    		case '마이페이지' :
	    			location.href = "${path}/user/user?id=${userInfo.id}";
	    			break;
	    		default :
	    			generateText(prompt);
	    			break;
	    	}
	    }
	}
	
	function getKey(){
		let xhr = new XMLHttpRequest();
		let url = '/project/getKey';
		xhr.onreadystatechange = function() {
			if(xhr.readyState === XMLHttpRequest.DONE) {
				if(xhr.status === 200){
					const result = xhr.responseText.split(',');
					apiKey = result[0];
					ENDPOINT = result[1];
				}
			}
		}
		
		xhr.open('GET',url,true);
		xhr.send();
	}
	
	getKey();
</script>
<script src="/project/resources/js/AI.js"></script> -->
