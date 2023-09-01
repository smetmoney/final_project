const systemText = document.querySelector("#systemText");
const gameBox = document.querySelector("#gameBox");
const gameBtn = document.querySelector("#gameBtn");
const subGameBox = document.querySelector("#subGameBox");
const systemZoomText = document.querySelector("#systemZoomText");
const systemZoomTextBox = document.querySelector("#systemZoomTextBox");
const endBox = document.querySelector("#endBox");
let idx = 0;
let context;
// scene을 구분하는것 ex : 'scene'+scene = scene1; default = 1
let scene = 1; 
// 현재 option을 뭘 골랐는지 구분할 변수
let selNum = 0;
// action중 ALL -> 다보고 넘어가기 위한 변수
let optionCount = 0;
let sceneOptionCount = 0;
// enter로 특정함수를 실행할수있게할 변수 start.js에 25번째줄 부터 보면됨
let sys_isEnter = true;
let isSys = true;
let isAction = false;

// introText 타이핑 작업 후 createOptions 함수
function displayText(sceneObject) {
	clean();
	const textArray = sceneObject.introText;
	isSys = true;

	if (sceneObject.hasOwnProperty('options') && idx >= textArray.length) {
		// 타이핑이 끝난 후 idx값 초기화 후 선택지 생성
		idx = 0;
		isSys = false;
		createOptions(sceneObject);
		return;
	}
	let line = textArray[idx]; 
	// 시스템대사인지 캐릭터대사인지 확인할 변수
	let isCheck = false;
	const paragraph = document.createElement("p");
	
	// text에서 캐릭터이름 분리 후 따로 타이핑하기 위한 if문
	if(lineCheck(line)){
		let prefix = "레베카:";
		if(line.startsWith("카렌"))	{
			prefix = "카렌:";
		}else if(line.startsWith(nick+":")){
			prefix = nick+":";
		}
		// 캐릭터 이름 분리후 캐릭터 이름 넣어주기
		let char_nick = line.substring(0,prefix.length-1);
		document.querySelector("#char_Nick").innerHTML = char_nick;
		isCheck = true;
		line = line.substring(prefix.length);
	}else{
		systemText.appendChild(paragraph); 
	}
	
	let i = 0;
	function typing2() {
		if (i < line.length) {
			sys_isEnter = false;
			const char = line.charAt(i);
			
			if(isCheck){
				systemZoomTextBox.textContent += char;
			}else{
				paragraph.textContent += char;
				if(i == line.length -1){
					paragraph.textContent += " ▼";
				}
			}

			i++;
			scrollToBottom(systemText);
			setTimeout(typing2, 10); // 한 글자 출력 간격을 50ms로 설정 (조절 가능) 빨리 보기위해 10으로 해놈
		} else {
			sys_isEnter = true;
			idx++;
		}
	}

	typing2(); // 타이핑 효과 함수 호출
}


function createOptions(sceneObject) {
	clean();
	const option = sceneObject.options;
	const action = sceneObject.action;
	const sound = sceneObject.sound;

	if (!option || option.length === 0) {
		return;
	}

	const optionButtonWrapper = document.createElement("div");
	optionButtonWrapper.id = "btnDiv";
	gameBtn.appendChild(optionButtonWrapper);
	
	sys_isEnter = false;
	// SELECT = 여러개의 옵션중 하나만 고르고 다음 씬으로 넘김
	if (action == "SELECT" || action == "END" ) {
		option.forEach((optionObj, index) => {
			const optionButton = document.createElement("button");
			optionButton.textContent = optionObj.buttonText;
			// 옵션 버튼들 클릭했을때 이벤트
			optionButton.onclick = (e) => {
				document.querySelector("#btnDiv").remove();
				selNum = index;
				createAction(sceneObject);
			};
			scrollToBottom(systemText);
			optionButtonWrapper.appendChild(optionButton);
		});
	}
	// ALL = 여러개의 옵션 전부를 골라야 다음 씬으로 넘김
	if (action == "ALL") {
		sceneOptionCount = option.length;
		option.forEach((optionObj, index) => {
			const optionButton = document.createElement("button");
			optionButton.textContent = optionObj.buttonText;

			optionButton.onclick = (e) => {
				e.target.remove();
				document.querySelector("#btnDiv").style.display = "none";
				selNum = index;
				createAction(sceneObject);
			}
			scrollToBottom(systemText);
			optionButtonWrapper.appendChild(optionButton);
		});
	}
	// GAME = 아직 구현은 안했는데 단 한개의 게임만 가지고 있을때 쓸꺼같음 - 0816 지금구현중
	// 0817 구현완료
	if (action == 'GAME') {
		option.forEach((optionObj, index) => {
			const optionButton = document.createElement("button");
			optionButton.textContent = optionObj.buttonText;
			// 옵션 버튼들 클릭했을때 이벤트
			optionButton.onclick = (e) => {
				document.querySelector("#btnDiv").remove();
				selNum = index;
				createAction(sceneObject);
			};
			scrollToBottom(systemText);
			optionButtonWrapper.appendChild(optionButton);
		});
	}
}

