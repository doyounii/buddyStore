
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
create table serve(sno serial primary key,
pno integer not null, amount integer default 1,
sprice integer default 1000,
resdate timestamp default current_timestamp);


-- 배송 테이블 생성
create table delivery(
dno serial primary key,
sno integer not null, cid varchar(20) not null,
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
insert into category values('A', '초등교과서');
insert into category values('B', '초등참고서');
insert into category values('C', '초등문제집');
insert into category values('D', '초등기타');
insert into category values('E', '중등교과서');
insert into category values('F', '중등참고서');
insert into category values('G', '중등문제집');
insert into category values('H', '중등기타');
insert into category values('I', '고등교과서');
insert into category values('J', '고등참고서');
insert into category values('K', '고등문제집');
insert into category values('L', '고등기타');
insert into category values('M', '일반교과서');
insert into category values('N', '일반참고서');
insert into category values('O', '일반문제집');
insert into category values('P', '일반기타');
insert into category values('Q', '유아콘텐츠');
insert into category values('R', '유아놀이');
insert into category values('S', '유아기타');
insert into category values('T', '해외서적');
insert into category values('U', '해외콘텐츠');




-- 전체 이익 통계 뷰 작성
create view profit as (select pno, sum(sprice*amount) as tot from serve group by pno EXCEPT select pno, sum(rprice*amount) as tot from receive group by pno);

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

-- 재고 처리 뷰 생성
create view inventory as (select a.pno as pno, (sum(a.amount)-sum(b.amount)) as amount from receive a, serve b where a.pno=b.pno group by a.pno, b.pno);

select * from inventory;