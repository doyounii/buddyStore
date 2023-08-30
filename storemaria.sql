create table notice(
  no int auto_increment primary key,
  title varchar(200) not null,
  content varchar(1000),
  resdate timestamp default current_timestamp,
  visited int default 0
);

create table custom(
  id varchar(20) primary key,
  pw varchar(300) not null,
  name varchar(100) not null,
  point int default 0,
  grade varchar(4) default 'F',
  tel varchar(13) not null,
  email varchar(100) not null,
  birth date not null,
  regdate timestamp default current_timestamp
);

insert into custom values('admin','1234','관리자',default,default,'01012341234','admin@chunjae.com','2023-08-17',default);
insert into custom values('kim','1004','김현경',default,default,'01010041004','kim@chunjae.com','1999-02-08',default);
insert into custom values('shin','7979','신예은',default,default,'01079797979','shin@gmail.com','2000-12-31',default);

insert into notice values (default, '임시글1', '임시글1의 내용입니다.', default, default);
insert into notice values (default, '더미글2', '더미글2의 내용입니다.', default, default);
insert into notice values (default, '임시글3', '임시글3의 내용입니다.', default, default);
insert into notice values (default, '더미글4', '더미글4의 내용입니다.', default, default);
insert into notice values (default, '테스트글5', '테스트글5의 내용입니다.', default, default);
insert into notice values (default, '임시글6', '임시글6의 내용입니다.', default, default);
insert into notice values (default, '테스트글7', '테스트글7의 내용입니다.', default, default);
insert into notice values (default, '더미글8', '더미글8의 내용입니다.', default, default);
insert into notice values (default, '공지사항테스트9', '공지사항테스트글9의 내용입니다.', default, default);
insert into notice values (default, '공지사항10', '공지사항글10의 내용입니다.', default, default);
insert into notice values (default, '임시글11', '임시글11의 내용입니다.', default, default);
insert into notice values (default, '더미글12', '더미글12의 내용입니다.', default, default);

alter table custom add column addr varchar(300);
alter table custom modify column tel varchar(13);
alter table custom modify column pw varchar(500);
alter table custom modify column birth varchar(20);

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

SELECT * from filetest;

create table filetest2(
  uname varchar(200),
  subject varchar(300),
  content varchar(1000),
  filename1 varchar(500),
  filename2 varchar(500),
  filename3 varchar(500)
);

select * from filetest2;

create table product(
  pno int auto_increment primary key,
  cate varchar(3) not null,
  prono varchar(10) not null,
  pname varchar(100) not null,
  pcomment varchar(2000) not null,
  plist varchar(2000),
  price int default 1000,
  imgsrc1 varchar(256) default 'noimg.jpg',
  imgsrc2 varchar(256) default 'noimg.jpg',
  imgsrc3 varchar(256) default 'noimg.jpg',
  resdate timestamp default current_timestamp
);

create table addinfo(
  ano int auto_increment primary key,
  pno int not null,
  title varchar(200) not null,
  movie varchar(256) default 'sample1.mp4',
  resdate timestamp default current_timestamp
);



create table category(
  cno varchar(4) primary key,
  cname varchar(100) not null
);

create table cart(
  cartno int auto_increment primary key,
  cid varchar(20) not null,
  pno int not null,
  amount int not null
);

create table review(
  rno int auto_increment primary key,
  sno int not null,
  cid varchar(20) not null,
  content varchar(500) not null,
  star int default 5,
  resdate timestamp default current_timestamp
);

create view profit as (
  select pno, sum(sprice*amount) as tot from serve group by pno
  union
  select pno, sum(rprice*amount) as tot from receive group by pno
);

create view inventory as (
  select a.pno as pno, (sum(a.amount)-sum(b.amount)) as amount
  from receive a
  join serve b on a.pno = b.pno
  group by a.pno
);




INSERT INTO category VALUES('A', '유아동화책');
INSERT INTO category VALUES('B', '초등교과서');
INSERT INTO category VALUES('C', '초등참고서');
INSERT INTO category VALUES('D', '중등교과서');
INSERT INTO category VALUES('E', '중등참고서');
INSERT INTO category VALUES('F', '고등교과서');
INSERT INTO category VALUES('G', '고등참고서');
INSERT INTO category VALUES('H', 'EBook');



