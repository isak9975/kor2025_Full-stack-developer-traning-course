--주석

--테이블 생성하기
CREATE TABLE TBL_MEMBER(
	--어떤 테이터를 저장하고 싶은지 명시
	NAME VARCHAR2(20),
	AGE NUMBER	
);

--테이블 삭제
DROP TABLE TBL_MEMBER;

-- 제약조건을 가지고 CAR 테이블 만들기
-- CONSTRAINT 제약조건명 제약조건종류(컬럼명)
CREATE TABLE TBL_CAR(
	ID NUMBER,
	BRAND VARCHAR(100),
	COLOR VARCHAR(100),
	PRICE NUMBER,
	CONSTRAINT CAR_PK PRIMARY KEY(ID)
);

CREATE TABLE EX1(
	COL1 VARCHAR2(10) PRIMARY KEY,
	COL2 VARCHAR2(10) NOT NULL UNIQUE,
	--DEFAULT SYSDATE = 데이터를 넣지 않을 시 현재 시간이 들어간다.
	CREATE_DATE DATE DEFAULT SYSDATE
);

--컬럼명 변경
ALTER TABLE EX1 RENAME COLUMN COL1 TO COL11;

--컬럼 타입 변경
ALTER TABLE EX1 MODIFY COL2 VARCHAR2(30);

--컬럼 추가
ALTER TABLE EX1 ADD COL3 NUMBER;

--이미 생성된 테이블에 제약조건 추가하기
--ALTER 테이블명 ADD CONSTRAINT 제약조건명 제약조건종류(컬럼명)
--EX1 테이블에 PK_EX1 이라는 이름으로 COLL11에 PRIMARY KET 제약조건 부여하기
ALTER TABLE EX1 ADD CONSTRAINT PK_EX1 PRIMARY KEY(COL11);

-- 제약조건 삭제하기
-- ALTER TABLE 테이블명 DROP CONSTAINT 제약조건명;
ALTER TABLE EX1 DROP CONSTRAINT PK_EX1;

DROP TABLE EX1;


-- TBL-ANIMAL 테이블 생성하기
-- 컬럼
-- ID 숫자 기본키
-- "TYPE"(종) 문자10글자
-- TYPE 이라는 예약어가 있는데도 만들고 싶으면 ""하면 된다.
-- AGE 숫자
-- FEED 문자(10)

CREATE TABLE TBL_ANIMAL(
	ID NUMBER PRIMARY KEY,
	"TYPE" VARCHAR2(10),
	AGE NUMBER,
	FEED VARCHAR2(10)
);



-- 학생 테이블
-- DEFAULT, CHECK 제약조건을 사용
-- CONSTRAINT 제약조건이름 제약조건 OR CHECK조건
CREATE TABLE TBL_STUDENT(
	ID NUMBER,
	NAME VARCHAR2(100),
	MAJOR VARCHAR2(100),
	GENDER CHAR(1) DEFAULT 'W' NOT NULL 
	CONSTRAINT BAN_CHAR CHECK(GENDER='M' OR GENDER='W'),
	BIRTH DATE CONSTRAINT BAN_DATE CHECK(BIRTH >= TO_DATE('1980-01-01','YYYY-MM-DD')),
	CONSTRAINT STD_PK PRIMARY KEY(ID)
);


--1. 하나의 릴레이션에서 튜플의 전체 개수를 릴레이션의 ( ) 이라고 한다. ( ) 의 올바른 것은?
--도메인
--테이블
--중값 속성
--카디널리티  <--
--
--2. 성별이라는 칼럼은 M 혹은 F 값만 가질 수 있다. 성별이라는 칼럼의 제약조건은 무엇인가?
--카디널리티
--도메인
--선택도 <--
--행
--
--3. 아래 칼럼을 가지는 PRODUCT 테이블을 생성하는 DDL 을 작성하시오.
--제약조건의 이름은 자동으로 부여되도록 별도로 지정하지 마시오. (단, 제약조건의 이름을 지정하더라도 감점하지 않는다.) (10점)
--<< 칼럼 정보 >>
--
--1) NO : 제품번호, 숫자, 기본키
--
--2) NAME : 제품명, 문자열 최대 100바이트, 필수
--
--3) PRICE : 제품가격, 숫자
--
--4) P_DATE : 생산일자, 날짜
	
CREATE TABLE product(
	"NO" NUMBER PRIMARY KEY,
	NAME VARCHAR2(100) NOT NULL,
	PRICE NUMBER,
	P_DATE DATE
);