function createAction(sceneObject) {
	clean();
	isAction = true;
	const textArray = sceneObject.options[selNum].actionText;
	const action = sceneObject.action;
	const sound = sceneObject.sound;
	const col = sceneObject.options[selNum].color;

	let gameType = "";
	if(action == 'GAME'){
		gameType = sceneObject.options[selNum].gameType;
	}
	sys_isEnter = false;

	if(action != '' && idx >= textArray.length){
		if (sound !== '') {
			playSound(sound);
		}
		isAction = false;
		isSys = true;
		idx = 0;
		selNum = 0;
		switch(action){
			case 'SELECT' : 	
				scene++;
				const sceneObject = window["scene" + scene];
				displayText(sceneObject);
				break;

			case 'ALL' :
				optionCount++;
				if (optionCount == sceneOptionCount) {
					scene++;
					const sceneObject = window["scene" + scene];
					optionCount = 0;
					document.querySelector("#btnDiv").remove();
					displayText(sceneObject);
				} else {
					isAction = true;
					isSys = false;
					const btns = document.querySelector("#btnDiv");
					btns.style.display = "block";
					scrollToBottom(systemText);
					gameBtn.appendChild(btns);
				}
				break;
			
			case 'GAME' :
				createGame(gameType);
				break;

			case 'END' :
				gameEnd();
				break;
		}
	} else {
		let line = textArray[idx];
		let isCheck = false;
		const paragraph = document.createElement("p");
		paragraph.style.color = col;

		if(lineCheck(line)){
			let prefix = "레베카:";
			if(line.startsWith("카렌"))	{
				prefix = "카렌:";
			}else if(line.startsWith(nick+":")){
				prefix = nick+":";
			}
			let nick = line.substring(0,prefix.length-1);
			document.querySelector("#char_Nick").innerHTML = nick;
			isCheck = true;
			line = line.substring(prefix.length);
		}else{
			systemText.appendChild(paragraph); 
		}
		
		let i = 0;
		function typing3() {
			if (i < line.length) {
				sys_isEnter = false;
				const char = line.charAt(i);
				
				if(isCheck){
					systemZoomTextBox.textContent += char;
				}else{
					paragraph.textContent += char;
					if(i == line.length-1){
						paragraph.textContent += " ▼";
					}
				}

				i++;
				scrollToBottom(systemText);
				setTimeout(typing3, 10); // 한 글자 출력 간격을 50ms로 설정 (조절 가능)
			} else {
				sys_isEnter = true;
				idx++;
			}
		}

		typing3();
	}


};

function playSound(sound) {
	const link = '../resources/sound/' + sound + '.mp3';
	const audio = new Audio(link);
	audio.play();
}

function lineCheck(line) {
	if(line.startsWith(nick+":") || line.startsWith("레베카:") || line.startsWith("카렌:") || 
	   line.startsWith("빅토르:") || line.startsWith("에밀리:")){
		changeImage(line);
		return true;
	}
	return false;
}

function changeImage(line){
	const profile = document.querySelector("#char_Image");
	profile.style.backgroundSize = "cover";
	
	if (line.startsWith(nick+":")) {
        profile.style.backgroundImage = "url('../resources/game/img/mike.png')";
    } else if (line.startsWith("레베카:")) {
        profile.style.backgroundImage = "url('../resources/game/img/rebecca.png')";
    } else if (line.startsWith("빅토르:")) {
        profile.style.backgroundImage = "url('../resources/game/img/victor.png')";
    } else if (line.startsWith("카렌:")) {
        profile.style.backgroundImage = "url('../resources/game/img/caren.png')";
    } else if (line.startsWith("에밀리:")) {
        profile.style.backgroundImage = "url('../resources/game/img/emily.png')";
    }
}

// ajax 통신으로 jsp파일 불러와서 subGameBox 안에 생성
function createGame(subGame) {
	loadingStart();
	const sub_game = document.createElement("div");
	const link = '../resources/game/subGame/' + subGame + '.jsp';
	sub_game.setAttribute("id","sub_game");
	gameBox.style.display = "none";
	
	if(subGame == 'proviso'){
		document.querySelector("#docBtn").style.display = 'block';
		document.querySelector("#letterBtn").style.display = 'block';
	}

	setTimeout(function() {
		var xhr = new XMLHttpRequest();
		xhr.open('GET', link, true);
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4 && xhr.status === 200) {
				loadingEnd();
				sub_game.innerHTML = xhr.responseText;
				if(subGame == 'runWigoAndEmily'){
					canvas = document.querySelector("#gameCanvas");
					context = canvas.getContext("2d");
					gameLoop();
				}
			}
    	};
		xhr.send();
		subGameBox.style.display = "block";
		subGameBox.appendChild(sub_game);
	}, 1500); 
}

// subGame중 단서 찾기가 하나씩 끝날때마다 실행하는중
function findEnding() {
	subGameBox.style.display = "none";
	document.querySelector("#sub_game").remove();
	gameBox.style.display = "block";
	sys_isEnter = true;
	isAction = false;
	isSys = true;
	scene++;
	const sceneObject = window["scene"+scene];
	displayText(sceneObject);
}

// subGame중 단서 다 찾은 후 조합 
function provisoEnding() {
	document.querySelector("#docBtn").style.display = 'none';
	document.querySelector("#letterBtn").style.display = 'none';
	document.querySelector("#sub_game").remove();
	subGameBox.style.dispaly = "none";
	gameBox.style.display = "block";
	scene++;
	const sceneObject = window["scene"+scene];
	displayText(sceneObject);
}

function runWigoAndEmilyEnd() {
	document.querySelector("#sub_game").remove();
	subGameBox.style.display = "none";
	gameBox.style.display = "block";
	
	scene++;
	const sceneObject = window["scene"+scene];
	displayText(sceneObject);
}

function gameEnd() {
	gameBox.style.display = 'none';
	document.querySelector("#newsTitle").innerText = "속보 ! "+nick+"가 빛나는 별의 도둑들을 잡다";
	document.querySelector("#endTitle").style.display = 'block';
	endBox.style.display = 'flex';
}
