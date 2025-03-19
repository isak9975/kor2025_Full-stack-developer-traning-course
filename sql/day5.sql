SELECT E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES e INNER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;
//

CREATE TABLE 테이블A(
   A_id NUMBER,
   A_name varchar2(10)
);

CREATE TABLE 테이블B(
   B_id NUMBER,
   B_name varchar2(20)
);


INSERT INTO 테이블A values(1, 'John');
INSERT INTO 테이블A values(2, 'Jane');
INSERT INTO 테이블A values(3, 'Bob');

INSERT INTO 테이블B values(101, 'Apple');
INSERT INTO 테이블B values(102, 'Banana');

SELECT *
FROM 테이블A CROSS JOIN 테이블B;

-- OUTER JOIN
-- 두 테이블에서 '공통된 값을 가지지 않는 행들'도 반환한다.

-- LEFT OUTER JOIN
-- '왼쪽 테이블의 모든 행'과 '오른쪽 테이블과 왼쪽 테이블이 공통적으로 가지는 값을 반환한다.'
-- 교집합과 차집합의 연산 결과를 합친것과 같다.
-- 만약에 오른쪽 테이블에서 공통도니 값을 가지고 있는 행이 없다면 NULL을 반환

-- 사원테이블과 부서 테이블의 LEFT OUTER JOIN을 이요하여
-- 사원이 어느부서에 있는지 조회하기
SELECT E.FIRST_NAME,  D.DEPARTMENT_NAME
FROM EMPLOYEES e 
LEFT OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT * FROM STADIUM s ;
SELECT * FROM TEAM;

SELECT * FROM STADIUM s 
JOIN TEAM t ON S.HOMETEAM_ID = T.TEAM_ID;

SELECT * FROM STADIUM s 
LEFT OUTER JOIN TEAM t 
ON S.HOMETEAM_ID = T.TEAM_ID;

-- RIGHT OUTER JOIN
-- LEFT OUTER JOIN의 반대
-- 공통데이터와 오른ㅉ고 테이블에 있는 데이터를 조회
SELECT * FROM STADIUM s 
RIGHT OUTER JOIN TEAM t 
ON S.HOMETEAM_ID = T.TEAM_ID;

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E
RIGHT OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- LEFT와 RIGHT중에 뭘 많이 쓸까?
-- 상황에 따라 다르다...
-- 대부분 왼쪽 테이블의 데이터를 중심으로 분석하고자 하는 경우가 
-- 많기 때문에 LEFT를 더 많이 사용하는것 같다.



-- FULL OUTER JOIN
-- 두 테이블에서 '모든값'을 반환한다.
-- 서로 공통되지 않은 부분은 NULL로 채운다
-- 합집합의 연산과 같다.
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 부서번호, 사원명, 직업, 위치를 EMP와 DEPT테이블을 통해
-- INNER JOIN
SELECT E.EMPNO ,E.ENAME,E.JOB,D.LOC FROM EMP e JOIN DEPT d ON E.DEPTNO =D.DEPTNO

-- PLAYER TEAM 테이블에서 송종국선수가 속한 팀의 전화번호 조회하기
-- 팀 아이디, 선수 이름, 전화번호 조회
SELECT P.TEAM_ID, P.PLAYER_NAME, T.TEL, FROM PLAYER p 
LEFT JOIN TEAM t 
ON P.TEAM_ID = T.TEAM_ID 
WHERE P.TEAM_ID = (SELECT P.TEAM_ID FROM PLAYER p  WHERE P.PLAYER_NAME = '송종국');

-- JOBS테이블과 EMPLOYEES 테이블에서 
-- 직종번호, 직종이름, 이메일, 이름과 성(연결) 별칭을 이름으로 하고
-- 조회하기
SELECT J.JOB_ID,J.JOB_TITLE,E.EMAIL,E.FIRST_NAME|| ' ' || E.LAST_NAME 이름
FROM JOBS j INNER JOIN EMPLOYEES e 
ON J.JOB_ID = E.JOB_ID;

