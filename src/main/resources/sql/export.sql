/*
SQLyog v10.2 
MySQL - 5.5.43 : Database - luculent
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ luculent  /*!40100 DEFAULT CHARACTER SET utf8 */;

-- USE  luculent ;

/*Table structure for table  appheathyinfo  */

DROP TABLE IF EXISTS  appheathyinfo ;

CREATE TABLE  appheathyinfo  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   ahttp  float DEFAULT '100',
   amemory  float DEFAULT '100',
   asession  float DEFAULT '100',
   ajdbc  float DEFAULT '100',
   asql  float DEFAULT '100',
   adisk  float DEFAULT '100',
  UNIQUE KEY  appheathyinfo_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table  appheathyinfo  */

insert  into  appheathyinfo ( id , appid , queryTime , ahttp , amemory , asession , ajdbc , asql , adisk ) values (10,10,'2017-05-16 11:17:39',68.1751,2.26952,-0.694468,0.876142,91.811,73.9205);

/*Table structure for table  appinfo  */

DROP TABLE IF EXISTS  appinfo ;

CREATE TABLE  appinfo  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   delete_status  char(1) DEFAULT '0',
   appurl  varchar(255) DEFAULT '',
   appip  varchar(16) DEFAULT 'localhost',
   appport  varchar(8) DEFAULT '8080',
   appname  varchar(64) DEFAULT '',
   appdesc  varchar(1024) DEFAULT '',
   city  varchar(1024) DEFAULT '',
   lan  float DEFAULT '0',
   lat  float DEFAULT '0',
  UNIQUE KEY  appinfo_id  ( id ),
  UNIQUE KEY  appurl  ( appurl )
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table  appinfo  */

insert  into `appinfo`(`id`,`delete_status`,`appurl`,`appip`,`appport`,`appname`,`appdesc`,`city`,`lan`,`lat`) values (1,'0','192.168.10.10:8080','192.168.10.10','8080','sh-project','上海项目','上海',34.5,121.433),(2,'0','192.168.10.11:8080','192.168.10.11','8080','bj-project','北京项目','北京',39.9167,116.417),(3,'0','192.168.10.12:8080','192.168.10.12','8080','nj-project','南京项目','南京',32.05,118.783),(4,'0','192.168.10.13:8080','192.168.10.13','8080','sz-project','深圳项目','深圳',22.6167,114.067),(5,'0','192.168.10.14:8080','192.168.10.14','8080','gz-project','广州项目','广州',23.1667,113.233),(6,'0','192.168.10.15:8080','192.168.10.15','8080','hz-project','杭州项目','杭州',30.2667,120.2),(7,'0','192.168.10.16:8080','192.168.10.16','8080','tj-project','天津项目','天津',39.1333,117.2),(8,'0','192.168.10.17:8080','192.168.10.17','8080','cd-project','成都项目','成都',30.6667,104.067),(9,'0','192.168.10.18:8080','192.168.10.18','8080','xa-project','西安项目','西安',34.2667,108.95),(10,'0','192.168.10.19:8080','192.168.10.19','8080','wh-project','武汉项目','武汉',30.5167,114.317);


/*Table structure for table  statistics_day_action  */

DROP TABLE IF EXISTS  statistics_day_action ;

CREATE TABLE  statistics_day_action  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   pgmNo  varchar(255) DEFAULT '',
   pgmId  varchar(255) DEFAULT '',
   pgmNam  varchar(255) DEFAULT '',
   modTyp  varchar(255) DEFAULT '',
   pathDsc  varchar(255) DEFAULT '',
   accessCount  float DEFAULT '0',
  UNIQUE KEY  statistics_day_action_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_action  */

insert  into  statistics_day_action ( id , appid , queryTime , pgmNo , pgmId , pgmNam , modTyp , pathDsc , accessCount ) values (1000,7,'2016-03-14 00:00:00','172','B1PGB00010','我的查询','pG','cm/cmog',943.637);

/*Table structure for table  statistics_day_http  */

DROP TABLE IF EXISTS  statistics_day_http ;

CREATE TABLE  statistics_day_http  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  int(11) DEFAULT '0',
   durationsSum  int(11) DEFAULT '0',
   durationsSquareSum  int(11) DEFAULT '0',
   maximum  int(11) DEFAULT '0',
   cpuTimeSum  int(11) DEFAULT '0',
   systemErrors  int(11) DEFAULT '0',
   responseSizesSum  int(11) DEFAULT '0',
   childHits  int(11) DEFAULT '0',
   childDurationsSum  int(11) DEFAULT '0',
  UNIQUE KEY  statistics_day_http_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_http  */

