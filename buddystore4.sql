USE weekstore;
SHOW TABLES;
CREATE TABLE notice(no INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL, content VARCHAR(1000),
resdate TIMESTAMP DEFAULT current_TIMESTAMP,
visited INT DEFAULT 0);
CREATE TABLE custom(id VARCHAR(20) PRIMARY KEY,
pw VARCHAR(300) NOT NULL, name VARCHAR(100) NOT NULL,
point INT DEFAULT 0, grade VARCHAR(4) DEFAULT 'F',
tel VARCHAR(13) NOT NULL, email VARCHAR(100) NOT NULL,
birth VARCHAR(20) NOT NULL,
addr VARCHAR(300),
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO custom VALUES('admin','1234','관리자',DEFAULT,
DEFAULT,'01012341234','admin@chunjae.com','2023-08-17',DEFAULT,DEFAULT);
INSERT INTO custom VALUES('kim','1004','김현경',DEFAULT,
DEFAULT,'01010041004','kim@chunjae.com','1999-02-08',DEFAULT,DEFAULT);
INSERT INTO custom VALUES('shin','7979','신예은',DEFAULT,
DEFAULT,'01079797979','shin@gmail.com','2000-12-31',DEFAULT,DEFAULT);
SELECT * FROM custom;
-- ALTER TABLE custom ALTER column pw TYPE VARCHAR(500);
-- ALTER TABLE custom ALTER column birth TYPE VARCHAR(20);
INSERT INTO notice VALUES (DEFAULT, '임시글1',
'임시글1의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '더미글2',
'더미글2의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '임시글3',
'임시글3의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '더미글4',
'더미글4의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '테스트글5',
'테스트글5의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '임시글6',
'임시글6의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '테스트글7',
'테스트글7의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '더미글8',
'더미글8의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '공지사항테스트9',
'공지사항테스트글9의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '공지사항10',
'공지사항글10의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '임시글11',
'임시글11의 내용입니다.', DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT, '더미글12',
'더미글12의 내용입니다.', DEFAULT, DEFAULT);
SELECT * FROM notice;
SELECT * FROM custom;
UPDATE custom SET pw='PiaaQ0NRSE2oqCNJjnWMILh7I0NxM41bVTR9vU1Rp60Jy8aFU0UvVRrHZcSHKa2X3xBYxg==' WHERE pw='1234';
UPDATE custom SET pw='lT57o27KGFcAj7lOt7bR+E6M05qDBLEif0H6EJISfb1GtOib0Qxh94Mg3is9X6nfmoj2mw==' WHERE pw='1004';
UPDATE custom SET pw='0ick8VOF/t8cMPZQyF9E/uEUVqdwsXt4z4xdT2RTPNOERtNClP/e/yXWJt9ShtJdBdwpCg==' WHERE pw='7979';
commit;
-- 상품 테이블 생성
CREATE TABLE product(pno INT PRIMARY KEY AUTO_INCREMENT,
cate VARCHAR(3) NOT NULL, prono VARCHAR(10) NOT NULL,
pname VARCHAR(100) NOT NULL, pcomment VARCHAR(2000) NOT NULL,
plist VARCHAR(2000), price INT DEFAULT 1000,
imgsrc1 VARCHAR(256) DEFAULT 'noimg.jpg',
imgsrc2 VARCHAR(256) DEFAULT 'noimg.jpg',
imgsrc3 VARCHAR(256) DEFAULT 'noimg.jpg',
resdate TIMESTAMP DEFAULT current_TIMESTAMP);			
-- 상품 부가정보 테이블 생성
CREATE TABLE addinfo(ano INT PRIMARY KEY AUTO_INCREMENT,
pno INT NOT NULL, title VARCHAR(200) NOT NULL,
movie VARCHAR(256) DEFAULT 'sample1.mp4',
resdate TIMESTAMP DEFAULT current_TIMESTAMP);
-- 입고 테이블 생성
CREATE TABLE receive(rno INT PRIMARY KEY AUTO_INCREMENT,
pno INT NOT NULL, amount INT DEFAULT 1,
rprice INT DEFAULT 1000,
resdate TIMESTAMP DEFAULT current_TIMESTAMP);
-- 출고 테이블 생성
CREATE TABLE serve(serno INT PRIMARY KEY AUTO_INCREMENT,
pno INT NOT NULL, amount INT DEFAULT 1,
sprice INT DEFAULT 1000,
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
sno INT DEFAULT 0);
DROP TABLE delivery;
-- 배송 테이블 생성
CREATE TABLE delivery(
dno INT PRIMARY KEY AUTO_INCREMENT,
sno INT NOT NULL, cid VARCHAR(20) NOT NULL,
daddr VARCHAR(300) NOT NULL,
custel VARCHAR(13) NOT NULL,
pcom VARCHAR(100),
ptel VARCHAR(13),
pstate INT DEFAULT 0,	
sdate TIMESTAMP DEFAULT current_TIMESTAMP,
rdate VARCHAR(13),
bcode VARCHAR(30)	
);
-- 결제 테이블 생성
CREATE TABLE payment(
sno INT PRIMARY KEY AUTO_INCREMENT,
cid VARCHAR(20) NOT NULL,
pno INT NOT NULL,
amount INT DEFAULT 1,
pmethod VARCHAR(100),
pcom VARCHAR(100),
cnum VARCHAR(100),
payprice INT DEFAULT 1000,
dno VARCHAR(100)	
);
-- 카테고리 테이블
CREATE TABLE category(
	cno VARCHAR(4) PRIMARY KEY,
	cname VARCHAR(100) NOT NULL
);
-- 카트 테이블 생성
CREATE TABLE cart(
	cartno INT PRIMARY KEY AUTO_INCREMENT,
	cid VARCHAR(20) NOT NULL,
	pno INT NOT NULL,
	amount INT NOT NULL
);
CREATE TABLE review(
	rno INT PRIMARY KEY AUTO_INCREMENT,
	sno INT NOT NULL,
	cid VARCHAR(20) NOT NULL,
	content VARCHAR(500) NOT NULL,
	star INT DEFAULT 5,
	resdate TIMESTAMP DEFAULT current_TIMESTAMP
);
-- 카테고리 등록
INSERT INTO category VALUES('A', '초등교과서');
INSERT INTO category VALUES('B', '초등참고서');
INSERT INTO category VALUES('C', '초등문제집');
INSERT INTO category VALUES('D', '초등기타');
INSERT INTO category VALUES('E', '중등교과서');
INSERT INTO category VALUES('F', '중등참고서');
INSERT INTO category VALUES('G', '중등문제집');
INSERT INTO category VALUES('H', '중등기타');
INSERT INTO category VALUES('I', '고등교과서');
INSERT INTO category VALUES('J', '고등참고서');
INSERT INTO category VALUES('K', '고등문제집');
INSERT INTO category VALUES('L', '고등기타');
INSERT INTO category VALUES('M', '일반교과서');
INSERT INTO category VALUES('N', '일반참고서');
INSERT INTO category VALUES('O', '일반문제집');
INSERT INTO category VALUES('P', '일반기타');
INSERT INTO category VALUES('Q', '유아콘텐츠');
INSERT INTO category VALUES('R', '유아놀이');
INSERT INTO category VALUES('S', '유아기타');
INSERT INTO category VALUES('T', '해외서적');
INSERT INTO category VALUES('U', '해외콘텐츠');
DROP VIEW inventory;
-- 상품 목록
SELECT * FROM product ORDER BY pno;
-- 신상품 목록
SELECT * FROM product ORDER BY pno DESC LIMIT 5;
-- 베스트셀러 상품 목록
SELECT * FROM product WHERE pno in (SELECT pno FROM payment GROUP BY pno ORDER BY SUM(amount) DESC LIMIT 5);
-- 카테고리별 신상품 목록
SELECT * FROM product WHERE cate=? ORDER BY pno DESC LIMIT 3;
-- 카테고리별 베스트셀러 상품 목록
SELECT * FROM product WHERE pcode in (SELECT pno FROM payment GROUP BY pno ORDER BY SUM(amount)) and cate=? LIMIT 3;
-- 상품 등록
INSERT INTO product VALUES(DEFAULT, ?, '', ?, ?, ?, ?, ?, ?, ?, DEFAULT);
UPDATE product SET prono = concat(cate, pno) WHERE pno=?;
-- 상품 제거
DELETE FROM product WHERE pno=?;
-- 상품 정보 변경
UPDATE product SET pname=?, pcomment=?, plist=?,
price=?, imgsrc1=?, imgsrc2=?, imgsrc3=? WHERE pno=?;
SELECT * FROM receive;
-- 입고 처리 패턴
INSERT INTO receive VALUES (DEFAULT, ?, ?, ?, DEFAULT);
INSERT INTO receive(pno, amount, rprice) VALUES (?, ?, ?);
DELETE FROM product;
SELECT * FROM product;
SELECT * FROM payment;
SELECT * FROM serve;
SELECT * FROM delivery;
SELECT * FROM cart;
-- 출고 처리 패턴
INSERT INTO payment VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, '');
INSERT INTO serve VALUES(DEFAULT, ?, ?, ?, DEFAULT);
INSERT INTO delivery VALUES (DEFAULT, ?, ?, ?, ?, '','',DEFAULT,DEFAULT,'','');
DELETE FROM cart WHERE cartno=?;
-- 반품 처리 패턴(배송전이면 반품 가능)
DELETE FROM payment WHERE sno=?;
INSERT INTO receive VALUES (DEFAULT, ?, ?, ?, DEFAULT);
DELETE FROM serve WHERE sno=?;
INSERT INTO cart VALUES (DEFAULT, ?, ?, ?);
DELETE FROM delivery WHERE sno=?;
-- 배송처리
UPDATE delivery SET pcom=?, ptel=?, pstate=1,
sdate=CURRENT_TIMESTAMP, rdate=?, bcode=? WHERE dno=?;
-- 배송 완료 처리
UPDATE delivery SET pstate=2 WHERE dno=?;
-- 재고 조회
SELECT * FROM inventory;
-- 전체 이익 통계 뷰 작성
CREATE VIEW profit AS (SELECT pno, SUM(sprice*amount) AS tot FROM serve GROUP BY pno EXCEPT SELECT pno, SUM(rprice*amount) AS tot FROM receive GROUP BY pno);
SELECT * FROM profit;
SELECT * FROM addinfo;
SELECT * FROM receive;
SELECT * FROM delivery;
SELECT * FROM payment;
SELECT * FROM custom;
SELECT * FROM inventory;
SELECT * FROM cart;
SELECT * FROM serve;
SELECT * FROM receive;
SELECT * FROM review;
SELECT * FROM notice ORDER BY resdate DESC LIMIT 5 OFFSET 0;
SELECT COUNT(*) AS cnt FROM notice WHERE content LIKE '%더미%' LIMIT 5 OFFSET 0;
-- 재고 처리 뷰 생성
DROP VIEW inventory;
CREATE VIEW inventory AS (SELECT a.pno AS pno, (SUM(a.amount)-SUM(b.amount)) AS amount FROM receive a, serve b WHERE a.pno=b.pno GROUP BY a.pno, b.pno);
SELECT * FROM inventory;
CREATE TABLE faq(fno INT PRIMARY KEY AUTO_INCREMENT,
question VARCHAR(200) NOT NULL,
answer VARCHAR(1000));
SELECT * FROM faq;
INSERT INTO faq (question, answer) VALUES ('수업에 필요한 교사용 자료(DVD, PPT 등)는 어디에서 다운받을 수 있나요?', '교사용 자료 이용을 원하시는 선생님들을 위해 무료 온라인 교수 학습 지원 사이트인 T셀파(tsherpa.co.kr)을 운영하고 있습니다. T셀파 사이트에서 별도로 회원 가입을 하신 후, GPKI 인증을 하시면 다양한 자료를 이용하실 수 있습니다. 인증을 받지 않으신 선생님은 서비스 이용에 제한이 있으며, 자세한 문의 사항은 T셀파 고객센터 1577-7609로 문의해 주시기 바랍니다.'),
                                          ('학습 교재(정오표, 정답 및 해설 등)의 관련 자료를 다운받고 싶어요.', '고객만족센터 > 자료실에서 학습 교재 관련 자료를 다운받을 수 있습니다.'),
                                          ('교재에 대한 문의 사항이나 의견이 있어요.', '고객만족센터 > 1:1 문의에서 문의 사항을 남겨 주시면 과목별 담당자의 답변을 받아보실 수 있습니다.'),
                                          ('교과서, 지도서는 어디에서 구입할 수 있나요?', '천재교과서 발행 교과서 및 지도서는 천재교과서 쇼핑몰 홈페이지(mall.chunjaetext.co.kr)에서 천재교육 발행 교과서 및 지도서는 천재교육 쇼핑몰(mall.chunjae.co.kr)에서 구매하실 수 있습니다. 한국검인정교과서협회(www.ktbook.com)에서도 구매하실 수 있습니다.'),
                                          ('자습서, 평가문제집을 구매하고 싶어요.', '자습서와 평가문제집은 온라인에서 판매하지 않습니다. 주변의 가까운 서점에서 구매하시기 바랍니다.');