create table comment(
  cno int auto_increment primary key,
  qno int,
  author varchar(16),
  resdate timestamp default current_timestamp,
  content varchar(200),
  foreign key (qno) references qna(qno) on delete cascade
);
SELECT * FROM product WHERE pno IN (SELECT pno FROM (SELECT pno, SUM(amount) as total_amount FROM payment GROUP BY pno ORDER BY total_amount DESC LIMIT 1 ) subquery);
insert into comment(qno, author, content) values(3, 'admin', '테스트용 댓글');
insert into comment(qno, author, content) values(4, 'admin', '테스트용 댓글');
insert into comment(qno, author, content) values(5, 'admin', '테스트용 댓글');
insert into comment(qno, author, content) values(6, 'admin', '테스트용 댓글');
insert into comment(qno, author, content) values(12, 'admin', '테스트용 댓글');
UPDATE product JOIN (SELECT pno FROM product ORDER BY resdate DESC LIMIT 1) AS subquery ON product.pno = subquery.pno SET prono = CONCAT(cate, subquery.pno);

UPDATE product SET prono = CONCAT(cate, pno) WHERE pno = (SELECT pno FROM product ORDER BY resdate DESC LIMIT 1);

update product set prono = concat(cate, pno) where pno in (select pno from product order by resdate desc limit 1)
select * from product where pno in (select pno from payment group by pno order by sum(amount) desc limit 5);
ALTER TABLE delivery MODIFY COLUMN sdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
COMMIT;

SELECT * FROM product;
select amount from inventory where pno=5;
UPDATE product
SET prono = CONCAT(cate, pno)
WHERE pno = (SELECT pno FROM product ORDER BY resdate DESC LIMIT 1);


-- 입고테이블
create table receive(
  rno int auto_increment primary key,
  pno int not null,
  amount int default 1,
  rprice int default 1000,
  resdate timestamp default current_timestamp
);
-- 출고테이블 (선생님 코드와 달라요)
create table serve(
  serno int auto_increment primary key,
  pno int not null,
  amount int default 1,
  sprice int default 1000,
  resdate timestamp default current_timestamp,
  sno int default 0
);
-- 배송 테이블
create table delivery(
  dno int auto_increment primary key,
  sno int not null,
  cid varchar(20) not null,
  daddr varchar(300) not null,
  custel varchar(13) not null,
  pcom varchar(100),
  ptel varchar(13),
  pstate int default 0,
  sdate timestamp default current_timestamp,
  rdate varchar(13),
  bcode varchar(30)
);

-- 결제 테이블
create table payment(
  sno int auto_increment primary key,
  cid varchar(20) not null,
  pno int not null,
  amount int default 1,
  pmethod varchar(100),
  pcom varchar(100),
  cnum varchar(100),
  payprice int default 1000,
  dno varchar(100)
);
-- qna 테이블
create table qna(
  qno int auto_increment primary key,
  title varchar(200) not null,
  content varchar(1000),
  author varchar(16),
  resdate timestamp default current_timestamp,
  cnt int default 0,
  lev int default 0,
  par int,
  foreign key (author) references custom(id) on delete cascade
);
-- 질문 더미데이터
insert into qna(title, content, author, lev) values('질문1', '질문1 내용입니다.', 'admin', 0);
insert into qna(title, content, author, lev) values('질문2', '질문2 내용입니다.', 'admin', 0);
insert into qna(title, content, author, lev) values('질문3', '질문3 내용입니다.', 'admin', 0);
insert into qna(title, content, author, lev) values('질문4', '질문4 내용입니다.', 'admin', 0);
insert into qna(title, content, author, lev) values('질문5', '질문5 내용입니다.', 'admin', 0);
insert into qna(title, content, author, lev) values('질문6', '질문6 내용입니다.', 'admin', 0);
update qna set par = qno where lev = 0;
-- 답변 더미데이터
insert into qna(title, content, author, lev, par) values('질문1 답변', '답변 내용', 'admin', 1, 1);
insert into qna(title, content, author, lev, par) values('질문2 답변', '답변 내용', 'admin', 1, 2);
insert into qna(title, content, author, lev, par) values('질문3 답변', '답변 내용', 'admin', 1, 3);
insert into qna(title, content, author, lev, par) values('질문4 답변', '답변 내용', 'admin', 1, 4);
insert into qna(title, content, author, lev, par) values('질문5 답변', '답변 내용', 'admin', 1, 5);
insert into qna(title, content, author, lev, par) values('질문6 답변', '답변 내용', 'admin', 1, 6);

-- qnalist view 
CREATE VIEW qnalist AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, 
a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME
FROM qna a, custom b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

-- inventory 재고 view
create view sel1 as (select pno, sum(amount) as amount from receive group by pno);
create view sel2 as (select pno, sum(amount) as amount from serve group by pno);
create view inventory as (select a.pno, (a.amount-b.amount) AS amount from sel1 a, sel2 b  WHERE a.pno = b.pno);
 
