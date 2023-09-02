USE weekstore;
SHOW TABLES;

create table custom(
id VARCHAR(20) PRIMARY KEY,
pw VARCHAR(500) NOT NULL,
name VARCHAR(100) NOT NULL,
point INT DEFAULT	0,
grade VARCHAR(4) DEFAULT 'F',
tel VARCHAR(13) NOT NULL,
email VARCHAR(100) NOT NULL,
birth VARCHAR(20) NOT NULL,
regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
job INT DEFAULT 0,  
addr VARCHAR(500)
);

INSERT INTO	custom VALUES('admin','1234','관리자',DEFAULT,DEFAULT,'01012341234','admin@buddystore.com','1900-01-01',DEFAULT,2,'서울');

INSERT INTO	custom VALUES('kim','7979','김민수',DEFAULT,DEFAULT,'01012341234','admin@buddystore.com','1992-01-23',DEFAULT,2,'서울');
UPDATE custom SET pw='0ick8VOF/t8cMPZQyF9E/uEUVqdwsXt4z4xdT2RTPNOERtNClP/e/yXWJt9ShtJdBdwpCg==' WHERE pw='7979';


SELECT * FROM custom;


CREATE TABLE faq(fno INT PRIMARY KEY AUTO_INCREMENT,
question VARCHAR(200) NOT NULL,
answer VARCHAR(1000));
SELECT * FROM faq;

INSERT INTO faq (question, answer) VALUES 
('수업에 필요한 교사용 자료(DVD, PPT 등)는 어디에서 다운받을 수 있나요?', '교사용 자료 이용을 원하시는 선생님들을 위해 무료 온라인 교수 학습 지원 사이트인 T셀파(tsherpa.co.kr)을 운영하고 있습니다. T셀파 사이트에서 별도로 회원 가입을 하신 후, GPKI 인증을 하시면 다양한 자료를 이용하실 수 있습니다. 인증을 받지 않으신 선생님은 서비스 이용에 제한이 있으며, 자세한 문의 사항은 T셀파 고객센터 1577-7609로 문의해 주시기 바랍니다.'),
('학습 교재(정오표, 정답 및 해설 등)의 관련 자료를 다운받고 싶어요.', '고객만족센터 > 자료실에서 학습 교재 관련 자료를 다운받을 수 있습니다.'),
('교재에 대한 문의 사항이나 의견이 있어요.', '고객만족센터 > 1:1 문의에서 문의 사항을 남겨 주시면 과목별 담당자의 답변을 받아보실 수 있습니다.'),
('교과서, 지도서는 어디에서 구입할 수 있나요?', '천재교과서 발행 교과서 및 지도서는 천재교과서 쇼핑몰 홈페이지(mall.chunjaetext.co.kr)에서 천재교육 발행 교과서 및 지도서는 천재교육 쇼핑몰(mall.chunjae.co.kr)에서 구매하실 수 있습니다. 한국검인정교과서협회(www.ktbook.com)에서도 구매하실 수 있습니다.'),
('자습서, 평가문제집을 구매하고 싶어요.', '자습서와 평가문제집은 온라인에서 판매하지 않습니다. 주변의 가까운 서점에서 구매하시기 바랍니다.');
                                          

create table notice(
   no serial primary key,
   title varchar(200) not null,
   content varchar(1000),
   resdate date default current_date
);
insert into notice values (default,
						   '페이스북 로그인 불가에 따른 대체 로그인 이용 방법 안내',
						   '안녕하세요! buddy입니다.<br><br>
						   페이스북 로그인 보안정책 변경에 따라 현재 수정 중에 있습니다.<br>
						   임시적으로 페이스북 로그인 아이드를 확인해서 사이트 이용할 수 있는 방법을 안내해 드립니다.<br>
						   "BUDDY 페이스북 계정 찾기" 버튼을 클릭하여 서비스를 이용해 주시기 바랍니다.<br><br>
						   빠른 시일 내에 페이스북 로그인도 정상적으로 이용 하실 수 있도록 노력하겠습니다.<br><br>
						   감사합니다.'
						   ,default);
insert into notice values (default,
						   'ios 앱 업데이트 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   ios 기기에서 버전 업데이트 되었습니다.<br>
						   App Store에서 앱을 업데이트 하시고<br>
						   더욱 편리해진 ebook을 만나보세요.<br><br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   'BUDDY STORE 사이트 서비스 점검 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   안정적인 서비스 제공을 위한 시스템 점검을 실시합니다.<br>
						   점검 작업이 진행되는 동안 지연이 발생할 수 있는 점 양해 부탁드리며,<br>
						   보다 나은 서비스 제공을 위해 노력하는 BUDDY가 되겠습니다.<br><br>
						   [서비스 점검 일시]<br>2023년 08월 25일 00:00 ~ 06:00 (6시간)'
						   , default);