insert  into  statistics_day_http ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (1000,4,'2016-05-12 00:00:00','app','/statistics/update POST ',234,10026,10660,21369712,2114751,58,41918,15499,454);

/*Table structure for table  statistics_day_jdbc  */

DROP TABLE IF EXISTS  statistics_day_jdbc ;

CREATE TABLE  statistics_day_jdbc  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedConnectionCount  float DEFAULT '0',
   maxConnectionCount  float DEFAULT '0',
   activeConnectionCount  float DEFAULT '0',
  UNIQUE KEY  statistics_day_jdbc_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_jdbc  */

insert  into  statistics_day_jdbc ( id , appid , queryTime , usedConnectionCount , maxConnectionCount , activeConnectionCount ) values (999,2,'2013-02-01 00:00:00',42.4237,5.9051,14.9316),(1000,4,'2012-11-19 00:00:00',74.624,16.0658,4.01249);

/*Table structure for table  statistics_day_memory  */

DROP TABLE IF EXISTS  statistics_day_memory ;

CREATE TABLE  statistics_day_memory  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedMemory  float DEFAULT '0',
   maxMemory  float DEFAULT '0',
   usedPermGen  float DEFAULT '0',
   maxPermGen  float DEFAULT '0',
   usedNonHeapMemory  float DEFAULT '0',
   usedBufferedMemory  float DEFAULT '0',
   loadedClassesCount  float DEFAULT '0',
   garbageCollectionTimeMillis  float DEFAULT '0',
   usedPhysicalMemorySize  float DEFAULT '0',
   usedSwapSpaceSize  float DEFAULT '0',
   committedVirtualMemory  float DEFAULT '0',
   freePhysicalMemory  float DEFAULT '0',
   totalPhysicalMemory  float DEFAULT '0',
   freeSwapSpace  float DEFAULT '0',
   totalSwapSpace  float DEFAULT '0',
  UNIQUE KEY  statistics_day_memory_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_memory  */

insert  into  statistics_day_memory ( id , appid , queryTime , usedMemory , maxMemory , usedPermGen , maxPermGen , usedNonHeapMemory , usedBufferedMemory , loadedClassesCount , garbageCollectionTimeMillis , usedPhysicalMemorySize , usedSwapSpaceSize , committedVirtualMemory , freePhysicalMemory , totalPhysicalMemory , freeSwapSpace , totalSwapSpace ) values (1000,7,'2014-11-15 00:00:00',1217340000,1883240000,-1,-1,47468.1,22847400,8095.04,377.379,-59706900,-396567000,600836000,2083570,8271010,7066570,6870700);

/*Table structure for table  statistics_day_session  */

DROP TABLE IF EXISTS  statistics_day_session ;

CREATE TABLE  statistics_day_session  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   userCount  float DEFAULT '0',
  UNIQUE KEY  statistics_day_session_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_session  */

insert  into  statistics_day_session ( id , appid , queryTime , userCount ) values (999,5,'2009-01-30 00:00:00',635.932),(1000,8,'2011-06-21 00:00:00',723.535);

/*Table structure for table  statistics_day_sql  */

DROP TABLE IF EXISTS  statistics_day_sql ;

CREATE TABLE  statistics_day_sql  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  float DEFAULT '0',
   durationsSum  float DEFAULT '0',
   durationsSquareSum  float DEFAULT '0',
   maximum  float DEFAULT '0',
   cpuTimeSum  float DEFAULT '0',
   systemErrors  float DEFAULT '0',
   responseSizesSum  float DEFAULT '0',
   childHits  float DEFAULT '0',
   childDurationsSum  float DEFAULT '0',
  UNIQUE KEY  statistics_day_sql_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_day_sql  */

insert  into  statistics_day_sql ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (1000,5,'2009-09-10 00:00:00',' insert into tb_product(shop_id,ptype,pname,picon,pprice,ptime,pdescription,status_delete) values(?,?,?,?,?,?,?,?)',' insert into tb_product(shop_id,ptype,pname,picon,pprice,ptime,pdescription,status_delete) values(?,?,?,?,?,?,?,?)',307.844,17422.3,15483.7,56542100,27206700,57.8598,39201.1,15581.2,441.517);

