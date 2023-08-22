-- 멤버 정보 테이블
CREATE TABLE MEMBER (
    IDN INT AUTO_INCREMENT PRIMARY KEY, 	-- 식별값
    ID VARCHAR(255) NOT NULL UNIQUE, 		-- 로그인용 ID
    NNAME VARCHAR(255) NOT NULL,			-- 닉네임	
    PASS VARCHAR(255) NOT NULL,				-- 비밀번호
    EMAIL VARCHAR(255) NOT NULL,			-- 이메일
    NAME VARCHAR(255),						-- 이름
    BIRTHDATE DATE,							-- 생년월일 추가
    GENDER VARCHAR(10),						-- 성별 추가
    STOPU BOOLEAN DEFAULT FALSE,			-- 정지 유저 구분
    POINT INT DEFAULT 0						-- 포인트(구매같은거 할때 쓰는)
);

-- 집에서 사용할 DB
-- 관리자 계정 만듬
INSERT INTO MEMBER(ID,NNAME,PASS,EMAIL,NAME,BIRTHDATE, GENDER, POINT)
VALUES('ADMIN','ADMIN','ADMIN','EMAIL@EMAIL','ADMIN','1111-11-11','남성','9999');

-- 첫번째 유저
INSERT INTO MEMBER(ID,NNAME,PASS,EMAIL,NAME,BIRTHDATE, GENDER, POINT)
VALUES('USER1','NNAME1','12345','USER1@naver.com','NAME1','1995-07-14','남성', '1000');

DROP TABLE MEMBER;

DESC MEMBER;
SELECT * FROM MEMBER;

-- 유저 정보 테이블 (2023,08,16 수정)
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
--    INDEX(IDN)								-- ID값 불러오기
);

SELECT * FROM FreeBoard;

DROP TABLE FreeBoard;

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

DROP TABLE ImageBoard;

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

DROP TABLE FreeBoardComments;

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
DROP TABLE ImageBoardComments;

-- 구매내역 테이블
CREATE TABLE Bought (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,			-- 구매관리 번호
    UserID VARCHAR(255), 								-- 사용자 식별자 (로그인 ID 등)
    ProductName VARCHAR(255), 							-- 구매한 상품명
    PointSpent INT DEFAULT 0, 							-- 사용된 포인트
    FOREIGN KEY (UserID) REFERENCES MEMBER(ID)			-- 구매한 사람 ID 값 불러오기
);

DROP TABLE Bought;

-- 간단한 Q&A 테이블 생성
CREATE TABLE QnA (
    QnAID INT AUTO_INCREMENT PRIMARY KEY,				-- Q&A 식별값
    QuestionTitle VARCHAR(255), 						-- Q&A 제목
    QuestionContent TEXT         						-- Q&A 내용
);	

