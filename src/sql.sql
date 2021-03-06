/*재료 테이블(코드,재료명,수량,단가)*/
CREATE TABLE INGREDIENT(
in_code VARCHAR2(100) NOT NULL,
in_name VARCHAR2(100),
use_in_cnt NUMBER(10) NOT NULL,
in_prc NUMBER(10),
wrh_in_cnt NUMBER(10),

constraints ingredient_icode_pk primary key (in_code),
constraints in_name_uq UNIQUE (in_name));

create sequence In_incode_seq
increment by 10
start with 10
maxvalue 100
nocache;

insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I10', '밀가루', 100, 100, 2);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I20', '버터', 100, 100, 5);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I30', '설탕', 100, 100, 2);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I40', '계란', 100, 100, 90);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I50', '팥앙금', 100, 100, 2);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I60', '생크림', 100, 100, 5);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I70', '우유', 100, 100, 10);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I80', '딸기쨈', 5, 100, 4);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I90', '소금', 5, 100, 4);
insert into INGREDIENT (in_code, in_name, use_in_cnt, in_prc, wrh_in_cnt)
values ('I100', '계피가루', 5, 100, 5);
-----------------------------------------------------------------------

/*빵 테이블(코드,빵이름,수량,가격)*/
CREATE TABLE BREAD(
brd_code VARCHAR2(100),
brd_name VARCHAR2(100) NOT NULL,
brd_cnt NUMBER(10),
brd_prc NUMBER(10),

constraints BREAD_BCODE_pk primary key (brd_code),
constraints brd_name_uq UNIQUE (brd_name));

create sequence In_brdcode_seq
increment by 10
start with 110
maxvalue 1000
nocache;

insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B100', '식빵', 10, 2000);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B110', '우유식빵', 10, 2200);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B120', '단팥빵', 10, 1400);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B130', '크림빵', 10, 1500);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B140', '바게트빵', 10, 2000);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B150', '베이글', 10, 2200);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B160', '단팥도넛', 10, 1200);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B170', '꽈배기도넛', 10, 1100);
insert into BREAD (brd_code, brd_name, brd_cnt, brd_prc)
values ('B180', '모닝빵', 10, 2200);

-----------------------------------------------------------------------

/*매출 테이블(번호,빵 이름,날짜,판매량)*/
CREATE TABLE SALES(
sls_num NUMBER(10),
brd_name VARCHAR2(100),
reg_date DATE,
sls_cnt NUMBER(10),

constraints SALES_TN_pk primary key (sls_num),
constraints FK_PRICE foreign key(brd_name)
references BREAD(brd_name));

-----------------------------------------------------------------------

/*레시피 테이블(재료이름,빵이름,수량)*/
CREATE TABLE RECIPE(
in_name VARCHAR2(100) NOT NULL,
brd_name VARCHAR2(100),
rcp_cnt NUMBER(10) NOT NULL,

constraints FK_CODE foreign key(in_name)
references INGREDIENT(in_name),
constraints FK_NAME foreign key(brd_name)
references BREAD(brd_name));

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '식빵', 5);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '식빵', 3);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '우유식빵', 5);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '우유식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '우유식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '우유식빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '우유식빵', 5);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '단팥빵', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '단팥빵', 1);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '단팥빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '단팥빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('팥앙금', '단팥빵', 3);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '크림빵', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '크림빵', 3);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '크림빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '크림빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('생크림', '크림빵', 3);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '크림빵', 2);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '바게트빵', 5);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '바게트빵', 3);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '바게트빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '바게트빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '바게트빵', 2);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '베이글', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '베이글', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '베이글', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '베이글', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '베이글', 3);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '단팥도넛', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '단팥도넛', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '단팥도넛', 3);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '단팥도넛', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('팥앙금', '단팥도넛', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '단팥도넛', 3);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '꽈배기도넛', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '꽈배기도넛', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '꽈배기도넛', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '꽈배기도넛', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '꽈배기도넛', 3);

insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('밀가루', '모닝빵', 4);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('버터', '모닝빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('설탕', '모닝빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('계란', '모닝빵', 2);
insert into RECIPE (in_name, brd_name, rcp_cnt)
values ('우유', '모닝빵', 4);

-----------------------------------------------------------------------

/*발주 테이블(번호,재료코드,발주날짜,발주개수,수령날짜)*/
CREATE TABLE DELIVERY(
dvr_num NUMBER(10),
in_name VARCHAR2(100),
dvr_date DATE,
dvr_cnt NUMBER(10),
rcv_date DATE,

constraints DELIVERY_NUM_pk primary key (dvr_num),
constraints FK_CODE2 foreign key(in_name)
references INGREDIENT(in_name));

--update DELIVERY set dvr_num = rownum;

create sequence Dvr_Num_seq
increment by 1
start with 1
maxvalue 1000
nocache;

insert into DELIVERY (dvr_num, in_name, dvr_date, dvr_cnt, rcv_date)
values (Dvr_Num_seq.nextval,'밀가루', sysdate, 5, sysdate+DBMS_RANDOM.VALUE(30,180)/(24*60));

select * from INGREDIENT;
select * from BREAD;
select * from SALES;
select * from RECIPE;
select * from DELIVERY;
 
-----------------------------------------------------------------------

/*
 테이블 삭제
 drop table INGREDIENT cascade constraint;
 drop table BREAD cascade constraint;
 drop table SALES cascade constraint;
 drop table RECIPE cascade constraint;
 drop table DELIVERY cascade constraint;
 */

/*시퀀스 삭제
drop sequence In_incode_seq;
drop sequence In_brdcode_seq;
*/