/*Table structure for table  statistics_hour_action  */

DROP TABLE IF EXISTS  statistics_hour_action ;

CREATE TABLE  statistics_hour_action  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   pgmNo  varchar(255) DEFAULT '',
   pgmId  varchar(255) DEFAULT '',
   pgmNam  varchar(255) DEFAULT '',
   modTyp  varchar(255) DEFAULT '',
   pathDsc  varchar(255) DEFAULT '',
   accessCount  float DEFAULT '0',
  UNIQUE KEY  statistics_hour_action_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_action  */

insert  into  statistics_hour_action ( id , appid , queryTime , pgmNo , pgmId , pgmNam , modTyp , pathDsc , accessCount ) values (999,1,'2016-02-08 55:00:00','90','B1OGG00101','责任中心（树型）','OG','cm/cmog',98.1756),(1000,5,'2013-11-31 24:00:00','91','B1OGG00102','生产单位版本','OG','cm/cmog',438.422);

/*Table structure for table  statistics_hour_http  */

DROP TABLE IF EXISTS  statistics_hour_http ;

CREATE TABLE  statistics_hour_http  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  int(11) DEFAULT '0',
   durationsSum  int(11) DEFAULT '0',
   durationsSquareSum  int(11) DEFAULT '0',
   maximum  int(11) DEFAULT '0',
   cpuTimeSum  int(11) DEFAULT '0',
   systemErrors  int(11) DEFAULT '0',
   responseSizesSum  int(11) DEFAULT '0',
   childHits  int(11) DEFAULT '0',
   childDurationsSum  int(11) DEFAULT '0',
  UNIQUE KEY  statistics_hour_http_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_http  */

insert  into  statistics_hour_http ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (1000,5,'2015-08-26 54:00:00','app','/setting/selectByPage',485,727,2152,46665320,10633864,87,63415,16961,904);

/*Table structure for table  statistics_hour_jdbc  */

DROP TABLE IF EXISTS  statistics_hour_jdbc ;

CREATE TABLE  statistics_hour_jdbc  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedConnectionCount  float DEFAULT '0',
   maxConnectionCount  float DEFAULT '0',
   activeConnectionCount  float DEFAULT '0',
  UNIQUE KEY  statistics_hour_jdbc_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_jdbc  */

insert  into  statistics_hour_jdbc ( id , appid , queryTime , usedConnectionCount , maxConnectionCount , activeConnectionCount ) values (999,9,'2015-10-26 49:00:00',9.302,50.8272,12.5137),(1000,3,'2015-01-08 36:00:00',9.7924,89.2745,44.4309);

/*Table structure for table  statistics_hour_memory  */

DROP TABLE IF EXISTS  statistics_hour_memory ;

CREATE TABLE  statistics_hour_memory  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedMemory  float DEFAULT '0',
   maxMemory  float DEFAULT '0',
   usedPermGen  float DEFAULT '0',
   maxPermGen  float DEFAULT '0',
   usedNonHeapMemory  float DEFAULT '0',
   usedBufferedMemory  float DEFAULT '0',
   loadedClassesCount  float DEFAULT '0',
   garbageCollectionTimeMillis  float DEFAULT '0',
   usedPhysicalMemorySize  float DEFAULT '0',
   usedSwapSpaceSize  float DEFAULT '0',
   committedVirtualMemory  float DEFAULT '0',
   freePhysicalMemory  float DEFAULT '0',
   totalPhysicalMemory  float DEFAULT '0',
   freeSwapSpace  float DEFAULT '0',
   totalSwapSpace  float DEFAULT '0',
  UNIQUE KEY  statistics_hour_memory_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_memory  */

insert  into  statistics_hour_memory ( id , appid , queryTime , usedMemory , maxMemory , usedPermGen , maxPermGen , usedNonHeapMemory , usedBufferedMemory , loadedClassesCount , garbageCollectionTimeMillis , usedPhysicalMemorySize , usedSwapSpaceSize , committedVirtualMemory , freePhysicalMemory , totalPhysicalMemory , freeSwapSpace , totalSwapSpace ) values (1000,9,'2016-03-10 12:00:00',466547000,1883240000,-1,-1,6696.06,69211100,4574.23,569.684,-95252000,-777707000,444569000,2638700,8270850,403212,8201040);

/*Table structure for table  statistics_hour_session  */

DROP TABLE IF EXISTS  statistics_hour_session ;