SELECT * FROM QnA;
INSERT INTO QnA (QuestionTitle, QuestionContent)  VALUES('제목','노트북 옅구름 함초롱하다 감사합니다 이플 사과 그루잠 별하 여우별 로운 나비잠 컴퓨터 함초롱하다 노트북 비나리 여우비 옅구름 우리는 별빛 로운 여우비 아름드리 여우비 감또개 도담도담 여우비 별빛 아슬라 가온해 안녕 책방 옅구름 달볓 바람꽃 포도 소록소록 아련 별빛 바나나 함초롱하다 안녕 도서관 소록소록 도담도담 도서관 별하 소솜 안녕 나비잠 도서.

도르레 아리아 로운 여우비 미쁘다 아름드리 여우별 책방 아리아 다솜 감사합니다 곰다시 로운 도서 아름드리 아름드리 산들림 다솜 아리아 소솜 곰다시 가온누리 이플 옅구름 가온누리 소솜 여우비 예그리나 도서 예그리나 나비잠 도서관 비나리 그루잠 바나나 곰다시 여우별 이플 여우별 바나나 달볓 여우별 바나나 아련 도서관 감또개 로운 가온누리 미리내 우리는.');

-- 업적 테이블
CREATE TABLE Achievements (
    AchievementID INT AUTO_INCREMENT PRIMARY KEY,		-- 업적 식별값
    UserID VARCHAR(255), 								-- 사용자 식별자 (로그인 ID 등)
    AchievementName VARCHAR(255), 						-- 업적명
    AchievementDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- 달성한 날짜
    FOREIGN KEY (UserID) REFERENCES MEMBER(ID)			-- 업적 달성한 사람 ID 값 불러오기
);

DROP TABLE Achievements;

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

DROP TABLE Message;


-- 민준 테스트용
CREATE TABLE test_imageBoard (
	BNO INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,				-- 글 제목
    CONTENT TEXT,								-- 글 내용
    Auth VARCHAR(255),							-- 작성자
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,	-- 작성 시간
    VCNT INT DEFAULT 0,							-- 조회수
    LCNT INT DEFAULT 0,							-- 좋아요 수
    ImageURL VARCHAR(255),						-- 이미지 경로
    del boolean default false,
    CommentCount INT DEFAULT 0
);

-- 이미지 게시판 댓글 테이블 
CREATE TABLE test_Comments (
    CommentNO INT AUTO_INCREMENT PRIMARY KEY,				-- 댓글 번호 저장
    ImageBoardBNO INT,										-- 이미지게시판 댓글 번호
    CommentContent TEXT,									-- 이미지게시판 댓글 내용
    CommenterID VARCHAR(255),								-- 이미지게시판 댓글 작성자
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,			-- 댓글 작성시간
    FOREIGN KEY (ImageBoardBNO) REFERENCES test_imageBoard(BNO)	-- 외부 게시판 값 불러오기
    -- FOREIGN KEY (CommenterID) REFERENCES MEMBER(ID)			-- 외부 ID 값 불러오기
);

-- 트리거추가
-- 댓글 달리면 해당 게시글 댓글 카운트 추가

DELIMITER 
//
CREATE TRIGGER update_comment_count
AFTER INSERT ON test_Comments
FOR EACH ROW
BEGIN
    UPDATE test_imageBoard
    SET CommentCount = CommentCount + 1
    WHERE BNO = NEW.ImageBoardBNO;
END;
// 
DELIMITER;

-- 댓글 삭제되면 해당 게시글 댓글 카운트 감소
DELIMITER //
CREATE TRIGGER update_comment_count2
AFTER DELETE ON test_Comments
FOR EACH ROW BEGIN
    UPDATE test_imageBoard
    SET CommentCount = CommentCount - 1
    WHERE BNO = OLD.ImageBoardBNO;
END;
//
DELIMITER ;

DROP TABLE test_comments;

DROP TABLE test_imageBoard;

select * from member;

 
alter table test_imageBoard add del boolean default false;	-- 게시글 삭제 유무 추가
alter table test_imageBoard add del boolean default 0;	-- 게시글 삭제 유무 추가
-- (0 : flase(안삭제), 1 : true(삭제))

SELECT * FROM test_comments;

select * from test_imageBOard;

show triggers;

use final_project;

-- 공지사항 테이블 생성
CREATE TABLE noticeBoard (
    bno INT AUTO_INCREMENT PRIMARY KEY,			-- 글 번호
    title VARCHAR(255) NOT NULL,				-- 글 제목
    content MEDIUMTEXT NOT NULL,				-- 글 내용
    auth VARCHAR(255) NOT NULL,					-- 작성자
    regdate DATETIME DEFAULT CURRENT_TIMESTAMP,	-- 작성 시간
    vcnt INT DEFAULT 0,							-- 조회수
    likeCnt INT DEFAULT 0,						-- 좋아요 수
    fixedNotice BOOLEAN DEFAULT FALSE,			-- 고정 공지
   	FOREIGN KEY (auth) REFERENCES MEMBER(ID)
--    INDEX(IDN)								-- ID값 불러오기
);

desc noticeBoard;
SELECT * FROM noticeBoard;
drop table noticeBoard;
INSERT INTO noticeBoard (title,content,auth,fixedNotice)VALUES('제목3','내용3','ADMIN',false);

-- 드랍전용 sql문
DROP TABLE MEMBER;
DROP TABLE USER;
DROP TABLE FreeBoard;
DROP TABLE ImageBoard;
DROP TABLE FreeBoardComments;
DROP TABLE ImageBoardComments;
DROP TABLE Bought;
DROP TABLE Achievements;
DROP TABLE Message;

commit;
