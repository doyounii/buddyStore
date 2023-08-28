create table notice(no serial primary key, 
title varchar(200) not null, content varchar(1000),
resdate timestamp default current_timestamp,
visited integer default 0);

create table custom(id varchar(20) primary key,
pw varchar(300) not null, name varchar(100) not null,
point integer default 0, grade varchar(4) default 'F',
tel varchar(11) not null, email varchar(100) not null,
birth date not null,
regdate timestamp default current_timestamp);


insert into custom values('admin','1234','관리자',default,
default,'01012341234','admin@chunjae.com','2023-08-17',
default);
insert into custom values('kim','1004','김현경',default,
default,'01010041004','kim@chunjae.com','1999-02-08',
default);
insert into custom values('shin','7979','신예은',default,
default,'01079797979','shin@gmail.com','2000-12-31',
default);

insert into notice values (default, '임시글1',
'임시글1의 내용입니다.', default, default);
insert into notice values (default, '더미글2',
'더미글2의 내용입니다.', default, default);
insert into notice values (default, '임시글3',
'임시글3의 내용입니다.', default, default);
insert into notice values (default, '더미글4',
'더미글4의 내용입니다.', default, default);
insert into notice values (default, '테스트글5',
'테스트글5의 내용입니다.', default, default);
insert into notice values (default, '임시글6',
'임시글6의 내용입니다.', default, default);
insert into notice values (default, '테스트글7',
'테스트글7의 내용입니다.', default, default);
insert into notice values (default, '더미글8',
'더미글8의 내용입니다.', default, default);
insert into notice values (default, '공지사항테스트9',
'공지사항테스트글9의 내용입니다.', default, default);
insert into notice values (default, '공지사항10',
'공지사항글10의 내용입니다.', default, default);
insert into notice values (default, '임시글11',
'임시글11의 내용입니다.', default, default);
insert into notice values (default, '더미글12',
'더미글12의 내용입니다.', default, default);

select * from notice;
select * from custom;

alter table custom add column addr varchar(300);

alter table custom alter column tel TYPE varchar(13);
alter table custom alter column pw TYPE varchar(500);
alter table custom alter column birth TYPE varchar(20);


update custom set pw='PiaaQ0NRSE2oqCNJjnWMILh7I0NxM41bVTR9vU1Rp60Jy8aFU0UvVRrHZcSHKa2X3xBYxg==' where pw='1234';
update custom set pw='lT57o27KGFcAj7lOt7bR+E6M05qDBLEif0H6EJISfb1GtOib0Qxh94Mg3is9X6nfmoj2mw==' where pw='1004';
update custom set pw='0ick8VOF/t8cMPZQyF9E/uEUVqdwsXt4z4xdT2RTPNOERtNClP/e/yXWJt9ShtJdBdwpCg==' where pw='7979';

commit;

create table filetest(
uname varchar(200), 
subject varchar(300), 
content varchar(1000),
filename varchar(500)
);

select * from filetest;

create table filetest2(
uname varchar(200), 
subject varchar(300), 
content varchar(1000),
filename1 varchar(500),
filename2 varchar(500),
filename3 varchar(500)
);

select * from filetest2;


-- 상품 테이블 생성
create table product(pno serial primary key,
cate varchar(3) not null, prono varchar(10) not null,
pname varchar(100) not null, pcomment varchar(2000) not null,
plist varchar(2000), price integer default 1000,
imgsrc1 varchar(256) default 'noimg.jpg',
imgsrc2 varchar(256) default 'noimg.jpg',
imgsrc3 varchar(256) default 'noimg.jpg',
resdate timestamp default current_timestamp);			 

-- 상품 부가정보 테이블 생성
create table addinfo(ano serial primary key,
pno integer not null, title varchar(200) not null,
movie varchar(256) default 'sample1.mp4',
resdate timestamp default current_timestamp);

-- 입고 테이블 생성
create table receive(rno serial primary key,
pno integer not null, amount integer default 1,
rprice integer default 1000,
resdate timestamp default current_timestamp);

-- 출고 테이블 생성
create table serve(
serno serial primary key,
pno integer not null, 
amount integer default 1,
sprice integer default 1000,
resdate timestamp default current_timestamp,
sno integer default 0
);


-- 배송 테이블 생성
create table delivery(
dno serial primary key,
sno integer not null,
cid varchar(20) not null,
daddr varchar(300) not null, 
custel varchar(13) not null,
pcom varchar(100),
ptel varchar(13),
pstate integer default 0,	
sdate timestamp default current_timestamp,
rdate varchar(13),
bcode varchar(30)	
);

-- 결제 테이블 생성
create table payment(
sno serial primary key,
cid varchar(20) not null,
pno integer not null,
amount integer default 1,
pmethod varchar(100),
pcom varchar(100),
cnum varchar(100),
payprice integer default 1000,
dno varchar(100)	
);

-- 카테고리 테이블
create table category(
	cno varchar(4) primary key,
	cname varchar(100) not null
);