CREATE TABLE  statistics_hour_session  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   userCount  float DEFAULT '0',
  UNIQUE KEY  statistics_hour_session_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_session  */

insert  into  statistics_hour_session ( id , appid , queryTime , userCount ) values (1998,1,'2015-07-18 55:00:00',504.783),(1999,9,'2010-10-02 15:00:00',534.08),(2000,7,'2013-08-07 06:00:00',56.6403);

/*Table structure for table  statistics_hour_sql  */

DROP TABLE IF EXISTS  statistics_hour_sql ;

CREATE TABLE  statistics_hour_sql  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  float DEFAULT '0',
   durationsSum  float DEFAULT '0',
   durationsSquareSum  float DEFAULT '0',
   maximum  float DEFAULT '0',
   cpuTimeSum  float DEFAULT '0',
   systemErrors  float DEFAULT '0',
   responseSizesSum  float DEFAULT '0',
   childHits  float DEFAULT '0',
   childDurationsSum  float DEFAULT '0',
  UNIQUE KEY  statistics_hour_sql_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_hour_sql  */

insert  into  statistics_hour_sql ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (1000,7,'2011-04-23 41:00:00',' select * from tb_user where status_delete="0" and id= ? ',' select * from tb_user where status_delete="0" and id= ? ',611.611,2086.83,19321.7,34965600,11292900,71.261,2982.58,17392.4,475.88);

/*Table structure for table  statistics_minute_action  */

DROP TABLE IF EXISTS  statistics_minute_action ;

CREATE TABLE  statistics_minute_action  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   pgmNo  varchar(255) DEFAULT '',
   pgmId  varchar(255) DEFAULT '',
   pgmNam  varchar(255) DEFAULT '',
   modTyp  varchar(255) DEFAULT '',
   pathDsc  varchar(255) DEFAULT '',
   accessCount  float DEFAULT '0',
  UNIQUE KEY  statistics_minute_action_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=115081 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_minute_action  */

insert  into  statistics_minute_action ( id , appid , queryTime , pgmNo , pgmId , pgmNam , modTyp , pathDsc , accessCount ) values (115079,9,'2017-05-31 21:21:06','230','B1UTG00200','他人为我代办工作','UT','cm/cmog',360.497),(115080,10,'2017-05-31 21:21:06','63','B1UTL00080','工作组选择页面','UT','cm/cmog',429.085);

/*Table structure for table  statistics_minute_http  */

DROP TABLE IF EXISTS  statistics_minute_http ;

CREATE TABLE  statistics_minute_http  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  int(11) DEFAULT '0',
   durationsSum  int(11) DEFAULT '0',
   durationsSquareSum  int(11) DEFAULT '0',
   maximum  int(11) DEFAULT '0',
   cpuTimeSum  int(11) DEFAULT '0',
   systemErrors  int(11) DEFAULT '0',
   responseSizesSum  int(11) DEFAULT '0',
   childHits  int(11) DEFAULT '0',
   childDurationsSum  int(11) DEFAULT '0',
  UNIQUE KEY  statistics_minute_http_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=199650 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_minute_http  */

insert  into  statistics_minute_http ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (1,10,'2009-05-16 18:30:00','app','/cmcm/select GET ',370,9296,17513,56909320,13667373,54,24498,9646,596);


/*Table structure for table statistics_minute_jdbc */

DROP TABLE IF EXISTS statistics_minute_jdbc;

CREATE TABLE statistics_minute_jdbc (
  id bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  appid bigint(16) NOT NULL DEFAULT '0',
  queryTime varchar(32) NOT NULL DEFAULT '',
  usedConnectionCount float DEFAULT '0',
  maxConnectionCount float DEFAULT '0',
  activeConnectionCount float DEFAULT '0',
  UNIQUE KEY id (id)
) ENGINE=InnoDB AUTO_INCREMENT=150941 DEFAULT CHARSET=utf8;

/*Data for the table statistics_minute_jdbc */

insert  into statistics_minute_jdbc(id,appid,queryTime,usedConnectionCount,maxConnectionCount,activeConnectionCount) values (186,8,'2017-04-13 36:47:00',72.3165,77.9756,7.61676);


/*Table structure for table  statistics_minute_memory  */

DROP TABLE IF EXISTS  statistics_minute_memory ;

