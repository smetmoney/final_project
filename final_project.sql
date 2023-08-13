-- 멤버 정보 테이블
CREATE TABLE MEMBER (
    IDN INT AUTO_INCREMENT PRIMARY KEY, 	-- 식별값
    ID VARCHAR(255) NOT NULL UNIQUE, 				-- 로그인용 ID
    NNAME VARCHAR(255) NOT NULL,			-- 닉네임	
    PASS VARCHAR(255) NOT NULL,				-- 비밀번호
    EMAIL VARCHAR(255) NOT NULL,			-- 이메일
    NAME VARCHAR(255),						-- 이름
    STOPU BOOLEAN DEFAULT FALSE				-- 정지 유저 구분
);

-- 집에서 사용할 DB
-- 관리자 계정 만듬
INSERT INTO MEMBER(ID,NNAME,PASS,EMAIL,NAME)
VALUES('ADMIN','ADMIN','ADMIN','EMAIL@EMAIL','ADMIN');

-- 첫번째 유저
INSERT INTO MEMBER(ID,NNAME,PASS,EMAIL,NAME)
VALUES('USER1','NNAME1','12345','USER1@naver.com','NAME1');

DROP TABLE MEMBER;

DESC MEMBER;
SELECT * FROM MEMBER;

-- 유저 정보 테이블
CREATE TABLE USER (
    IDN INT AUTO_INCREMENT PRIMARY KEY,			-- 식별값
    POINT INT DEFAULT 0,						-- 포인트(구매같은거 할때 쓰는)
    -- SAVE (임시) 								-- 임시
    FOREIGN KEY (IDN) REFERENCES MEMBER(IDN) 	-- 식별값 불러오기
);

DROP TABLE USER;

SELECT * FROM USER;

-- 자유게시판 테이블 생성
CREATE TABLE FreeBoard (
    BNO INT AUTO_INCREMENT PRIMARY KEY,			-- 글 번호
    Title VARCHAR(255) NOT NULL,				-- 글 제목
    Content TEXT,								-- 글 내용
    Auth VARCHAR(255),							-- 작성자
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,	-- 작성 시간
    VNT INT DEFAULT 0,							-- 조회수
    LIKE_COUNT INT DEFAULT 0,					-- 좋아요 수
   	CONSTRAINT fk_idn FOREIGN KEY (Auth) 
    REFERENCES MEMBER(ID)
--    INDEX(IDN)									-- ID값 불러오기
);

SELECT * FROM FreeBoard;

SHOW INDEXES FROM MEMBER;

-- 이미지 게시판 테이블 생성
CREATE TABLE ImageBoard (
    BNO INT AUTO_INCREMENT PRIMARY KEY,			-- 글 번호
    Title VARCHAR(255) NOT NULL,				-- 글 제목
    Content TEXT,								-- 글 내용
    Auth VARCHAR(255),							-- 작성자
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,	-- 작성 시간
    VNT INT DEFAULT 0,							-- 조회수
    LIKE_COUNT INT DEFAULT 0,					-- 좋아요 수
    ImageURL VARCHAR(255),						-- 들어가는 img url
    ThumbnailURL VARCHAR(255),	 				-- 보여주는 thumbnail url
    FOREIGN KEY (Auth) REFERENCES MEMBER(ID)	-- ID값 불러오기
);

-- 자유게시판 댓글 테이블
CREATE TABLE FreeBoardComments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,				-- 댓글 번호 저장
    FreeBoardBNO INT,										-- 자유게시판 글 번호
    CommentContent TEXT,									-- 자유게시판 댓글 내용 
    CommenterID VARCHAR(255),								-- 자유게시판 댓글 작성자
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,			-- 댓글 작성시간
    FOREIGN KEY (FreeBoardBNO) REFERENCES FreeBoard(BNO),	-- 외부 게시판 값 불러오기
    FOREIGN KEY (CommenterID) REFERENCES MEMBER(ID)			-- 외부 ID 값 불러오기
);

-- 이미지 게시판 댓글 테이블 
CREATE TABLE ImageBoardComments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,				-- 댓글 번호 저장
    ImageBoardBNO INT,										-- 이미지게시판 댓글 번호
    CommentContent TEXT,									-- 이미지게시판 댓글 내용
    CommenterID VARCHAR(255),								-- 이미지게시판 댓글 작성자
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,			-- 댓글 작성시간
    FOREIGN KEY (ImageBoardBNO) REFERENCES ImageBoard(BNO),	-- 외부 게시판 값 불러오기
    FOREIGN KEY (CommenterID) REFERENCES MEMBER(ID)			-- 외부 ID 값 불러오기
);

-- 구매내역 테이블
CREATE TABLE Bought (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,			-- 구매관리 번호
    UserID VARCHAR(255), 								-- 사용자 식별자 (로그인 ID 등)
    ProductName VARCHAR(255), 							-- 구매한 상품명
    PointSpent INT DEFAULT 0, 							-- 사용된 포인트
    FOREIGN KEY (UserID) REFERENCES MEMBER(ID)			-- 구매한 사람 ID 값 불러오기
);

-- 간단한 Q&A 테이블 생성
CREATE TABLE QnA (
    QnAID INT AUTO_INCREMENT PRIMARY KEY,				-- Q&A 식별값
    QuestionTitle VARCHAR(255), 						-- Q&A 제목
    QuestionContent TEXT         						-- Q&A 내용
);	

SELECT * FROM QnA;

-- 업적 테이블
CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,		-- 업적 식별값
    UserID VARCHAR(255), 								-- 사용자 식별자 (로그인 ID 등)
    AchievementName VARCHAR(255), 						-- 업적명
    AchievementDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 달성한 날짜
    FOREIGN KEY (UserID) REFERENCES MEMBER(ID)			-- 업적 달성한 사람 ID 값 불러오기
);

-- 쪽지 테이블 생성
CREATE TABLE Message (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,		-- 메세지 식별값
    SenderID VARCHAR(255), 							-- 보낸 사람의 ID
    ReceiverID VARCHAR(255),						-- 받는 사람의 ID
    MessageContent TEXT, 							-- 쪽지 내용
    SendDate DATETIME DEFAULT CURRENT_TIMESTAMP, 	-- 보낸 시간
    FOREIGN KEY (SenderID) REFERENCES MEMBER(ID),	-- 보낸 사람 ID 값 불러오기
    FOREIGN KEY (ReceiverID) REFERENCES MEMBER(ID)	-- 받는 사람 ID 값 불러오기
);


-- 민준 테스트용
CREATE TABLE test_imageBoard (
	BNO INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,				-- 글 제목
    CONTENT TEXT,								-- 글 내용
    Auth VARCHAR(255),							-- 작성자
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,	-- 작성 시간
    VCNT INT DEFAULT 0,							-- 조회수
    LCNT INT DEFAULT 0,							-- 좋아요 수
    ImageURL VARCHAR(255)						-- 이미지 경로
);

INSERT INTO test_imageBoard VALUES ('test title','test content','text auth',now(),0,0,'../resources/images/test/testImg.jpg');


select * from test_imageBOard;



