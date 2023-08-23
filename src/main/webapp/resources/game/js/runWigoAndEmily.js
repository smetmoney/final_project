const canvas = document.getElementById("gameCanvas");
const context = canvas.getContext("2d");

class Sprite {
  constructor({ position, velocity, image }) {
    this.position = position;
    this.image = image;
  }

  draw() {
    context.drawImage(this.image, this.position.x, this.position.y);
  }
}
const rightPlayerImage = [
  "/resources/img/game/myke/right0.png",
  "/resources/img/game/myke/right1.png",
  "/resources/img/game/myke/right2.png",
  "/resources/img/game/myke/right3.png",
  "/resources/img/game/myke/right4.png"
];

const leftPlayerImage = [
  "/resources/img/game/myke/left0.png",
  "/resources/img/game/myke/left1.png",
  "/resources/img/game/myke/left2.png",
  "/resources/img/game/myke/left3.png",
  "/resources/img/game/myke/left4.png"
];

const prontPlayerImage = [
  "/resources/img/game/myke/pront0.png",
  "/resources/img/game/myke/pront1.png",
  "/resources/img/game/myke/pront2.png",
  "/resources/img/game/myke/pront3.png",
  "/resources/img/game/myke/pront4.png"
]

const backPlayerImage = [
  "/resources/img/game/myke/back0.png",
  "/resources/img/game/myke/back1.png",
  "/resources/img/game/myke/back2.png",
  "/resources/img/game/myke/back3.png",
  "/resources/img/game/myke/back4.png"
]

const bgImg = new Image();
bgImg.src = "/resources/map/testBack.png";

const playerImage = new Image();
playerImage.src = "/resources/img/game/myke/pront0.png";

const background = new Sprite({
  position: {
    x: -70,
    y: -120
  },
  image: bgImg
});




let playerImageIndex = 0;
let imageChangeDelay = 0;

const enemyImage = new Image();
enemyImage.src = "/resources/img/alex.png";
// max Height : -1022 , max width : 920
const player = { x: 70, y: 120, speed: 10, width: 48, height: 48 };
let enemy = { x: 3000, y: 120, speed: 15, width: 40, height: 40 };


function gameLoop() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  // 전체 이미지의 원본 크기
  const originalImageWidth = 2880; // 이미지의 원본 너비
  const originalImageHeight = 1556; // 이미지의 원본 높이

  // 캔버스 크기
  const canvasWidth = 960; // 캔버스 너비
  const canvasHeight = 512; // 캔버스 높이
  
  // 캐릭터의 위치 (예시)
  const playerX = player.x; // 캐릭터의 X 좌표
  const playerY = player.y; // 캐릭터의 Y 좌표
 
	
  // 배경 그리기
  background.draw();
  // 플레이어 그리기
  context.drawImage(playerImage, player.x, player.y, player.width, player.height);

  // 적 그리기
  // context.drawImage(enemyImage, enemy.x, enemy.y, enemy.width, enemy.height);
    console.log("bgX :", background.position.x, "bgY :", background.position.y);
    console.log("playerX : ", playerX, "playerY : ", playerY);


  // 플레이어 움직임 처리
  // 위
  if (keys.ArrowUp && player.y > 0 && background.position.y < 0) {
    
    if (background.position.y <= -1020) background.position.y += 10;
    
    player.y -= player.speed;
    imageChange(backPlayerImage);
    
  } else if (keys.ArrowUp && player.y <= 0 && background.position.y < 0) {
    imageChange(backPlayerImage);
    background.position.y = background.position.y + player.speed;
  }

  // 아래
  if (keys.ArrowDown && player.y + player.height < canvas.height && background.position.y > -1020 && background.position.y <= 0) {
    
    if (background.position.y >= 0) background.position.y -= 10;

    player.y += player.speed;
    imageChange(prontPlayerImage);
  } else if (keys.ArrowDown && player.y + player.height >= canvas.height && background.position.y > -1020) {
    
    imageChange(prontPlayerImage);
    background.position.y = background.position.y - player.speed;
  }

  // 오른쪽
  if (keys.ArrowRight && player.x + player.width < canvas.width && background.position.x > -1920 && background.position.x <= 100) {
  
    if (background.position.x >= 0) background.position.x -= 10;

    player.x += player.speed;
    imageChange(rightPlayerImage);
  } else if (keys.ArrowRight && player.x + player.width >= canvas.width && background.position.x > -1920) {

    imageChange(rightPlayerImage);
    background.position.x = background.position.x - player.speed;
  }

  // 왼쪽
  if (keys.ArrowLeft && player.x > 0 && background.position.x < 0) {

    if (background.position.x <= -1920) background.position.x += 10;
    
    player.x -= player.speed;
    imageChange(leftPlayerImage);
  } else if (keys.ArrowLeft && player.x <= 0 && background.position.x < 0) {

    imageChange(leftPlayerImage);
    background.position.x = background.position.x + player.speed;
  }

  if (imageChangeDelay > 0) {
    imageChangeDelay--;
  }

  // 충돌 감지
  if (checkCollision(player, enemy)) {
    gameOver();
    return;
  }

  // 게임 루프 반복
  requestAnimationFrame(gameLoop);
}

// 충돌 감지 함수
function checkCollision(obj1, obj2) {
  return (
    obj1.x < obj2.x + obj2.width &&
    obj1.x + obj1.width > obj2.x &&
    obj1.y < obj2.y + obj2.height &&
    obj1.y + obj1.height > obj2.y
  );
}

// 게임 오버 처리
function gameOver() {
  // 일단 임시용
  context.font = "30px Arial";
  context.fillStyle = "black";
  context.fillText("Game Over", canvas.width / 2 - 70, canvas.height / 2);
}

// 키 입력 상태 저장
const keys = {};

window.addEventListener("keydown", (event) => {
  keys[event.key] = true;
});

window.addEventListener("keyup", (event) => {
  keys[event.key] = false;
});

function imageChange(playerImageArray) {
  if (imageChangeDelay == 0) {
      imageChangeDelay = 7;
      playerImageIndex = (playerImageIndex + 1) % playerImageArray.length;
      playerImage.src = playerImageArray[playerImageIndex];
  }
}


// 게임 시작
gameLoop();