CREATE TABLE  statistics_minute_memory  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedMemory  float DEFAULT '0',
   maxMemory  float DEFAULT '0',
   usedPermGen  float DEFAULT '0',
   maxPermGen  float DEFAULT '0',
   usedNonHeapMemory  float DEFAULT '0',
   usedBufferedMemory  float DEFAULT '0',
   loadedClassesCount  float DEFAULT '0',
   garbageCollectionTimeMillis  float DEFAULT '0',
   usedPhysicalMemorySize  float DEFAULT '0',
   usedSwapSpaceSize  float DEFAULT '0',
   committedVirtualMemory  float DEFAULT '0',
   freePhysicalMemory  float DEFAULT '0',
   totalPhysicalMemory  float DEFAULT '0',
   freeSwapSpace  float DEFAULT '0',
   totalSwapSpace  float DEFAULT '0',
  UNIQUE KEY  statistics_minute_memory_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=145421 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_minute_memory  */

insert  into  statistics_minute_memory ( id , appid , queryTime , usedMemory , maxMemory , usedPermGen , maxPermGen , usedNonHeapMemory , usedBufferedMemory , loadedClassesCount , garbageCollectionTimeMillis , usedPhysicalMemorySize , usedSwapSpaceSize , committedVirtualMemory , freePhysicalMemory , totalPhysicalMemory , freeSwapSpace , totalSwapSpace ) values (145420,10,'2017-05-31 21:21:06',183038000,1883240000,-1,-1,37033.9,40067700,5336.25,279.122,-258829000,-656954000,597222000,1055260,8270750,7279360,3122190);

/*Table structure for table  statistics_minute_session  */

DROP TABLE IF EXISTS  statistics_minute_session ;

CREATE TABLE  statistics_minute_session  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   userCount  float DEFAULT '0',
  UNIQUE KEY  statistics_minute_session_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=125901 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_minute_session  */

insert  into  statistics_minute_session ( id , appid , queryTime , userCount ) values (125898,8,'2017-05-31 21:21:06',899.529),(125899,9,'2017-05-31 21:21:06',400.011),(125900,10,'2017-05-31 21:21:06',65.7476);

/*Table structure for table  statistics_minute_sql  */

DROP TABLE IF EXISTS  statistics_minute_sql ;

CREATE TABLE  statistics_minute_sql  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  float DEFAULT '0',
   durationsSum  float DEFAULT '0',
   durationsSquareSum  float DEFAULT '0',
   maximum  float DEFAULT '0',
   cpuTimeSum  float DEFAULT '0',
   systemErrors  float DEFAULT '0',
   responseSizesSum  float DEFAULT '0',
   childHits  float DEFAULT '0',
   childDurationsSum  float DEFAULT '0',
  UNIQUE KEY  statistics_minute_sql_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_minute_sql  */

insert  into  statistics_minute_sql ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (10000,9,'2014-08-29 58:39:00',' insert into tb_product(shop_id,ptype,pname,picon,pprice,ptime,pdescription,status_delete) values(?,?,?,?,?,?,?,?)',' insert into tb_product(shop_id,ptype,pname,picon,pprice,ptime,pdescription,status_delete) values(?,?,?,?,?,?,?,?)',232.705,16403,13112.9,10867500,21969900,47.8948,66891.8,8847.47,136.726);

/*Table structure for table  statistics_month_action  */

DROP TABLE IF EXISTS  statistics_month_action ;

CREATE TABLE  statistics_month_action  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   pgmNo  varchar(255) DEFAULT '',
   pgmId  varchar(255) DEFAULT '',
   pgmNam  varchar(255) DEFAULT '',
   modTyp  varchar(255) DEFAULT '',
   pathDsc  varchar(255) DEFAULT '',
   accessCount  float DEFAULT '0',
  UNIQUE KEY  statistics_month_action_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_action  */

insert  into  statistics_month_action ( id , appid , queryTime , pgmNo , pgmId , pgmNam , modTyp , pathDsc , accessCount ) values (199,2,'2014-01-00 00:00:00','172','B1PGB00010','我的查询','pG','cm/cmog',410.128),(200,4,'2008-07-00 00:00:00','245','B1UTG00200','工作流用户授权维护页面','UT','cm/cmog',741.933);

/*Table structure for table  statistics_month_http  */

DROP TABLE IF EXISTS  statistics_month_http ;