-- 카트 테이블 생성
create table cart(
	cartno serial primary key,
	cid varchar(20) not null,
	pno integer not null,
	amount integer not null
);

create table review(
	rno serial primary key,
	sno integer not null,
	cid varchar(20) not null,
	content varchar(500) not null,
	star integer default 5,
	resdate timestamp default current_timestamp
);

-- 내가 만든 테이블 목록 보기
select * from pg_tables where schemaname='public';

-- 카테고리 등록
insert into category values('A', '유아동화책');
insert into category values('B', '초등교과서');
insert into category values('C', '초등참고서');
insert into category values('D', '중등교과서');
insert into category values('E', '중등참고서');
insert into category values('F', '고등교과서');
insert into category values('G', '고등참고서');
insert into category values('H', '중등기타');
insert into category values('I', '고등교과서');
insert into category values('J', 'EBOOK');



-- 전체 이익 통계 뷰 작성
create view profit as (select pno, sum(sprice*amount) as tot from serve group by pno EXCEPT select pno, sum(rprice*amount) as tot from receive group by pno);


-- 재고 처리 뷰 생성
create view inventory as (select a.pno as pno, (sum(a.amount)-sum(b.amount)) as amount from receive a, serve b where a.pno=b.pno group by a.pno, b.pno);

select * from profit;
select * from addinfo;
select * from receive;
select * from delivery;
select * from payment;
select * from custom;
select * from inventory;
select * from cart;
select * from serve;
select * from receive;
select * from notice;
select * from product;

commit;


-- 1:1 문의 테이블 생성
CREATE TABLE qna(
qno serial PRIMARY KEY,
title VARCHAR(200) NOT NULL,
content VARCHAR(1000),
author VARCHAR(16),
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
cnt INT DEFAULT 0,
lev INT DEFAULT 0,	-- 질문(0), 답변(1)
par INT,		-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
FOREIGN KEY(author) REFERENCES custom(id) ON DELETE CASCADE 
);

-- 1:1 문의 더미 데이터 삽입
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문1 내용입니다.', 'admin', 0);
INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문2 내용입니다.', 'admin', 0);
INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문3 내용입니다.', 'admin', 0);
INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문4 내용입니다.', 'admin', 0);
INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문5 내용입니다.', 'admin', 0);
INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문6 내용입니다.', 'admin', 0);
UPDATE qna SET par=qno WHERE lev = 0;

INSERT INTO qna(title, content, author, lev, par) VALUES('질문1 답변', '답변 내용', 'admin', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES('질문2 답변', '답변 내용', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES('질문3 답변', '답변 내용', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES('질문4 답변', '답변 내용', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES('질문5 답변', '답변 내용', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES('질문6 답변', '답변 내용', 'admin', 1, 6);

-- qnalist 뷰 생성
CREATE VIEW qnalist AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, 
a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME
FROM qna a, custom b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);
-- 1:1 문의 게시판 댓글 테이블 생성
CREATE TABLE comment(
	cno serial PRIMARY KEY,
	qno INT,
	author VARCHAR(16),
   resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   content VARCHAR(200),
   FOREIGN KEY(qno) REFERENCES qna(qno) ON DELETE CASCADE
);

-- 댓글 더미 데이터 삽입
INSERT INTO comment(qno, author, content) VALUES(3, 'admin', '테스트용 댓글');
INSERT INTO comment(qno, author, content) VALUES(4, 'admin', '테스트용 댓글');
INSERT INTO comment(qno, author, content) VALUES(5, 'admin', '테스트용 댓글');
INSERT INTO comment(qno, author, content) VALUES(6, 'admin', '테스트용 댓글');
INSERT INTO comment(qno, author, content) VALUES(12, 'admin', '테스트용 댓글');

COMMIT;

select * from product;
select * from inventory;
select * from receive;
select * from serve;
select sum(amount) from receive where pno=1 group by pno ;
select * from payment where cid='admin';

 SELECT a.pno,
    sum(a.amount) - sum(b.amount) AS amount
   FROM receive a,
    serve b
  WHERE a.pno = b.pno
  GROUP BY a.pno, b.pno;
  
 create view inventory as (select a.pno as pno, (sum(a.amount)-sum(b.amount)) as amount from receive a, serve b where a.pno=b.pno group by a.pno, b.pno);
 select a.pno, (sum(a.amount) - sum(b.amount)) AS amount from receive a, serve b  WHERE a.pno = b.pno group by a.pno, b.pno;
 
 
 create view sel1 as (select pno, sum(amount) as amount from receive group by pno);
 create view sel2 as (select pno, sum(amount) as amount from serve group by pno);
 
 select a.pno, (a.amount-b.amount) AS amount from sel1 a, sel2 b  WHERE a.pno = b.pno;
 
 
 
 select pno, sum(amount) as amount from serve group by pno;

insert into receive values (default, 1,1,1000,default)
select * from notice order by no desc limit 1;
commit;