SELECT * FROM SALGRADE s;
SELECT * FROM EMP e;

-- 비등가조인
-- 두 테이블을 결합할 때 부등호(>,<,<=,>=),BTWEEN, LIKE 등
-- 다양한 비고 연산자를 통해 조인 조건을 지정하는 방식
-- 특정 값이 일정 범위 내에 속하거나, 두 값 사이의 관계를 
-- 비교하여 행을 결핣할 때 유용하다.
SELECT E.EMPNO, E.ENAME, S.GRADE, E.SAL
FROM SALGRADE s  JOIN EMP E
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- USING() : 중복되는 컬럼이 생길 시 맨 앞으로 출력하며
-- 중복 컬럼을 한개만 출력한다.
SELECT * FROM EMP JOIN DEPT
USING(DEPTNO);
--ON EMP.DEPTNO = DEPT.DEPTNO; 대신에 USING(DEPTNO); 사용


-- DEPT 테이블의 LOC별 평균 SAL를 반올림한 값과, SAL의 총합을 조회
SELECT D.LOC 지역, ROUND(AVG(E.SAL),-1) 평균, SUM(E.SAL) 총합 
FROM DEPT d LEFT JOIN EMP e 
USING(DEPTNO)
GROUP BY d.LOC
ORDER BY 총합; 


-- NATURAL JOIN
-- 두 테이블 간의 동일한 이름을 갖는 모든 컬럼들에 대해
-- 등가 조인을 수행한다
-- 컬럼 이름 뿐만 아니라 타입도 같아야 한다.
SELECT * FROM EMP INNER JOIN DEPT d 
ON EMP.DEPTNO = D.DEPTNO;

SELECT * FROM EMP NATURAL JOIN DEPT D;
-- 자동매칭
-- 두 테이블에서 이름이 동일한 컬럼을 찾아서, 해당 컬럼들이 값이 일치하는 행끼리
-- 자동으로 결합한다.
-- 중복컬럼제거
-- 조인 결과에서 공통 컬럼은 한 번만 표시된다.
-- 명시적 조건 생략
-- ON절이나 USING절 없이 간단한게 조인할 수 있다.

-- 의도하지 않은 결과가 나올 수 있다.
-- 자동으로 공통컬럼을 기준으로 조인하기 때문에, 개발자가 어떤 컬럼을
-- 기준으로 조인하는지 명확히 알기 어려울 수 있다.


-- 집합연산자
-- JOIN과는 별개로 두 개의 테이블을 합치는 방법

-- 1. UNION
-- 두 개의 테이블에서 '중복을 제거하고 합친 모든행'을 반환.
SELECT E.FIRST_NAME FROM EMPLOYEES e 
UNION 
SELECT D.DEPARTMENT_NAME FROM DEPARTMENTS d ; --하나의 행으로 합쳐짐

--2. UNION ALL
-- 중복을 제거하지 않고 모두 합친 행을 반환
SELECT E.FIRST_NAME FROM EMPLOYEES e 
UNION ALL
SELECT D.DEPARTMENT_NAME FROM DEPARTMENTS d  ORDER BY FIRST_NAME; --중복있는 하나의 행 합치기

-- VIEW
-- 하나 이상의 테이블이나 다른 뷰의 데이터를 볼 수 있게 해주는
-- 데이터베이스 객체이다.
-- 쿼리문을 작성하면 -> 1회성
-- 쿼리 결과를 마치 하나의 테이블처럼 사용할 수 있도록 하는 가상 테이블
-- 실제 데이터는 저장하지 않고, 뷰를 찹조할 때마다 미리 정의된
-- 쿼리문이 실행되어 결과가 생성된다.
-- 테이블 뿐만 아니라 다른 뷰를 참조해 새로운 뷰를 만들 수도 있다.

