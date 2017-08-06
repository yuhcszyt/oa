
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
CREATE TABLE  IF NOT EXISTS  t_email (
 -- ID int(4),
 -- recipients VARCHAR(30) NOT NULL,
  `id` INT(4) NOT NULL, 
  `recipients` VARCHAR(30) NOT NULL, 
  sender VARCHAR(30) NOT NULL, 
  title VARCHAR(100), 
  content LONG, 
  enclosure VARCHAR(100), 
  sendtime DATE DEFAULT 0, 
  sendip VARCHAR(20),  
  isread INT DEFAULT 0, 
  readtime DATE, 
  isdelete INT DEFAULT 0,
  PRIMARY KEY(`id`)
);



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




















