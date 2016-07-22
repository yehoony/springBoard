------------------------------------My SQL 용--------------------------------------------


CREATE TABLE board (
	boardno INT(7) NOT NULL AUTO_INCREMENT COMMENT '게시글번호',
	writer VARCHAR(20) NOT NULL COMMENT '작성자',
	writedate DATE NOT NULL COMMENT '작성일', 
	title VARCHAR(100) NOT NULL COMMENT '제목',
	content VARCHAR(2000) NOT NULL COMMENT '내용',
	passwd INT(6) NOT NULL COMMENT '글비밀번호',
	viewcnt INT(5) NOT NULL DEFAULT 0 COMMENT '조회수',
	ip VARCHAR(50) NOT NULL COMMENT '아이피',
	PRIMARY KEY (boardno)
);



CREATE TABLE member(
	id VARCHAR(50) NOT NULL COMMENT '아이디',
	passwd VARCHAR(100) NOT NULL COMMENT '비밀번호',
	birthdate VARCHAR(20) NOT NULL COMMENT '생년월일',
	grade VARCHAR(2) NOT NULL COMMENT '권한',
	phone VARCHAR(20) NOT NULL COMMENT '연락처',
	email VARCHAR(100) NOT NULL COMMENT '이메일',
	zipcode VARCHAR(50) NOT NULL COMMENT '우편번호',
	address1 VARCHAR(200) NOT NULL COMMENT '주소1',
	address2 VARCHAR(200) COMMENT '주소2',
	joindate DATE NOT NULL COMMENT '가입일',
	userphoto VARCHAR(200) COMMENT '회원사진',
	PRIMARY KEY(id)
);


CREATE TABLE reply (
	rnum INT(10) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
	content VARCHAR(2000) NOT NULL COMMENT '댓글내용',
	reply_writedate DATE NOT NULL COMMENT '댓글 작성일',
	id VARCHAR(50) NOT NULL COMMENT '작성자아이디',
	boardno INT(7) NOT NULL COMMENT '게시글 번호',
	grpno INT(7) UNSIGNED ZEROFILL NOT NULL COMMENT '부모글 번호',
	indent INT(7) UNSIGNED ZEROFILL NOT NULL COMMENT '답변여부, 답변의깊이',
	ansnum INT(7) UNSIGNED ZEROFILL NOT NULL COMMENT '답변 순서',
	PRIMARY KEY (rnum),
	FOREIGN KEY (boardno) REFERENCES board (boardno),
	FOREIGN KEY (id) REFERENCES member (id)
);



--게시판 입력
insert board (writer, writedate, title, content, passwd, viewcnt, ip)
values('김예훈', now(), '테스트1', '테스트내용1', '1234', 0, '0.0.0.0');
insert board (writer, writedate, title, content, passwd, viewcnt, ip)
values('김예훈', now(), '테스트2', '테스트내용2', '1234', 0, '0.0.0.0');
insert board (writer, writedate, title, content, passwd, viewcnt, ip)
values('김예훈', now(), '테스트3', '테스트내용3', '1234', 0, '0.0.0.0');
insert board (writer, writedate, title, content, passwd, viewcnt, ip)
values('김예훈', now(), '테스트4', '테스트내용4', '1234', 0, '0.0.0.0');
insert board (writer, writedate, title, content, passwd, viewcnt, ip)
values('김예훈', now(), '테스트5', '테스트내용5', '1234', 0, '0.0.0.0');

--게시판 수정
UPDATE board SET
boardno = '', 
writer = '', 
writedate '', 
title = '', 
content = '', 
passwd = '', 
viewcnt = '', 
ip = ''
WHERE boardno = 1;
--게시판 삭제
		



--댓글 입력

--댓글 수정

--댓글 삭제


--회원 등록

--회원 수정

--회원 삭제