-- 사용목적
-- 여러 테이블에서 필요한 정보를 사용할때가 많다.
-- VIEW에 저장하면 간단하게 호출할 수 있다.

-- VIEW의 특징
-- 독립성
-- 테이블 구조가 변경되어도 뷰를 사용하는 응용프로그램은 변경하지 않아도 된다.

-- 편리성
-- 복잡한 쿼리문을 뷰로 생성함으로써 관련 쿼리를 단순하게 작성할 수 있다.
-- 자주 사용하는 SQL문이면 뷰에 저장하고 편리하게 사용할 수 있다.

-- 보안성
-- 숨기고 싶은 정보가 존재한다면, 뷰를 생성할 때 해당 컬럼은 빼고
-- 생성함으로써 사용자에게 정보를 감출 수 있다

-- VIEW의 생성
-- OR REPLACE 옵션은 기존의 정의를 변경하는데 사용할 수 있다.

/*
 
 
	 CREATE VIEW 뷰이름 AS(
	 	쿼리문
	 )
 
*/

-- VEIW의 삭제
-- DROP VIEW 뷰이름 [RESTRICT or CASCADE] 
-- RESTRICT : 뷰를 다른곳에서 참조하고 있다면 삭제가 취소
-- CASCADE : 뷰를 참조하는 다른 뷰나 제약 조건까지 모두 삭제된다.

SELECT * FROM PLAYER p;
-- 선수의 이름과 나이를 조회하세요
-- EX) 홍길동 35
SELECT P.PLAYER_NAME, ROUND((SYSDATE-P.BIRTH_DATE)/365) AGE FROM PLAYER p;

DROP VIEW PLAYER_AGE;

-- PLAYER_AGE라는 뷰를 만들어서 저장
CREATE OR REPLACE VIEW PLAYER_AGE AS(
	SELECT ROUND((SYSDATE-P.BIRTH_DATE)/365)AGE, P.* 
	FROM PLAYER p
);

SELECT * FROM PLAYER_AGE pa;
 --30살이 넘은 선수를 조회
SELECT * FROM PLAYER_AGE pa WHERE AGE > 30;


-- 사원이름과 사원의 상사 이름 조회
SELECT E.FIRST_NAME ||' '||E.LAST_NAME ENAME, D.FIRST_NAME||' '||D.LAST_NAME MNAME   
FROM EMPLOYEES e JOIN EMPLOYEES D
ON E.MANAGER_ID = D.EMPLOYEE_ID;

CREATE OR REPLACE VIEW EMPLOYEES_MANAGER
AS(
	SELECT E.FIRST_NAME ||' '||E.LAST_NAME ENAME, D.FIRST_NAME||' '||D.LAST_NAME MNAME   
	FROM EMPLOYEES e JOIN EMPLOYEES D
	ON E.MANAGER_ID = D.EMPLOYEE_ID
);

SELECT * FROM EMPLOYEES_MANAGER em ;

-- King Steven의 부하직원이 몇명인지 조횟하세요
SELECT count(*) FROM EMPLOYEES_MANAGER em WHERE mname='Steven King';

-- plyer 테이블에 team_name 컬럼을 추가한 view 만들기
-- view 이름은 player_team_name
SELECT p.*,t.TEAM_NAME FROM PLAYER p JOIN TEAM t ON p.TEAM_ID =t.TEAM_ID;

CREATE OR REPLACE VIEW player_team_name AS (
	SELECT p.*,t.TEAM_NAME FROM PLAYER p JOIN TEAM t ON p.TEAM_ID =t.TEAM_ID
);

SELECT * FROM PLAYER_TEAM_NAME ptn;

-- TEAM_NAME이 '울산현대'인 선수들을 조회
SELECT PTN.PLAYER_NAME FROM PLAYER_TEAM_NAME ptn WHERE PTN.TEAM_NAME = '울산현대';


