-- ******** mysql 사용 ********
-- jdbc:mysql://localhost:3306/sunaboard
-- root / 1234

create table board(
	boardno number(7) 	  not null, 	 --글번호
	wname 	varchar(25)   not null, 	 --작성자
	wdate 	date 		  not null,	 	 --작성일
	title 	varchar(100)  not null, 	 --제목
	content varchar(2000) not null,  	 --내용
	passwd 	number(5) 	  not null,  	 --비번
	viewcnt number(5) 	  default 0, 	 --조회수
	primary key(boardno)
)


-- 게시판 내용보기
select boardno, wname, wdate, title, content, passwd, viewcnt, r
from (
		select boardno, wname, wdate, title, content, passwd, viewcnt, rownum r
		from (
				select boardno, wname, wdate, title, content, passwd, viewcnt
				from t_board
				where title like '%테스트1%'
				order by boardno desc
			 )
	 )
where r >= 1 and r <= 5
	 ㄴ
--내용 수정
update t_board 
set
	wname = '김예훈', 
	wdate = sysdate, 
	title = '훈테스트', 
	content = '훈테스트내용', 
	passwd = 1111
where boardno = 1

--내용 예제
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트1', '테스트내용', 1234, 0);
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트2', '테스트내용', 1234, 0);		 
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트3', '테스트내용', 1234, 0);			 
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트4', '테스트내용', 1234, 0);			 
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트5', '테스트내용', 1234, 0);
insert into T_BOARD(boardno, wname, wdate, title, content, passwd, viewcnt) 
			 values((select nvl(max(boardno), 0) + 1 from T_BOARD),  '김선아', sysdate, '테스트6', '테스트내용', 1234, 0);			 

--삭제
delete from T_BOARD
where boardno = 1;
		
--댓글
create table t_reply(
	rnum	number not null,	    --댓글번호
	content	varchar(500) not null,  --내용
	regdate date not null, 		    --작성일
	id 		varchar(10) not null,   --작성자 아이디
	boardno number(7) not null,		--게시글 번호
	grpno 	number(7) 	  default 0, --부모글 번호
	indent 	number(7) 	  default 0, -- 답변여부, 답변의 깊이
	ansnum 	number(7) 	  default 0, -- 답변 순서
	primary key(rnum),
	foreign key(boardno) references t_board(boardno)
)

--리플 리스트
select rnum, content, regdate, id, boardno, grpno, indent, ansnum, r
from (
		select rnum, content, regdate, id, boardno, grpno, indent, ansnum, rownum r
		from (
				select rnum, content, regdate, id, boardno, grpno, indent, ansnum	
				from t_reply
				order by rnum desc
			 )
	)
where r >= 1 and r <= 5

--리블 수정
update t_reply
set
	

--리블 등록
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트1', sysdate, 'user1', 1, 0, 0, 0);
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트2', sysdate, 'user2', 1, 0, 0, 0);
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트3', sysdate, 'user3', 1, 0, 0, 0);
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트4', sysdate, 'user4', 1, 0, 0, 0);
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트5', sysdate, 'user5', 1, 0, 0, 0);
insert into t_reply(rnum, content, regdate, id, boardno, grpno, indent, ansnum) 
values((select nvl(max(rnum), 0) + 1 from t_reply), '댓글테스트6', sysdate, 'user6', 1, 0, 0, 0);


--리플 삭제

