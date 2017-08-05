
CREATE DATABASE OA;
USE OA;

-------------------------------------------------------------------------------------
--昌哥花了一下午的代码
--创建用户表
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
----------------------------------诡异的分割线---------------------------------------------------------------------

  -------------------------------------------------------------------------------------
--昌哥花了一下午的代码
--插入用户数据
INSERT INTO t_user (`username`,`password`,nickname,birthday,sex,mobile,address,rank,regtime,regip)
VALUES ('111111','系统管理员',to_date('1980/3/3','YYYY-MM-DD'),1,'13800138001','广东省深圳市',,'127.0.0.1');

INSERT INTO `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ( '111111','A经理','123','1','123','123','2',SYSDATE(),'123');


INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','A经理',STR_TO_DATE('1987/5/21','YYYY-MM-DD'),1,'13800138002','广东省深圳市',1,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','B经理',STR_TO_DATE('1985/9/30','YYYY-MM-DD'),1,'13800138003','广东省深圳市',1,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','A员工',STR_TO_DATE('1990/8/13','YYYY-MM-DD'),1,'13800138004','广东省深圳市',2,SYSDATE(),'127.0.0.1');
INSERT INTO  `oa`.`t_user`(`password`,`nickname`,`birthday`,`sex`,`mobile`,`address`,`rank`,`regtime`,`regip`) VALUES ('111111','B员工',STR_TO_DATE('1988/11/6','YYYY-MM-DD'),1,'13800138005','广东省深圳市',2,SYSDATE(),'127.0.0.1');

----------------------------------诡异的分割线---------------------------------------------------------------------