-- HOMETEAM_ID, STADIUM_NAME, TEAM_NAME을 조회
-- HOMETEAM이 없는 경이장 이름도 나와야 함.
SELECT S.HOMETEAM_ID,S.STADIUM_NAME,T.TEAM_NAME FROM STADIUM s LEFT JOIN TEAM t 
ON S.STADIUM_ID  = T.STADIUM_ID;

CREATE OR REPLACE VIEW STADIUM_INFO AS(
	SELECT S.HOMETEAM_ID,S.STADIUM_NAME,T.TEAM_NAME FROM STADIUM s LEFT JOIN TEAM t 
ON S.STADIUM_ID  = T.STADIUM_ID
);

-- 홈팀이 없는 경기장 검색하기
SELECT * FROM STADIUM_INFO si WHERE SI.HOMETEAM_ID IS NULL;

-- 사원테이블에서 급여, 급여를 많이 받는 순으로 순위를 조회
-- DATA_PLUS라는 VEW에 저장
SELECT E.FIRST_NAME, E.SALARY ,RANK()OVER(ORDER BY e.SALARY DESC) RANK FROM EMPLOYEES e;

SELECT * FROM EMPLOYEES e ORDER BY E.SALARY DESC;

CREATE OR REPLACE VIEW DATA_PLUS AS(
	SELECT E.FIRST_NAME, E.SALARY ,RANK()OVER(ORDER BY e.SALARY DESC) RANK FROM EMPLOYEES e
);

SELECT * FROM DATA_PLUS WHERE RANK=1;

SELECT * FROM DATA_PLUS
WHERE RANK BETWEEN 11 AND 20;


-- TCL( Transaction Controller Language )
-- 트랜젝션 : 데이터베이스의 작업을 처리하는 논리적 연산 단위
-- select , insert, update, delete문을 하나의 작업단위라고 한다.

-- 트랜젝션의 특성
-- 원자성(Atomicity)
-- 일관성(Consistency)
-- 고립성(Isolation)
-- 영속성, 지속성(Durability)

-- TCL의 종류
-- COMMIT
-- ROLLBACK
-- SAVEPOINT



-- CASE문
-- 데이터의 값을 WHEN의 조건과 차례대로 비교한 후 일치하는 값을 찾아
-- THEN 뒤에 있는 결과값을 반환한다.
SELECT 
	ENAME,
	DEPTNO,
	CASE 
		WHEN DEPTNO='10' THEN 'NEW YORK'
		WHEN DEPTNO='20' THEN 'DALLAS'
		ELSE 'UNKNOWN'
	END AS LOC_NAME
FROM EMP
WHERE JOB='MANAGER'

SELECT ROUND(AVG(CASE JOB_ID WHEN 'IT_PROG' THEN SALARY END),2)
END
FROM EMPLOYEES;

-- WHERE절 에서의 사용
SELECT 
	ENAME, 
	SAL,
	CASE
		WHEN SAL>=2900 THEN 1	
		WHEN SAL>=7900 THEN 2	
		WHEN SAL>=200 THEN 3	
	END AS SAL_GRADE
FROM EMPLOYEES e 
WHERE e.JOB_ID ='MANAGER' AND ( CASE
		WHEN SAL>=2900 THEN 1	
		WHEN SAL>=7900 THEN 2	
		WHEN SAL>=200 THEN 3	
END)=1;
	
-- EMP테이블에서 SAL이 3000이상이면 HIGHT, 1000이상이면 MID,
-- 다 아니면 LOW 를 ENAME, SAL, GRADE순으로 조회

SELECT ENAME, 
		SAL,
			CASE 			
			WHEN SAL >= 3000 THEN 'HIGHT'
			WHEN SAL >= 2000 THEN 'MID'
			WHEN SAL >= 1000 THEN 'LOW'
		END AS GRADE
FROM EMP;
	