insert into notice values (default,
						   '2023년 BUDDY 중학 뉴런 참고서',
						   '전 과목 기본 개념을 완벽하게 잡아주고,<br>
						   수준별 콘텐츠 제공을 통한<br>개인 맞춤형 교육 환경을 실현한<br>
						   BUDDY 중학 뉴런!<br><br>학교가 달라도, 교과서가 달라도,<br>
						   뉴런 하나로 내신 완성!<br><br>이제 뉴런도 골라보자!'
						   , default);
insert into notice values (default,
						   'BUDDY <교과프로그램> 강사 모집',
						   'BUDDY <교과프로그램>에 출연할 선생님을 공개 모집합니다.<br>
						   제출 서류가 양식에 맞지 않거나 일부라도 누락된 경우, <br>삼사대상에서 제외합니다.<br>
						   보다 나은 미래와 더 큰 교육을 꿈 꾸는 선생님들의 많은 응모 바랍니다.<br><br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   '고교 강의 앱 일부 영역 비노출 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   2023학년도 대학수학능력시험을 앞두고 원활한 서비스 제공을 위해<br>
						   고교 강의 강좌 추천 영역이 비노출 됩니다.<br>
						   검색을 통해서 이용해주세요.<br><br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   'BUDDY 개인정보처리방침 변경 사전 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   BUDDY 인터넷 서비스를 이용해주셔서 감사 드리며,<br>
						   개인정보처리방침 변경에 관해 안내 말씀 드립니다.<br>
						   BUDDY는 고객 여러분의 개인정보를 무엇보다 소중하게 처리하고 있으며,<br>
						   어떤 사안보다 우선하여 안전하게 관리하고 있습니다.<br><br>
						   고객 여러분께서는 새롭게 바뀐 개인정보처리방침의 변경사항을 확인하시어 서비스 이용에 참고하시기 바랍니다.<br><br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   '일부 콘텐츠 서비스 종료 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   BUDDY에서 제공되었던 일부 콘텐츠 서비스가 종료됨을 안내드립니다.<br>
						   2023년 9월 1일부터 서비스가 종료되오니 학습에 참고해 주시기 바랍니다.<br><br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   'BUDDY 커리큘럼 대공개!',
						   '안녕하세요! BUDDY입니다.<br><br>
						   믿고 따라가는 BUDDY만의 고등 커리큘럼이 드디어 공개 되었습니다.<br><br>
						   [고3]<br>연계 교재를 기반으로한 필수 커리큘럼과 등급별 커리큘럼으로 구성하였습니다.<br>
						   핵심 교재와 핵심 강좌! 기출특강 시리즈를 기대해주세요!<br>
						   [고1/2]<br>수시에 커다란 비중을 차지하고 있는 내신 점수 확보를 위해 학교시험 대비 강좌를 증설하였습니다!<br>
						   학습 수준에 따라 나에게 맞는 커리큘럼을 선택하세요!<br><br>감사합니다.'
						   , default);
insert into notice values (default,
						   '배송비 정책 변경 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   항상 BUDDY를 아끼고 사랑해 주시는 고객님께 깊은 감사드립니다.<br>
						   배송비 정책이 변경되어 안내 드립니다.<br>
						   - 적용일시 : 2023년 2월 20일 월요일 오전 08시 ~<br><br>
						   ※ 유의사항<br>
               			   - 적용일시 이후에 주문, 반품신청을 진행할 경우에 변경된 배송비로 적용됩니다.<br>
						   - 고객 부담 반품 배송비도 2,500원으로 변경됩니다.<br><br>
						   더욱 편리하고 안정적인 서비스를 제공하기 위해 노력하겠습니다.<br>
						   감사합니다.'
						   , default);
insert into notice values (default,
						   '마케팅 정보 수신동의 확인 안내',
						   '안녕하세요! BUDDY입니다.<br><br>
						   정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라<br>
						   마케팅 정보 수신에 동의한 경우 동의사실을 매 2년마다 안내해드립니다.<br><br>
						   안내<br>
						   ∙ 별도 의사 표현이 없으실 경우, 동의정보가 2년 자동연장 됩니다.<br>
						   ∙ 회원가입, 주문배송, 약관안내, 회사 주요정책 변경 관련 내용은 수신동의 여부와 관계없이 발송됩니다.<br>
						   ∙ 마케팅 수신 및 정보 제공 동의 관리는 마이>마케팅 수신 및 정보 제공 동의 관리, 고객센터(1544-1900) 또는 매장 안내데스크에서 가능합니다.<br>
						   ∙ 각종 할인혜택과 관심분야의 서비스 메일은 마이>알림신청내역에서 가능합니다.<br><br>
						   교보문고는 고객님께 보다 편리하고, 질 높은 도서 서비스를 제공할 것을 약속드리며,<br>
						   고객정보의 보호 및 엄격한 관리를 위해 최선을 다할 것 입니다.<br><br>
						   앞으로도 고객 여러분께 더욱 만족스러운 서비스를 제공할 수 있도록 노력하겠습니다.<br>
						   감사합니다.'
						   , default);