CREATE TABLE  statistics_month_http  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  int(11) DEFAULT '0',
   durationsSum  int(11) DEFAULT '0',
   durationsSquareSum  int(11) DEFAULT '0',
   maximum  int(11) DEFAULT '0',
   cpuTimeSum  int(11) DEFAULT '0',
   systemErrors  int(11) DEFAULT '0',
   responseSizesSum  int(11) DEFAULT '0',
   childHits  int(11) DEFAULT '0',
   childDurationsSum  int(11) DEFAULT '0',
  UNIQUE KEY  statistics_month_http_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_http  */

insert  into  statistics_month_http ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (198,6,'2008-10-00 00:00:00','app','/system/delete POST ',785,17393,20334,68156592,17416056,47,64295,6352,438),(199,7,'2010-08-00 00:00:00','app','/statistics/delete',67,7457,11959,20734496,6315785,27,21610,17438,58),(200,1,'2011-11-00 00:00:00','app','/setting/selectAll POST ',18,6921,19134,6487577,18475568,75,40799,11557,97);

/*Table structure for table  statistics_month_jdbc  */

DROP TABLE IF EXISTS  statistics_month_jdbc ;

CREATE TABLE  statistics_month_jdbc  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedConnectionCount  float DEFAULT '0',
   maxConnectionCount  float DEFAULT '0',
   activeConnectionCount  float DEFAULT '0',
  UNIQUE KEY  statistics_month_jdbc_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_jdbc  */

insert  into  statistics_month_jdbc ( id , appid , queryTime , usedConnectionCount , maxConnectionCount , activeConnectionCount ) values (199,3,'2009-03-00 00:00:00',29.2553,69.5825,9.83457),(200,10,'2015-08-00 00:00:00',59.082,93.8706,38.2791);

/*Table structure for table  statistics_month_memory  */

DROP TABLE IF EXISTS  statistics_month_memory ;

CREATE TABLE  statistics_month_memory  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedMemory  float DEFAULT '0',
   maxMemory  float DEFAULT '0',
   usedPermGen  float DEFAULT '0',
   maxPermGen  float DEFAULT '0',
   usedNonHeapMemory  float DEFAULT '0',
   usedBufferedMemory  float DEFAULT '0',
   loadedClassesCount  float DEFAULT '0',
   garbageCollectionTimeMillis  float DEFAULT '0',
   usedPhysicalMemorySize  float DEFAULT '0',
   usedSwapSpaceSize  float DEFAULT '0',
   committedVirtualMemory  float DEFAULT '0',
   freePhysicalMemory  float DEFAULT '0',
   totalPhysicalMemory  float DEFAULT '0',
   freeSwapSpace  float DEFAULT '0',
   totalSwapSpace  float DEFAULT '0',
  UNIQUE KEY  statistics_month_memory_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_memory  */

insert  into  statistics_month_memory ( id , appid , queryTime , usedMemory , maxMemory , usedPermGen , maxPermGen , usedNonHeapMemory , usedBufferedMemory , loadedClassesCount , garbageCollectionTimeMillis , usedPhysicalMemorySize , usedSwapSpaceSize , committedVirtualMemory , freePhysicalMemory , totalPhysicalMemory , freeSwapSpace , totalSwapSpace ) values (197,1,'2015-03-00 00:00:00',741932000,1883240000,-1,-1,74007.1,59239800,6578.16,557.503,-265096000,-903964000,541718000,620143,8270820,11810700,13622000),(198,1,'2017-07-00 00:00:00',1660530000,1883240000,-1,-1,1307.31,26182800,8256.57,578.572,-155724000,-366431000,610214000,499046,8270850,5286400,1485520),(199,8,'2008-05-00 00:00:00',981921000,1883240000,-1,-1,28337.3,41728900,3795.79,256.821,-412542000,-746893000,474392000,609982,8271040,4250710,2918550),(200,8,'2010-08-00 00:00:00',1429860000,1883240000,-1,-1,50173.5,5551890,7652.47,303.444,-1050900000,-364490000,617424000,1442710,8270940,8596040,6401090);

/*Table structure for table  statistics_month_session  */

DROP TABLE IF EXISTS  statistics_month_session ;

CREATE TABLE  statistics_month_session  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   userCount  float DEFAULT '0',
  UNIQUE KEY  statistics_month_session_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_session  */

insert  into  statistics_month_session ( id , appid , queryTime , userCount ) values (199,7,'2016-10-00 00:00:00',714.003),(200,8,'2013-12-00 00:00:00',536.798);

/*Table structure for table  statistics_month_sql  */