-- CASE문의 특징과 활용
-- 표현식으로 사용
-- CASE 문은 하나의 값이나 결과를 반환하는 표현식이기 때문에
-- SELECT, ORDER BY, GROUP BY등의 구문 내에서 사용될 수 있다.
-- 가독성 향상
-- 복잡한 조건에 따른 값을 한눈에 파악할 수 있게 도와줘, 쿼리의 
-- 가독성과 유지보수성이 높아진다.
-- NULL 처리
-- 조건에 해당하지 않는 경우  ELSE절에 없으면 NULL이 반환	
-- 중첩 사용 가능
-- CASE 문 안에 CASE문을 중첩해서 사용할 수 있다.
-- 표준 SQL지원
-- 대부분의 주요 데이터베이스 등에서 표준 SQL문법의 일부로 지원된다.



--===============================================================================================
-- PL(Procedural Language)/SQL문
---
-- 원래 SQL문은 주로 데이터의 정의, 조작, 제어를 위한 언어
-- PL/SQL은 여기 조건, 반복문, 변수 선언, 예외처리와 같은
-- 절차적 기능을 추가하여 복잡한 로직을 구현할 수 있게 해준다.
	

-- PL/SQL 문의 구조
---
-- 기본적으로 블록단위로 구성.하나의 블록은 세 부분으로 이루어져있다.
-- 선언부(DECLARE) : 변수, 상수, 사용자 정의 타입을 선언
-- 실행부(BEGIN ... END) : 실제 로직이 작성되는 부분
-- 예외처리부(EXCEPTION) : 실행 도중 발생하는 오류를 처리하는 구문 작성
DECLARE
	v_message varchar2(100); -- 변수느낌 let v_message;
BEGIN
	v_message := 'Hello, PL/SQL';
	DBMS_OUTPUT.PUT_LINE(v_message); -- console.log() 느낌
END;


--IF문
---
-- 1. IF 조건 THEN 실행문;
--	  END IF;
-- 2. IF 조건 THEN 실행문;
--	  ELSE 실행문;
--	  END IF;
-- 3. IF 조건 THEN 실행문;
--    ELSIF 조건 THEN 실행문;
--    ELSIF 조건 THEN 실행문;
--    ELSIF 조건 THEN 실행문;
--	  END IF;
-- CHR(10) 이스케이프 문자 == \n
DECLARE
	SALARY NUMBER := 5000; --LET SALARY = 5000;
BEGIN
	IF SALARY < 3000 THEN DBMS_OUTPUT.PUT_LINE('급여가 낮습니다');
	ELSIF SALARY BETWEEN 3000 AND 7000 THEN DBMS_OUTPUT.PUT_LINE('급여가 중간입니다');
	ELSE DBMS_OUTPUT.PUT_LINE('급여가 높습니다.');
	END IF;
END;

-- SCORE 변수에 80을 대입하고
-- GRADE VARCHAR2(5)DP 어떤 학점인지 대입하여 출력하기
-- 90점 이상은 A, 80점 이상은 B, 70점 이상은 C
-- 60점 이상은 D, 그 이하는 F
-- 당신의 점수 80점, 학점 B
DECLARE
	SCORE NUMBER := 80;
	GRADE VARCHAR2(5);
BEGIN
	IF SCORE >= 90 THEN GRADE := 'A';
	ELSIF SCORE >= 80 THEN GRADE := 'B';
	ELSIF SCORE >= 70 THEN GRADE := 'C';
	ELSIF SCORE >= 60 THEN GRADE := 'D';
	ELSE GRADE := 'F';
	END IF;
	DBMS_OUTPUT.PUT_LINE('당신의 점수:'|| SCORE||', ' || '학점:' || GRADE );
END;



-- FOR문
---
-- FOR 변수 IN 시작값 .. END값 LOOP
-- 반복하고자 하는 명령;
-- END LOOP;
-- 옵션 REVERSE
BEGIN
	FOR I IN REVERSE 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE('I의 값 : ' || I);
	END LOOP;
END;