create table event(
   no serial primary key,
   title varchar(200) not null,
   content varchar(1000),
   resdate date default current_date,
   img varchar (1000) null
);
insert into event values (default,
						   'BUDDY ebook 구매자 대상 설문조사 이벤트',
						   'ebook 구매자 대상 설문조사에 참여해 주세요!<br> 추첨하여 상품권을 드립니다.<br><br>
						   <span>이벤트 기간 : 23.08.16 ~ 23.09.01</span>'
						   , default
						   , 'ebook.jpg');
insert into event values (default,
						   '9월 모의고사 사전준비 ALL IN ONE 이벤트',
						   '열공 다짐 남기고, BUDDY ALL IN ONE 사전 준비 서비스로<br> 시험 대비 확실히 하세요!<br><br>
						   <span>이벤트 기간 : 23.08.18 ~ 23.09.07</span>'
						   , default
						   ,'Sep.jpg');
insert into event values (default,
						   '8월 출석체크 이벤트',
						   'BUDDY와 함께 매일 공부하는 습관 들이기!<br><br>
						   <span>이벤트 기간 : 23.08.01 ~ 23.08.31</span>'
						   , default
						   , 'Aug.jpg');
insert into event values (default,
						   '초고속 수능 성공 패키지 이벤트',
						   '100일 안에 완성하는 실력 상승의 마법!<br> 초고속 수능 성공 패키지 듣고 선물 받아가세요!<br><br>
						   <span>이벤트 기간 : 23.08.01 ~ 23.08.31</span>'
						   , default
						   , '100.jpg');
insert into event values (default,
						   'BUDDY 초등·중등·고등 여름 브랜드전',
						   'BUDDY 추천 참고서와 함께 실력 쑥쑥 올라가는 알찬 여름 되세요!<br><br>
						   <span>이벤트 기간 : 23.07.11 ~ 23.08.31</span>'
						   , default
						   , 'summer.jpg');
						   
create table winner(
   no serial primary key,
   title varchar(200) not null,
   content varchar(1000),
   resdate date default current_date
);
insert into winner values (default,
						  '[만점왕 단원평가 (2023)] 당첨자 발표',
						  '안녕하세요. 고객님!<br>
						  [만점왕 단원평가 (2023)]에 당첨을 축하드립니다.<br><br>
						  ★당첨자★<br>
						  서*  seo*****<br><br>
						  미 수령시 당첨자 발표일자 기준 3개월 이내로 연락이 없으실 경우,<br>
						  당첨은 자동으로 취소됩니다.<br><br>
						  항상 BUDDY를 사랑해 주셔서 감사합니다.
						  ',
						  default);
insert into winner values (default,
						  '[중학 영어듣기능력평가 완벽대비 (2023)] 당첨자 발표',
						  '안녕하세요. 고객님!<br>
						  [중학 영어듣기능력평가 완벽대비 (2023)]에 당첨을 축하드립니다.<br><br>
						  ★당첨자★<br>
						  한*  han***<br><br>
						  미 수령시 당첨자 발표일자 기준 3개월 이내로 연락이 없으실 경우,<br>
						  당첨은 자동으로 취소됩니다.<br><br>
						  항상 BUDDY를 사랑해 주셔서 감사합니다.
						  ',
						  default);
insert into winner values (default,
						  'BUDDY EBOOK 오픈! 리뷰 이벤트 당첨자 발표',
						  '안녕하세요. 고객님!<br>
						  BUDDY EBOOK 오픈! 리뷰 이벤트에 당첨을 축하드립니다.<br><br>
						  ★당첨자★<br>
						  *소*  ******yoon<br><br>
						  미 수령시 당첨자 발표일자 기준 3개월 이내로 연락이 없으실 경우,<br>
						  당첨은 자동으로 취소됩니다.<br><br>
						  항상 BUDDY를 사랑해 주셔서 감사합니다.
						  ',
						  default);						 
insert into winner values (default,
						  '[공부머리의 발견] 출간 기념 이벤트 당첨자 발표',
						  '안녕하세요. 고객님!<br>
						  [공부머리의 발견] 출간 기념 이벤트에 당첨을 축하드립니다.<br><br>
						  ★당첨자★<br>
						  *은*  ******young<br><br>
						  미 수령시 당첨자 발표일자 기준 3개월 이내로 연락이 없으실 경우,<br>
						  당첨은 자동으로 취소됩니다.<br><br>
						  항상 BUDDY를 사랑해 주셔서 감사합니다.
						  ',
						  default);