DROP TABLE IF EXISTS  statistics_month_sql ;

CREATE TABLE  statistics_month_sql  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  float DEFAULT '0',
   durationsSum  float DEFAULT '0',
   durationsSquareSum  float DEFAULT '0',
   maximum  float DEFAULT '0',
   cpuTimeSum  float DEFAULT '0',
   systemErrors  float DEFAULT '0',
   responseSizesSum  float DEFAULT '0',
   childHits  float DEFAULT '0',
   childDurationsSum  float DEFAULT '0',
  UNIQUE KEY  statistics_month_sql_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_month_sql  */

insert  into  statistics_month_sql ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (200,2,'2010-11-00 00:00:00',' update tb_user set password=?,name=?,icon=?,gender=?,birthday=?,district_id=?,mail=?,issh=?,status_delete=?,description=? where id=?',' update tb_user set password=?,name=?,icon=?,gender=?,birthday=?,district_id=?,mail=?,issh=?,status_delete=?,description=? where id=?',879.816,20479.9,6626.79,10240400,1410070,0.160421,52534.8,1026.1,586.052);

/*Table structure for table  statistics_year_action  */

DROP TABLE IF EXISTS  statistics_year_action ;

CREATE TABLE  statistics_year_action  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   pgmNo  varchar(255) DEFAULT '',
   pgmId  varchar(255) DEFAULT '',
   pgmNam  varchar(255) DEFAULT '',
   modTyp  varchar(255) DEFAULT '',
   pathDsc  varchar(255) DEFAULT '',
   accessCount  float DEFAULT '0',
  UNIQUE KEY  statistics_year_action_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_action  */

insert  into  statistics_year_action ( id , appid , queryTime , pgmNo , pgmId , pgmNam , modTyp , pathDsc , accessCount ) values (99,10,'1919-00-00 00:00:00','165','B1OGS00040','数据列表','OG','cm/cmog',67.6178),(100,10,'1918-00-00 00:00:00','111','B1OGR00090','指定版本责任中心一览程序','OG','cm/cmog',692.929);

/*Table structure for table  statistics_year_http  */

DROP TABLE IF EXISTS  statistics_year_http ;

CREATE TABLE  statistics_year_http  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  int(11) DEFAULT '0',
   durationsSum  int(11) DEFAULT '0',
   durationsSquareSum  int(11) DEFAULT '0',
   maximum  int(11) DEFAULT '0',
   cpuTimeSum  int(11) DEFAULT '0',
   systemErrors  int(11) DEFAULT '0',
   responseSizesSum  int(11) DEFAULT '0',
   childHits  int(11) DEFAULT '0',
   childDurationsSum  int(11) DEFAULT '0',
  UNIQUE KEY  statistics_year_http_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_http  */

insert  into  statistics_year_http ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (100,10,'1918-00-00 00:00:00','app','/system/select GET ',682,15431,10189,66785904,14493677,49,19642,13873,962);

/*Table structure for table  statistics_year_jdbc  */

DROP TABLE IF EXISTS  statistics_year_jdbc ;

CREATE TABLE  statistics_year_jdbc  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedConnectionCount  float DEFAULT '0',
   maxConnectionCount  float DEFAULT '0',
   activeConnectionCount  float DEFAULT '0',
  UNIQUE KEY  statistics_year_jdbc_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_jdbc  */

insert  into  statistics_year_jdbc ( id , appid , queryTime , usedConnectionCount , maxConnectionCount , activeConnectionCount ) values (99,10,'1919-00-00 00:00:00',21.8049,21.5618,37.3531),(100,10,'1918-00-00 00:00:00',72.7051,83.5595,44.5602);

/*Table structure for table  statistics_year_memory  */

DROP TABLE IF EXISTS  statistics_year_memory ;

CREATE TABLE  statistics_year_memory  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   usedMemory  float DEFAULT '0',
   maxMemory  float DEFAULT '0',
   usedPermGen  float DEFAULT '0',
   maxPermGen  float DEFAULT '0',
   usedNonHeapMemory  float DEFAULT '0',
   usedBufferedMemory  float DEFAULT '0',
   loadedClassesCount  float DEFAULT '0',
   garbageCollectionTimeMillis  float DEFAULT '0',
   usedPhysicalMemorySize  float DEFAULT '0',
   usedSwapSpaceSize  float DEFAULT '0',
   committedVirtualMemory  float DEFAULT '0',
   freePhysicalMemory  float DEFAULT '0',
   totalPhysicalMemory  float DEFAULT '0',
   freeSwapSpace  float DEFAULT '0',
   totalSwapSpace  float DEFAULT '0',
  UNIQUE KEY  statistics_year_memory_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_memory  */

