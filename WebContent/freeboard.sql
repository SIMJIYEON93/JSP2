-- �옄�쑀寃뚯떆�뙋 : �뀒�씠釉�2媛� (硫붿씤湲����옣, �뙎湲����옣)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- �옉�꽦�옄
	password varchar(10) not null,		-- 湲�鍮꾨�踰덊샇(�븘�슂�븷�븣留� �궗�슜)
	subject varchar(40) not null,		-- 湲��젣紐�
	content varchar(2000) not null,		-- �궡�슜
	readCount int default 0,			-- 議고쉶�닔
	wdate datetime default current_timestamp, 	-- �꽌踰꾩쓽 �쁽�옱�궇吏�/�떆媛�
	ip varchar(15) default '127.0.0.1',			-- �옉�꽦�옄 ip
	commentCount smallint default 0,			-- �뙎湲� 媛��닔
	primary key(idx)
);
alter table freeboard modify column wdate timestamp 
default current_timestamp;  -- timezone�뿉 �뵲�씪 �꽕�젙

insert into freeboard (name,password,subject,content,ip)
values ('honey','1111','�쎇而� ~~','�븯�씠 諛섍��썙','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
values ('�궗�굹','1111','welcome my home ~~','�븯�씠 諛섍��썙 �뼱�꽌��','192.168.22.3');
insert into freeboard (name,password,subject,content,ip)
values ('�굹�굹','1111','援용컮�씠 ~~','�옒媛� �삉遊�','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
values ('nayeon','1111','�쎇而� ~~','�븯�씠 諛섍��썙2','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
values ('諛뺤갔�샇','1111','�뿬濡쒖슦~~','�슫�룞醫� �븯�옄','192.168.25.4');
insert into freeboard (name,password,subject,content,ip)
values ('�꽭由щ컯','1111','�븯�씠 ~~','�슫�룞�븯�윭 媛��빞吏�','192.168.26.7');


select * from freeboard;

-- mysql �뿉�뒗 limit �궎�썙�뱶 : limit 踰덊샇,媛��닔
-- mysql,oracle select 寃곌낵�뿉 ���빐 媛곹뻾�뿉 �닚�꽌��濡� 踰덊샇瑜� 遺��뿬�븯�뒗 而щ읆(row num)
-- �씠 留뚮뱾�뼱吏묐땲�떎. limit �쓽 踰덊샇�뒗 row num �엯�땲�떎.(mysql �� 0遺��꽣 �떆�옉)
select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15;	-- 1�럹�씠吏� 紐⑸줉
select * from freeboard f order by idx desc limit 15,15; -- 2�럹�씠吏� 紐⑸줉
select * from freeboard f order by idx desc limit 30,15;  -- 3�럹�씠吏� 紐⑸줉
-- 怨꾩궛�떇 : �럹�씠吏� n=10�럹�씠吏� 湲���?   (n-1)*15
select * from freeboard f order by idx desc limit 135,15;  -- 10�럹�씠吏� 紐⑸줉
commit;

-- 湲� �닔�젙 : subject , content �닔�젙. idx 而щ읆�쓣 議곌굔�쑝濡� �빀�땲�떎.
update freeboard set subject ='援용굹�엲~', content='�옒�옄怨� �궡�씪蹂댁옄'
where idx=154;

-- 議고쉶�닔 蹂�寃� : �씫�쓣 �븣留덈떎(url �슂泥� 諛쒖깮) 移댁슫�듃 +1
update freeboard set readCount =readCount+1 where idx=154;

-- 湲� �궘�젣 : 湲� 鍮꾨�踰덊샇 1)�엳�쓣 �븣 2) �뾾�쓣�븣
delete from freeboard where idx=151 and password ='1111';
delete from freeboard where idx=151;


--  湲� 鍮꾨�踰덊샇 泥댄겕 (濡쒓렇�씤 湲곕뒫�뿉�룄 李멸퀬�븯�꽭�슂.)
select * from freeboard f where idx=159 and password ='1111';   -- �옒紐삳맂 鍮꾨�踰덊샇 : 荑쇰━寃곌낵 null
select * from freeboard f where idx=159 and password ='1212';   -- �삾諛붾Ⅸ 鍮꾨�踰덊샇 : 荑쇰━寃곌낵 1媛� �뻾 議고쉶


-- �뙎湲� �뀒�씠釉� : board_comment 
create table board_comment(
	idx int not null auto_increment,
	mref int not null,      -- 硫붿씤湲�(遺�紐④�)�쓽 idx媛�
	name varchar(30) not null,			-- �옉�꽦�옄
	password varchar(10) not null,		-- 湲�鍮꾨�踰덊샇(�븘�슂�븷�븣留� �궗�슜)
	content varchar(2000) not null,		-- �궡�슜
	wdate timestamp default current_timestamp, 	-- �꽌踰꾩쓽 �쁽�옱�궇吏�/�떆媛�
	ip varchar(15) default '127.0.0.1',			-- �옉�꽦�옄 ip
	primary key(idx),
	foreign key(mref) references freeboard(idx)
);

insert into board_comment(mref,name,password,content,ip)
values (154,'�떎�쁽','1234','�삤�뒛 �븯猷⑤룄 臾댁궗�엳','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
values (154,'�떎�쁽','1234','�삤�뒛 �븯猷⑤룄 臾댁궗�엳','192.168.11.11');
insert into board_comment(mref,name,password,content,ip)
values (154,'�떎�쁽','1234','�삤�뒛 �븯猷⑤룄 臾댁궗�엳','192.168.11.11');

insert into board_comment(mref,name,password,content,ip)
values (142,'�떎�쁽','1234','�삤�뒛 �븯猷⑤룄 臾댁궗�엳','192.168.11.11');

-- 1)
insert into board_comment(mref,name,password,content,ip)
values (142,'�떎�쁽','1234','�삤�뒛 �븯猷⑤룄 臾댁궗�엳','192.168.11.11');

select * from freeboard f order by idx desc limit 0,15;	
-- �뙎湲� 媛쒖닔 (湲�紐⑸줉�뿉�꽌 �븘�슂�빀�땲�떎.)
select count(*) from board_comment where mref=154;      -- 154踰덇��쓽 �뙎湲� 媛��닔
select count(*) from board_comment where mref=142;      -- 142踰덇��쓽 �뙎湲� 媛��닔
select count(*) from board_comment where mref=100;      -- 100踰덇��쓽 �뙎湲� 媛��닔

-- 2) �뙎湲� 由ъ뒪�듃 
select * from board_comment where mref = 154;
select * from board_comment where mref = 142;
select * from board_comment where mref = 100;