-- 1부터 10까지 
-- X는 짝수입니다.
-- X는 홀수 입니다 출력하기
BEGIN
	FOR I IN 1..10 LOOP
		IF MOD(I,2) = 1 THEN DBMS_OUTPUT.PUT_LINE(I||'는 홀수입니다.');
		ELSE DBMS_OUTPUT.PUT_LINE(I||'는 짝수입니다.');
		END IF;
	END LOOP;
END;



-- 쿼리 결과를 행 단위로 반복처리할 때 사용
DECLARE
	CURSOR EMP_CURSOR IS 
		SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES;
BEGIN 
	FOR rec IN EMP_CURSOR LOOP
		DBMS_OUTPUT.PUT_LINE('EMPLOYEE : '|| rec.EMPLOYEE_ID || ', NAME : ' || rec.FIRST_NAME);
	END LOOP;
END;



-- WHILE
---
-- WHILE 조건 LOOP
--	반복할 문장
-- END LOOP;

-- 1 부터 10까지 총합 구해서 출력하시오
-- EX) 총합 : XX
DECLARE
	I NUMBER := 0;
	X NUMBER := 0;
BEGIN
	WHILE I <= 10 LOOP
		X := X + I;
		I := I + 1;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('총합은 : '|| X);
END;




-- PL/SQL의 종류
-- 익명블록
-- 이름 없이 한 번 실행되는 PL/SQL 블록이다
-- 데이터베이스에 저장되지 않고 즉시 실행된다.
-- 테스트, 일회성 작업, 간단한 스크립트 작성 등에 주로 사용된다.

-- 2.프로시저(Procdures)
-- 데이터베이스에 저장되어 필요할 때마다 호출할 수 있는 이름이 있는 
-- PL/SQL 블록이다.
-- 하나의 요청으로 여러 SQL문을 실행시킬 수 있다
-- 네트워크 소요시간을 줄여 성능을 개선할 수 있다.
-- 기능 변경이 편하다.

/*
 	CREATE OR REPLACE PROCEDURE 프로시저명(
 		매개변수 IN 데이터타입%TYPE
 		매개변수 IN 데이터타입%TYPE
 		매개변수 IN 데이터타입%TYPE
 	)IS
	 	함수 내에서 사용할 변수, 상수 선언
 	BEGIN
	 	실행할 문장
 	END;
 */

-- 3. 트리거(trigger)
-- 특정 테이블 또는 뷰에 대한 DML 또는 DDL 작업이 발생할 때
-- 자동으로 실행되는 PL/SQL코드이다.


--JOBS 테이블에 INSERT를 해주는 프로시저 만들어보기
SELECT * FROM JOBS j;

INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY)
VALUE (값1, 값2, 값3, 값4);

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC(
   P_JOB_ID IN JOBS.JOB_ID%TYPE,
   P_JOB_TITLE IN JOBS.JOB_TITLE%TYPE,
   P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE,
   P_MAX_SALARY IN JOBS.MAX_SALARY%TYPE
)
IS
BEGIN
   INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
   VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,P_MAX_SALARY);
   DBMS_OUTPUT.PUT_LINE('ALL DONE ABOUT '||' '||P_JOB_ID);
END;
CALL MY_NEW_JOB_PROC('IT','DEVELOPER',14000,20000);

SELECT * FROM JOBS j 


-- 함수와 프로시저의 차이
-- 함수는 반드시 하나 이상의 값을 반환해야한다. //오라클에서만
-- 함수는 SQL문 내에서 사용할 수 있다.
-- 함수는 주로 계산, 데이터의 가공, 값의 반환 작업에 사용

-- 프로시저는 값을 반드시 반환할 필요는 없다. 
-- 프로시저는 SQL문 내에서 사용할 수 없다.
-- 함수는 특정 작업이나 프로세스를 실행하기 위해 사용된다.

-- PK에 안걸리면 추가(INSERT)
-- PK에 걸리면 수정(UPDATE)





