/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.16-log : Database - qczl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qczl` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qczl`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `flag` varchar(50) DEFAULT NULL,
  `isuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `quanxian` varchar(1000) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`creattime`,`flag`,`isuse`,`logintimes`,`quanxian`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e','2017-03-10 11:40:25','1',1,121,'1');

/*Table structure for table `adminlog` */

DROP TABLE IF EXISTS `adminlog`;

CREATE TABLE `adminlog` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `loginip` longtext,
  `useros` varchar(50) DEFAULT NULL,
  `ok` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=gb2312;

/*Data for the table `adminlog` */

insert  into `adminlog`(`id`,`username`,`password`,`logintime`,`loginip`,`useros`,`ok`) values (129,'admin','024admin','2017-03-10 20:50:53','Mozilla/5.0 (Windows NT 6.1','0:0:0:0:0:0:0:1','false'),(130,'admin','024admin','2017-03-10 20:51:24','Mozilla/5.0 (Windows NT 6.1','0:0:0:0:0:0:0:1','false'),(131,'admin','024admin','2017-03-10 20:51:33','Mozilla/5.0 (Windows NT 6.1','0:0:0:0:0:0:0:1','false'),(132,'admin','e10adc3949ba59abbe56e057f20f883e','2017-03-10 20:51:41','Mozilla/5.0 (Windows NT 6.1','0:0:0:0:0:0:0:1','true'),(133,'admin','024adamin','2017-03-10 20:52:01','Mozilla/4.0 (compatible','0:0:0:0:0:0:0:1','false'),(134,'admin','e10adc3949ba59abbe56e057f20f883e','2017-03-10 20:52:09','Mozilla/4.0 (compatible','0:0:0:0:0:0:0:1','true'),(135,'admin','e10adc3949ba59abbe56e057f20f883e','2017-03-10 21:07:54','Mozilla/4.0 (compatible','0:0:0:0:0:0:0:1','true'),(136,'admin','e10adc3949ba59abbe56e057f20f883e','2017-04-12 19:49:00','Mozilla/5.0 (Windows NT 10.0','0:0:0:0:0:0:0:1','true'),(137,'admin','e10adc3949ba59abbe56e057f20f883e','2017-04-15 14:35:48','Mozilla/5.0 (compatible','0:0:0:0:0:0:0:1','true'),(138,'admin','e10adc3949ba59abbe56e057f20f883e','2017-04-15 15:11:39','Mozilla/5.0 (compatible','0:0:0:0:0:0:0:1','true');

/*Table structure for table `affiche` */

DROP TABLE IF EXISTS `affiche`;

CREATE TABLE `affiche` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` longtext,
  `addtime` datetime DEFAULT NULL,
  `adder` varchar(50) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `affiche` */

insert  into `affiche`(`id`,`title`,`content`,`addtime`,`adder`,`ifhide`) values (1,'欢迎光临','欢迎光临卓信汽车租赁网！','2017-03-10 11:40:25','admin',1),(2,'2017年生产车辆租赁二次招标','注册的独立法人，具有汽车租赁资质证书并提供企业营业执照、税务登记证、组织机构代码证、银行开户许可证、汽车租赁资质证书。投标人需提供拟租赁所有车辆的行驶证、机动车登记证、购置税缴纳证、已付保险凭证、环保标志、本年度保险单、以及保险公司出具的无安全事故证明文件；若承诺提供新车，须提供银行开具的资金证明（证明投标人公司资金实力足够购买新车），并提交投标履约保证金**万元(开标前三天交至招标人中国石油天然气股份有限公司西南管道兰州输油气分公司帐户）。*、投标人','2017-03-10 11:40:25','admin',1),(3,'汽车租赁服务招标公告','投标人应当具有汽车租赁的经营范围；*、投标人应当在台山市市区内设有相应的经营场所；*、本项目不接受联合体投标。三、招标文件的公示：*、招标文件公示期：****年**月**日至****年**月**日五个工作日（请点击下载或预览）。四、获取招标文件的时间、地点、方式及招标文件售价：*、获取招标文件时间：****年**月**日至****年**月**日**：**时。*、获取招标文件方式：通过江门政府采购网','2017-03-10 11:40:25','admin',1),(4,'汽车租赁服务招标公告','公司电力科学研究院的汽车租赁服务项目已经批准实施，项目位于杭州市下城区朝晖八区华电弄*号。*、项目编号：CZTC*****；*、招标内容：国网浙江省电力公司电力科学研究院车辆汽车租赁服务项目，承包期一年。合同期满后，经招标人综合考核合格后，招标人与投标人续约一年。*、投标人资格条件要求：（*）具有道路运输经营许可证的独立法人企业。（*）自****年以来，具有高压设备运输服务的业绩。*、资格审查方式：资格后审；*、招标文件发售时间：****年**月**日至*.','2017-03-10 11:40:25','admin',1);