-- 3) 湲�紐⑸줉 �떎�뻾�븯�뒗 dao.getList() 蹂대떎 �븵�뿉�꽌 �뙎湲�媛��닔瑜� update  
update freeboard set commentCount=(
	select count(*) from board_comment where mref=154) where idx=154;
update freeboard set commentCount=(
	select count(*) from board_comment where mref=142) where idx=142;


-- �븳�럹�씠吏��쓽 紐⑤뱺 �뻾�쓣 update 
update freeboard set commentCount=0;  -- �뀒�뒪�듃 
-- update join荑쇰━
update freeboard f 
join (select mref,count(*) cnt from board_comment bc group by mref) c 
on f.idx = c.mref 
set f.commentCount = c.cnt;

-- 4) 湲��긽�꽭蹂닿린�뿉�꽌 �뙎湲� �엯�젰 �썑 ���옣�븷 �븣 
update freeboard set commentCount=commentCount+1 where idx=0;

create table board_comment(
   idx int not null auto_increment,
   mref int not null,      -- 메인글(부모글)의 idx값
   name varchar(30) not null,      -- 게시판에서 작성자
   password varchar(10) not null,   -- 비밀글 비밀번호
   content varchar(2000) not null,   -- 내용의 글자 수(mysql은 byte가 아닌 글자 수임.)
   wdate timestamp default current_timestamp,   -- 서버의 현재 날짜/시간
   ip varchar(15) default '127.0.0.1',         -- 작성자 ip
   primary key(idx),   -- default값은 insert에서 필요 x
   foreign key(mref) references freeboard(idx)
);

-- 로그인 sql
select * from customer where email ="paek@naver.com" and password ="11";
-- 틀린패스워드(결과 null)
select * from customer where email ="paek@naver.com" and password ="1111";
-- 맞는 패스워드(결과 not null)
select * from customer where email ="paesdk@naver.com" and password ="11";
-- id가 없는 사용자(결과 null)