insert  into  statistics_year_memory ( id , appid , queryTime , usedMemory , maxMemory , usedPermGen , maxPermGen , usedNonHeapMemory , usedBufferedMemory , loadedClassesCount , garbageCollectionTimeMillis , usedPhysicalMemorySize , usedSwapSpaceSize , committedVirtualMemory , freePhysicalMemory , totalPhysicalMemory , freeSwapSpace , totalSwapSpace ) values (97,10,'1921-00-00 00:00:00',1721160000,1883240000,-1,-1,36025.4,9583350,7070.18,353.71,-666152000,-122419000,433453000,2273880,8271030,1474470,14446600),(98,10,'1920-00-00 00:00:00',953944000,1883240000,-1,-1,72484.2,49080600,4238.89,294.086,-998813000,-169366000,434911000,1158830,8271020,9038320,6313640),(99,10,'1919-00-00 00:00:00',1738590000,1883240000,-1,-1,5384.58,34763900,4088.21,571.056,-557985000,-409486000,548441000,1068310,8270960,7550060,1105780),(100,10,'1918-00-00 00:00:00',346680000,1883240000,-1,-1,40819,9344040,7876.78,351.097,-1033490000,-1071480000,544166000,2894560,8270930,6015540,9564960);

/*Table structure for table  statistics_year_session  */

DROP TABLE IF EXISTS  statistics_year_session ;

CREATE TABLE  statistics_year_session  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   userCount  float DEFAULT '0',
  UNIQUE KEY  statistics_year_session_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_session  */

insert  into  statistics_year_session ( id , appid , queryTime , userCount ) values (100,10,'1918-00-00 00:00:00',334.002);

/*Table structure for table  statistics_year_sql  */

DROP TABLE IF EXISTS  statistics_year_sql ;

CREATE TABLE  statistics_year_sql  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   appid  bigint(16) NOT NULL DEFAULT '0',
   queryTime  varchar(32) NOT NULL DEFAULT '',
   NAME  varchar(255) DEFAULT '',
   iid  varchar(255) DEFAULT '',
   hits  float DEFAULT '0',
   durationsSum  float DEFAULT '0',
   durationsSquareSum  float DEFAULT '0',
   maximum  float DEFAULT '0',
   cpuTimeSum  float DEFAULT '0',
   systemErrors  float DEFAULT '0',
   responseSizesSum  float DEFAULT '0',
   childHits  float DEFAULT '0',
   childDurationsSum  float DEFAULT '0',
  UNIQUE KEY  statistics_year_sql_id  ( id )
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table  statistics_year_sql  */

insert  into  statistics_year_sql ( id , appid , queryTime , NAME , iid , hits , durationsSum , durationsSquareSum , maximum , cpuTimeSum , systemErrors , responseSizesSum , childHits , childDurationsSum ) values (100,10,'1918-00-00 00:00:00',' select * from tb_product where status_delete="0" and shop_id= ? ',' select * from tb_product where status_delete="0" and shop_id= ? ',57.1901,21309.9,15585.4,32050400,9284200,75.6118,37795,6264.49,238.767);

/*Table structure for table  tbuser  */

DROP TABLE IF EXISTS  tbuser ;

CREATE TABLE  tbuser  (
   id  bigint(16) unsigned NOT NULL AUTO_INCREMENT,
   account  varchar(255) DEFAULT '',
   username  varchar(255) DEFAULT '',
   PASSWORD  varchar(255) DEFAULT '',
   icon  varchar(1024) DEFAULT '',
   roleId  bigint(16) DEFAULT '0',
   role  varchar(255) DEFAULT '',
   queryTime  varchar(255) DEFAULT '',
   deleteStatus  char(1) DEFAULT '0',
   des  varchar(1024) DEFAULT '',
  UNIQUE KEY  tbuser_id  ( id ),
  UNIQUE KEY  account  ( account )
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table  tbuser  */

insert  into  tbuser ( id , account , username , PASSWORD , icon , roleId , role , queryTime , deleteStatus , des ) values (1,'13601509223','陆瑞华','e583334a7ae880c22dcd1cd7e2c7d211','',0,'','','0','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