select * from winner;



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

CREATE VIEW qnalist AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, 
a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME
FROM qna a, custom b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

-- inventory 재고 view
create view sel1 as (select pno, sum(amount) as amount from receive group by pno);
create view sel2 as (select pno, sum(amount) as amount from serve group by pno);
create view inventory as (select a.pno, (a.amount-b.amount) AS amount from sel1 a, sel2 b  WHERE a.pno = b.pno);




-- 상품 테이블 생성
CREATE TABLE product(pno INT PRIMARY KEY AUTO_INCREMENT,
cate VARCHAR(3) NOT NULL, prono VARCHAR(10) NOT NULL,
pname VARCHAR(100) NOT NULL, pcomment VARCHAR(2000) NOT NULL,
plist VARCHAR(2000), price INT DEFAULT 1000,
imgsrc1 VARCHAR(256) DEFAULT 'noimg.jpg',
imgsrc2 VARCHAR(256) DEFAULT 'noimg.jpg',
imgsrc3 VARCHAR(256) DEFAULT 'noimg.jpg',
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
			
-- 상품 부가정보 테이블 생성
CREATE TABLE addinfo(ano INT PRIMARY KEY AUTO_INCREMENT,
pno INT NOT NULL, title VARCHAR(200) NOT NULL,
movie VARCHAR(256) DEFAULT 'sample1.mp4',
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- 카테고리 테이블
CREATE TABLE category(
	cno VARCHAR(4) PRIMARY KEY,
	cname VARCHAR(100) NOT NULL
);
INSERT INTO category VALUES('A', '유아동화책');
INSERT INTO category VALUES('B', '초등교과서');
INSERT INTO category VALUES('C', '초등참고서');
INSERT INTO category VALUES('D', '중등교과서');
INSERT INTO category VALUES('E', '중등참고서');
INSERT INTO category VALUES('F', '고등교과서');
INSERT INTO category VALUES('G', '고등참고서');
INSERT INTO category VALUES('H', 'EBook');

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


SELECT * FROM qna;
SELECT * FROM custom;


SELECT * FROM product;
INSERT INTO product VALUES(DEFAULT, 'F', '', '고등 연극(구민정)', '설명', '목차', 9500, 
'https://mall.chunjaetext.co.kr/web/product/big/20200417/29cf8e69442cefdc8222ff76495513f2.jpg',
'https://mall.chunjaetext.co.kr/web/product/high/%EA%B3%A0%EB%93%B1_%EA%B5%90%EA%B3%BC%EC%84%9C_%EC%97%B0%EA%B7%B9(%EA%B5%AC%EB%AF%BC%EC%A0%95)-1%20copy.jpg', 
'https://mall.chunjaetext.co.kr/web/product/high/%EA%B3%A0%EB%93%B1_%EA%B5%90%EA%B3%BC%EC%84%9C_%EC%97%B0%EA%B7%B9(%EA%B5%AC%EB%AF%BC%EC%A0%95)-2%20copy.jpg', 
 DEFAULT)
-- UPDATE product SET prono = concat(cate, pno) WHERE pno=3;

UPDATE product SET prono = concat(cate, pno);


INSERT INTO product VALUES(DEFAULT, 'B', '', '초등 미술(안금희) 3', '설명', '목차', 5000, 
'e3a0.jpg', 'e3a1.jpg', 'e3a2.jpg', DEFAULT);


INSERT INTO product VALUES(DEFAULT, 'B', '', '초등 음악(양종모) 3', '설명', '목차', 4000, 
'e3m0.jpg', 'e3m1.jpg', 'e3m2.jpg', DEFAULT);

INSERT INTO product VALUES(DEFAULT, 'B', '', '초등 사회 4-1(박용조)', '설명', '목차', 7000, 
'e4s0.jpg', 'e4s1.jpg', 'e4s2.jpg', DEFAULT);


INSERT INTO product VALUES(DEFAULT, 'D', '', '중학 컴퓨팅과융합(김성백)', '설명', '목차', 10000, 
'mc0.jpg', 'mc1.jpg', 'mc2.jpg', DEFAULT);

INSERT INTO product VALUES(DEFAULT, 'D', '', '중학 보건(유인숙)', '설명', '목차', 7000, 
'mh0.jpg', 'mh1.jpg', 'mh2.jpg', DEFAULT);


INSERT INTO product VALUES(DEFAULT, 'D', '', '중학 생활일본어(박민영)', '설명', '목차', 9000, 
'mj0.jpg', 'mj1.jpg', 'mj2.jpg', DEFAULT);










COMMIT;