/*Table structure for table `friendlink` */

DROP TABLE IF EXISTS `friendlink`;

CREATE TABLE `friendlink` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(50) DEFAULT NULL,
  `linkurl` varchar(50) DEFAULT NULL,
  `linkpic` varchar(200) DEFAULT NULL,
  `intero` varchar(300) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  `ordervalue` int(4) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `friendlink` */

/*Table structure for table `guestbook` */

DROP TABLE IF EXISTS `guestbook`;

CREATE TABLE `guestbook` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `weburl` varchar(50) DEFAULT NULL,
  `blogurl` varchar(50) DEFAULT NULL,
  `expressions` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `replay` int(4) DEFAULT NULL,
  `ifhide` int(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `guestbook` */

insert  into `guestbook`(`id`,`nickname`,`pic`,`email`,`qq`,`weburl`,`blogurl`,`expressions`,`content`,`addtime`,`ip`,`replay`,`ifhide`) values (2,'游客','images/nobody.gif','','','','','images/face/1.gif','测试','2017-03-10 11:40:25','127.0.0.1',1,1),(3,'test','images/nobody.gif','12345678@qq.com','412301807','','','images/face/1.gif','test','2017-03-10 11:40:25','127.0.0.1',0,1),(4,'游客','images/nobody.gif','','','','','images/face/1.gif','车子很好，价格也挺公道的。。赞一个！','2017-04-15 15:16:59','0:0:0:0:0:0:0:1',0,1);

/*Table structure for table `guestvisit` */

DROP TABLE IF EXISTS `guestvisit`;

CREATE TABLE `guestvisit` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `vtime` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `guestvisit` */

/*Table structure for table `hydj` */

DROP TABLE IF EXISTS `hydj`;

CREATE TABLE `hydj` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `edxx` double(50,0) DEFAULT NULL,
  `edsx` double(50,0) DEFAULT NULL,
  `yhed` double(50,2) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=gb2312;

/*Data for the table `hydj` */

insert  into `hydj`(`id`,`title`,`edxx`,`edsx`,`yhed`,`addtime`) values (27,'普通会员',0,1000,0.90,'2017-03-10 11:40:25'),(29,'高级会员',1000,3000,0.85,'2017-03-10 11:40:25'),(30,'白金会员',3000,5000,0.80,'2017-03-10 11:40:25'),(31,'钻石会员',5000,10000,0.70,'2017-03-10 11:40:25');

/*Table structure for table `js` */

DROP TABLE IF EXISTS `js`;

CREATE TABLE `js` (
  `js` text
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `js` */

insert  into `js`(`js`) values ('<p align=\"left\"><span class=\"Title\"><font size=\"4\">汽车厂商：</font></span></p>\r\n<div class=\"articleins articleins2\" align=\"left\"><br />\r\n<img alt=\"213212\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto03.gif\" /><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto01.gif\" /><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto02.gif\" /><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>\r\n<p class=\"articleins articleins2\" align=\"left\"><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto05.gif\" /><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto06.gif\" /><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p class=\"articleins articleins2\" align=\"left\"><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto07.gif\" /><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto09.gif\" /><img alt=\"\" width=\"172\" height=\"40\" src=\"/qczl/UserFiles/Image/auto08.gif\" /><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<div align=\"left\"><span class=\"Title\"><font size=\"4\">保险公司：</font></span></div>\r\n<p align=\"left\"><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt=\"\" width=\"138\" height=\"31\" src=\"/qczl/UserFiles/Image/bx01.gif\" /><img alt=\"\" width=\"138\" height=\"31\" src=\"/qczl/UserFiles/Image/bx02.gif\" /><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `regtime` varchar(50) DEFAULT NULL,
  `ifuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `lasttime` datetime DEFAULT NULL,
  `lastip` varchar(50) DEFAULT NULL,
  `jf` double(20,2) DEFAULT '0.00',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

/*Data for the table `member` */

insert  into `member`(`id`,`username`,`password`,`type`,`regtime`,`ifuse`,`logintimes`,`lasttime`,`lastip`,`jf`) values (4,'zhangsan','e10adc3949ba59abbe56e057f20f883e','person','2017-03-10 11:40:25',1,32,'2017-04-15 14:35:18','0:0:0:0:0:0:0:1',5001.00),(5,'111111','96e79218965eb72c92a549dd5a330112','person','2017-03-10 11:40:25',1,1,'2017-03-10 11:40:25','0:0:0:0:0:0:0:1',360.00),(6,'test','e10adc3949ba59abbe56e057f20f883e','person','2017-03-10 11:40:25',1,3,'2017-03-10 11:40:25','127.0.0.1',0.00),(7,'lisi','e10adc3949ba59abbe56e057f20f883e','person','2017-03-10 21:06:00',1,3,'2017-03-10 21:11:47','0:0:0:0:0:0:0:1',720.00);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `content` text,
  `sj` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gb2312;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`sj`) values (27,'汽车租赁业务外包二次招标','<p><span style=\"text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; letter-spacing: normal; font: 12px/16px Simsun; white-space: normal; color: rgb(255,102,0); word-spacing: 0px; -webkit-text-stroke-width: 0px\" class=\"acontent\"><strong>汽车租赁</strong></span><span style=\"text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; letter-spacing: normal; display: inline !important; font: 12px/16px Simsun; white-space: normal; float: none; color: rgb(139,139,139); word-spacing: 0px; -webkit-text-stroke-width: 0px\">业务外包二次招标公告*.招标条件本招标项目业主为朔黄铁路机辆分公司，建设资金来自企业自筹，招标人为朔黄铁路机辆分公司，招标代理机构为中国神华国际工程有限公司，项目已具备招标条件，现对该项目公开招标。项目招标编号为：CSIE********。*.项目概况与招标范围*.*本项目共划分*个标段，详见下表（具体见技术部分及资料）：项目概况及招标范围服务周期服务地点*、肃宁北电力运管中心接送乘务员，*-*座面包车三台，司机**名。*、黄骅港折返段接送调车机乘</span></p>','2017-03-10 11:40:25'),(28,'局2016年车辆租赁二次招标','<p><span style=\"text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; letter-spacing: normal; display: inline !important; font: 12px/16px Simsun; white-space: normal; float: none; color: rgb(139,139,139); word-spacing: 0px; -webkit-text-stroke-width: 0px\">业执照经营范围应包含</span><span style=\"text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; letter-spacing: normal; font: 12px/16px Simsun; white-space: normal; color: rgb(255,102,0); word-spacing: 0px; -webkit-text-stroke-width: 0px\" class=\"acontent\"><strong>汽车租赁</strong></span><span style=\"text-transform: none; background-color: rgb(255,255,255); text-indent: 0px; letter-spacing: normal; display: inline !important; font: 12px/16px Simsun; white-space: normal; float: none; color: rgb(139,139,139); word-spacing: 0px; -webkit-text-stroke-width: 0px\">内容；（*）具有良好的银行资信和商业信誉，没有处于被责令停业或破产状态，且资产未被重组、接管和冻结；（*）本项目不接受联合体投标。*、投标报名及招标文件的获取*.*凡有意参加投标者，请于****年**月**日至****年**月**日（法定公休日、法定节假日除外）每日上午**:**至**:**，下午**:**至**:**（北京时间，下同），在云南省昆明市人民西路***号云南招标股份有限公司办公楼*楼***室（详细地址）投标报名及购</span></p>','2017-03-10 11:40:25');

/*Table structure for table `pmember` */

DROP TABLE IF EXISTS `pmember`;

CREATE TABLE `pmember` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mid` int(4) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `bir` varchar(50) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

/*Data for the table `pmember` */

insert  into `pmember`(`id`,`mid`,`realname`,`sex`,`bir`,`sheng`,`city`,`telphone`,`email`,`question`,`answer`,`address`) values (4,4,'张三','m','32','北京','北京','1111111','11@126.com','11','1111','北京东外环1-401'),(5,5,'11111','f','11111','天津','天津','11111111','11@126.com','11111','1111','1111'),(6,6,'王五','m','23','广东','广州','12345678901','123456789@qq.com','你叫什么名字？','小黄','广东广州'),(7,7,'李四','m','23','陕西','西安','11111111','11@126.com','22','111','啦啦');

/*Table structure for table `qc` */

DROP TABLE IF EXISTS `qc`;

CREATE TABLE `qc` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cm` varchar(50) DEFAULT NULL,
  `fl` varchar(50) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `cp` varchar(50) DEFAULT NULL,
  `zj` double DEFAULT NULL,
  `csjg` double DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `dj` int(255) DEFAULT '0',
  `qcxq` longtext,
  `zccs` int(4) DEFAULT '0' COMMENT '租车次数',
  `qclx` varchar(100) DEFAULT NULL COMMENT '汽车类型，1：经济型，2：豪华型，3：商务型，4：SUV',
  `qcdw` varchar(50) DEFAULT NULL COMMENT '汽车档位：手动，自动',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=gb2312;

/*Data for the table `qc` */

insert  into `qc`(`id`,`cm`,`fl`,`pic`,`cp`,`zj`,`csjg`,`bz`,`dj`,`qcxq`,`zccs`,`qclx`,`qcdw`) values (33,'别克商务GL8','奥迪','/upload_file/sale/1449635158194303.jpg','18456799087',200,50,'北京汽车租赁7座别克商务GL8旅游商务婚庆机场接送包车带司机服务',5,'<p><input src=\"/qczl/UserFiles/Image/302.jpg\" width=\"500\" height=\"375\" type=\"image\" /><input src=\"/qczl/UserFiles/Image/301.jpg\" width=\"500\" height=\"375\" type=\"image\" /></p>',10,'SUV','自动'),(35,'奔驰600','奥迪','/upload_file/sale/14496348912146003.jpg','18316022541',180,20,'大众奔驰轿车',43,'<p><input src=\"/qczl/UserFiles/Image/6002.jpg\" width=\"500\" height=\"313\" type=\"image\" longdesc=\"undefined\" /><input src=\"/qczl/UserFiles/Image/6001.jpg\" width=\"500\" height=\"375\" type=\"image\" /></p>',8,'舒适型','自动'),(37,'高尔夫','奥迪','/upload_file/sale/14496348253752.jpg','1112222',200,24,'大众越野',42,'<p><input src=\"/qczl/UserFiles/Image/231.jpg\" width=\"500\" height=\"344\" type=\"image\" /><input src=\"/qczl/UserFiles/Image/221.jpg\" width=\"500\" height=\"306\" type=\"image\" /></p>',16,'经济型','手动'),(38,'7系列','宝马','/upload_file/sale/1449635495263400.jpg','14567854325',400,40,'宝马高档轿车',13,'<p><input src=\"/qczl/UserFiles/Image/401.jpg\" width=\"500\" height=\"332\" type=\"image\" /><input src=\"/qczl/UserFiles/Image/402.jpg\" width=\"500\" height=\"333\" type=\"image\" /></p>',22,'豪华型','自动'),(39,'本田C500','本田','/upload_file/sale/14496348912146003.jpg','18346895412',300,60,'本田2016最新款',32,'<p><input src=\"/qczl/UserFiles/Image/401.jpg\" width=\"500\" height=\"332\" type=\"image\" /><input src=\"/qczl/UserFiles/Image/402.jpg\" width=\"500\" height=\"333\" type=\"image\" /></p>',5,'经济型','手动');

/*Table structure for table `replay` */

DROP TABLE IF EXISTS `replay`;

CREATE TABLE `replay` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mid` int(4) DEFAULT NULL,
  `replay` varchar(200) DEFAULT NULL,
  `replayer` varchar(50) DEFAULT NULL,
  `replaytime` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

/*Data for the table `replay` */

insert  into `replay`(`id`,`mid`,`replay`,`replayer`,`replaytime`) values (1,2,'你好','admin','2017-03-10 21:10:32');

/*Table structure for table `system` */

DROP TABLE IF EXISTS `system`;

CREATE TABLE `system` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `reasons` varchar(100) DEFAULT NULL,
  `dir` varchar(100) DEFAULT NULL,
  `record` varchar(100) DEFAULT NULL,
  `copyright` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

/*Data for the table `system` */

insert  into `system`(`id`,`sitename`,`url`,`keyword`,`description`,`email`,`state`,`reasons`,`dir`,`record`,`copyright`) values (1,'汽车租赁网','汽车租赁网','汽车租赁网','汽车租赁网','汽车租赁网','open','汽车租赁网','admin','汽车租赁网','汽车租赁网');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `addtime` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gb2312;

/*Data for the table `type` */

insert  into `type`(`id`,`title`,`addtime`) values (22,'别克','2017-02-21 11:40:25'),(23,'奔驰','2017-02-21 11:40:25'),(24,'大众','2017-02-21 11:40:25'),(25,'奥迪','2017-02-21 11:40:25'),(26,'宝马','2017-02-21 11:40:25');

/*Table structure for table `zc` */

DROP TABLE IF EXISTS `zc`;

CREATE TABLE `zc` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `qcid` varchar(50) DEFAULT NULL,
  `qcsj` varchar(50) DEFAULT NULL,
  `qcdd` varchar(50) DEFAULT NULL,
  `hcsj` varchar(50) DEFAULT NULL,
  `hcdd` varchar(50) DEFAULT NULL,
  `member` varchar(50) DEFAULT NULL,
  `zt` varchar(50) DEFAULT NULL,
  `xz` varchar(50) DEFAULT '未',
  `xzzt` varchar(50) DEFAULT NULL,
  `sfhc` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gb2312;

/*Data for the table `zc` */

insert  into `zc`(`id`,`qcid`,`qcsj`,`qcdd`,`hcsj`,`hcdd`,`member`,`zt`,`xz`,`xzzt`,`sfhc`) values (10,'33','2017-02-21','北京市东外环','2017-02-26','北京市东外环','zhangsan','已审核','未','未审核','是'),(12,'35','2017-02-21','北京','2017-02-26','北京','zhangsan','已审核','未','未审核','是'),(14,'37','2017-02-21','四川','2017-02-26','四川','zhangsan','已审核','已','已审核','是'),(17,'35','2017-02-21','1','2017-02-26','1','zhangsan','已审核','未','已审核','是'),(21,'37','2017-02-21','11','2017-02-26','11','111111','已审核','未','已审核','是'),(22,'37','2017-03-10','唐马路','2017-03-14','唐马路','lisi','已审核','已','已审核','否');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
