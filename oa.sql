
CREATE DATABASE OA;
USE OA;

CREATE TABLE t_user (
  username VARCHAR(10),
  `password` VARCHAR(30) NOT NULL,
  nickname VARCHAR(30), 
  birthday DATE, 
  sex INT DEFAULT 1, 
  mobile VARCHAR(30), 
  address VARCHAR(100), 
  rank INT DEFAULT 2, 
  regtime DATE, 
  regip VARCHAR(20),
  PRIMARY KEY(`username`)
);

INSERT INTO t_user (`username`,`password`,nickname,birthday,sex,mobile,address,rank,regtime,regip)
VALUES ('111111','系统管理员',to_date('1980/3/3','YYYY-MM-DD'),1,'13800138001','广东省深圳市',,'127.0.0.1');

INSERT INTO `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ( '111111','A经理','123','1','123','123','2',SYSDATE(),'123');

INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','A经理',STR_TO_DATE('1987/5/21','YYYY-MM-DD'),1,'13800138002','广东省深圳市',1,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','B经理',STR_TO_DATE('1985/9/30','YYYY-MM-DD'),1,'13800138003','广东省深圳市',1,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','A员工',STR_TO_DATE('1990/8/13','YYYY-MM-DD'),1,'13800138004','广东省深圳市',2,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','B员工',STR_TO_DATE('1988/11/6','YYYY-MM-DD'),1,'13800138005','广东省深圳市',2,SYSDATE(),'127.0.0.1');

-- 创建邮件表
CREATE TABLE `t_email` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `recipients` VARCHAR(30) NOT NULL,
  `sender` VARCHAR(30) NOT NULL,
  `title` VARCHAR(100) DEFAULT NULL,
  `content` VARCHAR(200) DEFAULT NULL,
  `enclosure` VARCHAR(100) DEFAULT NULL,
  `sendtime` DATE DEFAULT '0000-00-00',
  `isread` INT(11) DEFAULT '0',
  `readtime` DATE DEFAULT NULL,
  `isdelete` INT(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8
ALTER TABLE `oa`.`t_email`     CHANGE `userId` `username` INT(4) NOT NULL;


-- 创建考勤表
CREATE TABLE IF NOT EXISTS t_attend(
  `id`  INT(4)  NOT NULL,
  applicant VARCHAR(30),
  starttime DATE, 
  endtime DATE, 
  days INT, 
  reasons varchar(1000), 
  nickname VARCHAR(30),  
  posttime DATE,
  postip VARCHAR(30),  
  auditor VARCHAR(30),  
  `status` INT DEFAULT 0, 
  audittime DATE,
  PRIMARY KEY(`id`)
);


-- 插入邮件数据
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('1','100000','100000','邮件标题测试1','广东省深圳市','F:/java/upload/20160422/20160422191720446.zip','2017-08-09','1','2017-08-09','1','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('2','100001','100002','邮件标题测试2','广东省深圳市','','2017-08-09','0','0000-00-00','0','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('3','100002','100001','邮件标题测试3','广东省深圳市','F:/java/upload/20160422/20160422191720446.zip','2017-08-09','0','0000-00-00','0','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('4','100000','100001','邮件标题测试4','','','2017-08-09','0','0000-00-00','0','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('5','100000','100001','邮件标题测试5','','F:/java/upload/20160422/20160422191720446.zip','2017-08-09','0','0000-00-00','1','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('6','100002','100001','邮件标题测试6','广东省深圳市','','2017-08-09','0','0000-00-00','1','0');
insert into `t_email` (`id`, `recipients`, `sender`, `title`, `content`, `enclosure`, `sendtime`, `isread`, `readtime`, `isdelete`, `username`) values('7','100002','100001','邮件标题测试6','广东省深圳市','','2017-08-09','0','0000-00-00','1','0');



-- 以下是oracle的,做参考
--创建考勤表序列
CREATE SEQUENCE sq_t_attend INCREMENT BY 1 START WITH 0 MINVALUE 0;

--插入用户数据
INSERT INTO t_user VALUES (sq_t_user.nextval,'111111','系统管理员',to_date('1980/3/3','YYYY-MM-DD'),1,'13800138001','广东省深圳市',0,SYSDATE,'127.0.0.1');
INSERT INTO t_user VALUES (sq_t_user.nextval,'111111','A经理',to_date('1987/5/21','YYYY-MM-DD'),1,'13800138002','广东省深圳市',1,SYSDATE,'127.0.0.1');
INSERT INTO t_user VALUES (sq_t_user.nextval,'111111','B经理',to_date('1985/9/30','YYYY-MM-DD'),1,'13800138003','广东省深圳市',1,SYSDATE,'127.0.0.1');
INSERT INTO t_user VALUES (sq_t_user.nextval,'111111','A员工',to_date('1990/8/13','YYYY-MM-DD'),1,'13800138004','广东省深圳市',2,SYSDATE,'127.0.0.1');
INSERT INTO t_user VALUES (sq_t_user.nextval,'111111','B员工',to_date('1988/11/6','YYYY-MM-DD'),1,'13800138005','广东省深圳市',2,SYSDATE,'127.0.0.1');

--插入邮件数据
INSERT INTO t_email VALUES (sq_t_email.nextval,'100000','100000','邮件标题测试1','广东省深圳市','F:/java/upload/20160422/20160422191720446.zip',SYSDATE,'127.0.0.1',1,SYSDATE,1);
INSERT INTO t_email VALUES (sq_t_email.nextval,'100001','100002','邮件标题测试2','广东省深圳市','',SYSDATE,'127.0.0.1',0,'',0);
INSERT INTO t_email VALUES (sq_t_email.nextval,'100002','100001','邮件标题测试3','广东省深圳市','F:/java/upload/20160422/20160422191720446.zip',SYSDATE,'127.0.0.1',0,'',0);
INSERT INTO t_email VALUES (sq_t_email.nextval,'100000','100001','邮件标题测试4','','',SYSDATE,'127.0.0.1',0,'',0);
INSERT INTO t_email VALUES (sq_t_email.nextval,'100000','100001','邮件标题测试5','','F:/java/upload/20160422/20160422191720446.zip',SYSDATE,'127.0.0.1',0,'',1);
INSERT INTO t_email VALUES (sq_t_email.nextval,'100002','100001','邮件标题测试6','广东省深圳市','',SYSDATE,'127.0.0.1',0,'',1);

--插入考勤数据
INSERT INTO t_attend VALUES (sq_t_attend.nextval,'100001',to_date('2016/4/5','YYYY-MM-DD'),to_date('2016/4/6','YYYY-MM-DD'),1,'感冒','A经理',SYSDATE,'127.0.0.1','100002',0,'');
INSERT INTO t_attend VALUES (sq_t_attend.nextval,'100001',to_date('2016/4/8','YYYY-MM-DD'),to_date('2016/4/10','YYYY-MM-DD'),2,'搬家','A经理',SYSDATE,'127.0.0.1','100002',1,SYSDATE);
INSERT INTO t_attend VALUES (sq_t_attend.nextval,'100001',to_date('2016/4/20','YYYY-MM-DD'),to_date('2016/4/26','YYYY-MM-DD'),5,'找女朋友','A经理',SYSDATE,'127.0.0.1','100002',2,SYSDATE);
INSERT INTO t_attend VALUES (sq_t_attend.nextval,'100004',to_date('2016/4/5','YYYY-MM-DD'),to_date('2016/4/6','YYYY-MM-DD'),1,'感冒','B员工',SYSDATE,'127.0.0.1','100001',0,'');
INSERT INTO t_attend VALUES (sq_t_attend.nextval,'100003',to_date('2016/4/5','YYYY-MM-DD'),to_date('2016/4/6','YYYY-MM-DD'),1,'感冒','A员工',SYSDATE,'127.0.0.1','100002',0,'');















