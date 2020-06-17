/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.30 : Database - easy-blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easy-blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easy-blog`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=1206227 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`) values (10000,'dmlr','111111');

/*Table structure for table `admin_login_log` */

DROP TABLE IF EXISTS `admin_login_log`;

CREATE TABLE `admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `admin_id` int(11) NOT NULL COMMENT '管理员ID',
  `date` timestamp NULL DEFAULT NULL COMMENT '登陆日期',
  `ip` varchar(30) DEFAULT NULL COMMENT '登陆IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Data for the table `admin_login_log` */

insert  into `admin_login_log`(`id`,`admin_id`,`date`,`ip`) values (42,10000,'2020-06-11 22:32:44','0:0:0:0:0:0:0:1'),(43,10000,'2020-06-11 22:39:26','0:0:0:0:0:0:0:1'),(44,10000,'2020-06-16 11:47:30','0:0:0:0:0:0:0:1'),(45,10000,'2020-06-16 11:47:57','0:0:0:0:0:0:0:1'),(46,10000,'2020-06-16 11:59:50','0:0:0:0:0:0:0:1'),(47,10000,'2020-06-16 12:00:58','0:0:0:0:0:0:0:1'),(48,10000,'2020-06-16 15:09:41','0:0:0:0:0:0:0:1'),(49,10000,'2020-06-16 17:12:50','0:0:0:0:0:0:0:1'),(50,10000,'2020-06-16 17:17:08','0:0:0:0:0:0:0:1'),(51,10000,'2020-06-16 17:24:48','0:0:0:0:0:0:0:1'),(52,10000,'2020-06-16 17:28:12','0:0:0:0:0:0:0:1'),(53,10000,'2020-06-16 17:28:24','0:0:0:0:0:0:0:1'),(54,10000,'2020-06-16 17:48:43','0:0:0:0:0:0:0:1'),(55,10000,'2020-06-16 17:49:27','0:0:0:0:0:0:0:1'),(56,10000,'2020-06-16 17:52:37','0:0:0:0:0:0:0:1'),(57,10000,'2020-06-16 17:53:56','0:0:0:0:0:0:0:1'),(58,10000,'2020-06-16 17:54:31','0:0:0:0:0:0:0:1'),(59,10000,'2020-06-16 17:57:42','0:0:0:0:0:0:0:1'),(60,10000,'2020-06-16 17:58:12','0:0:0:0:0:0:0:1'),(61,10000,'2020-06-16 18:00:57','0:0:0:0:0:0:0:1'),(62,10000,'2020-06-16 18:25:39','0:0:0:0:0:0:0:1'),(63,10000,'2020-06-16 20:50:17','0:0:0:0:0:0:0:1'),(64,10000,'2020-06-16 21:17:33','0:0:0:0:0:0:0:1'),(65,10000,'2020-06-16 21:19:20','0:0:0:0:0:0:0:1'),(66,10000,'2020-06-16 21:25:40','0:0:0:0:0:0:0:1'),(67,10000,'2020-06-16 21:44:25','0:0:0:0:0:0:0:1'),(68,10000,'2020-06-16 22:22:00','0:0:0:0:0:0:0:1'),(69,10000,'2020-06-16 22:51:27','0:0:0:0:0:0:0:1'),(70,10000,'2020-06-16 22:57:11','0:0:0:0:0:0:0:1'),(71,10000,'2020-06-16 22:58:15','0:0:0:0:0:0:0:1'),(72,10000,'2020-06-16 22:58:46','0:0:0:0:0:0:0:1'),(73,10000,'2020-06-16 22:59:01','0:0:0:0:0:0:0:1'),(74,10000,'2020-06-16 23:02:07','0:0:0:0:0:0:0:1'),(75,10000,'2020-06-17 10:19:22','0:0:0:0:0:0:0:1'),(76,10000,'2020-06-17 10:24:36','0:0:0:0:0:0:0:1'),(77,10000,'2020-06-17 10:27:00','0:0:0:0:0:0:0:1'),(78,10000,'2020-06-17 10:27:01','0:0:0:0:0:0:0:1'),(79,10000,'2020-06-17 10:27:01','0:0:0:0:0:0:0:1'),(80,10000,'2020-06-17 10:27:02','0:0:0:0:0:0:0:1'),(81,10000,'2020-06-17 10:27:02','0:0:0:0:0:0:0:1'),(82,10000,'2020-06-17 10:27:02','0:0:0:0:0:0:0:1'),(83,10000,'2020-06-17 10:27:50','0:0:0:0:0:0:0:1'),(84,10000,'2020-06-17 10:27:51','0:0:0:0:0:0:0:1'),(85,10000,'2020-06-17 10:27:51','0:0:0:0:0:0:0:1'),(86,10000,'2020-06-17 10:27:51','0:0:0:0:0:0:0:1'),(87,10000,'2020-06-17 10:27:52','0:0:0:0:0:0:0:1'),(88,10000,'2020-06-17 10:28:14','0:0:0:0:0:0:0:1'),(89,10000,'2020-06-17 10:28:15','0:0:0:0:0:0:0:1'),(90,10000,'2020-06-17 10:28:15','0:0:0:0:0:0:0:1'),(91,10000,'2020-06-17 10:28:23','0:0:0:0:0:0:0:1'),(92,10000,'2020-06-17 10:34:46','0:0:0:0:0:0:0:1');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `keywords` varchar(150) NOT NULL COMMENT '关键字',
  `desci` varchar(500) NOT NULL COMMENT '描述',
  `pic` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `content` text NOT NULL COMMENT '内容',
  `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击量',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发表日期',
  `catalog_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`title`,`keywords`,`desci`,`pic`,`content`,`click`,`time`,`catalog_id`) values (114,'List集合add方法覆盖原来的内容解决办法','List，add方法','',NULL,'<p>\r\n<span>今天遇到一个有意思的问题，当我遍历数组的同时在for循环中使用list.add(),但这样会将之前的内容也覆盖掉。本来有3条数据，但这样会得到三条相同的数据</span>\r\n</p><pre><code>T t =new T();\r\nList&lt;T&gt; tList = new List&lt;T&gt;();\r\n\r\nfor(int i=0;i&lt;10;i++){\r\n  t.num=i;\r\n  tList.add(t);        \r\n}</code></pre><p>\r\n</p><p>这种情况中tList存的是t的引用（地址），所以add的所有值其实都相同，就是t最开始new时的地址中的值。</p><p>解决办法：</p><p>&nbsp; 在循环中将你的对象再new一次</p><p>原因：</p><p>&nbsp; 当使用List&lt;T&gt;时，如果T是引用类型，保存的是引用，如果是值类型，保存的是值本身。</p><p>1、T是对象是，也就是说如果是引类型时，在循环外边已经new了一个类型为T的对象，相当于这个对象的地址在内存空间已经开辟出来了，保存到了固定的位置，这时候我们使用add方法时，会增加值的个数，但引用地址不变，所以后面的值会覆盖掉前面的值</p><p>2、T是值对象时，这种和上面就不一样了，值对象用来保存一组不会改变的量，当我们需要使用这个对象时，会在系统中开辟另一个空间。因此，值对象使用add方法时不会出现覆盖问题。</p><p>\r\n\r\n<b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p><p>\r\n<b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p>',26,'2020-06-17 11:10:57',0),(110,'web.xml 中&lt;context-param&gt;与&lt;init-param&gt;的区别与作用','web.xml','',NULL,'<p>&lt;context-param&gt;的作用:&nbsp;<br>web.xml的配置中&lt;context-param&gt;配置作用&nbsp;</p><p>1.&nbsp;启动一个WEB项目的时候,容器(如:Tomcat)会去读它的配置文件web.xml.读两个节点: &lt;listener&gt;&lt;/listener&gt; 和 &lt;context-param&gt;&lt;/context-param&gt;&nbsp;<br>2.紧接着,容器创建一个ServletContext(上下文),这个WEB项目所有部分都将共享这个上下文.&nbsp;<br>3.容器将&lt;context-param&gt;&lt;/context-param&gt;转化为键值对,并交给ServletContext.&nbsp;<br>4.容器创建&lt;listener&gt;&lt;/listener&gt;中的类实例,即创建监听.&nbsp;</p><p>换句话说,这个时候,你对&lt;context-param&gt;中的键值做的操作,将在你的WEB项目完全启动之前被执行.</p><p>&nbsp;</p><p>context-param和init-param区别&nbsp;<br>web.xml里面可以定义两种参数：&nbsp;<br>(1)application范围内的参数，存放在servletcontext中，在web.xml中配置如下：&nbsp;<br>&lt;context-param&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;param-name&gt;context/param&lt;/param-name&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;param-value&gt;avalible during application&lt;/param-value&gt;&nbsp;<br>&lt;/context-param&gt;&nbsp;<br>(2)servlet范围内的参数，只能在servlet的init()方法中取得，在web.xml中配置如下：&nbsp;<br>&lt;servlet&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp; &lt;servlet-name&gt;MainServlet&lt;/servlet-name&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp; &lt;servlet-class&gt;com.wes.controller.MainServlet&lt;/servlet-class&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp; &lt;init-param&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;param-name&gt;param1&lt;/param-name&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;param-value&gt;avalible in servlet init()&lt;/param-value&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp; &lt;/init-param&gt;&nbsp;<br>&nbsp;&nbsp;&nbsp; &lt;load-on-startup&gt;0&lt;/load-on-startup&gt;&nbsp;<br>&lt;/servlet&gt;&nbsp;</p><p>&nbsp;</p><p>在servlet中可以通过代码分别取用：&nbsp;<br>package com.wes.controller;&nbsp;<br>import javax.servlet.ServletException;&nbsp;<br>import javax.servlet.http.HttpServlet;&nbsp;<br>public class MainServlet extends HttpServlet ...{&nbsp;<br>&nbsp;&nbsp;&nbsp; public MainServlet() ...{&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super();&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;<br>&nbsp;&nbsp;&nbsp; public void init() throws ServletException ...{&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(\"下面的两个参数param1是在servlet中存放的\");&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(this.getInitParameter(\"param1\"));&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(\"下面的参数是存放在servletcontext中的\");&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(getServletContext().getInitParameter(\"context/param\"));&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;<br>}&nbsp;</p><p>&nbsp;</p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p>第一种参数在servlet里面可以通过getServletContext().getInitParameter(\"context/param\")得到&nbsp;<br>第二种参数只能在servlet的init()方法中通过this.getInitParameter(\"param1\")取得.&nbsp;</p>',3,'2020-06-17 11:12:39',0),(129,'Java单例模式之双检锁深入思考','单例模式，双检锁','',NULL,'<p>在介绍基于双检锁的单例模式下，我们先思考下在使用延迟加载的情况下，如何实现一个单例模式，可能有一些比较年轻的小伙伴，不假思索的就写下了下面的一段代码：<br></p><pre><code>private  static DoubleCheckSingleton instance;  \r\n    //私有的构造方法  \r\n    private DoubleCheckSingleton() {}       \r\n    public static DoubleCheckSingleton getErrorInstance(){  \r\n        if (instance==null){  \r\n            instance=new DoubleCheckSingleton();  \r\n        }  \r\n        return instance;  \r\n    }</code></pre><p>上面的代码在单线程的环境下是没有问题的，但是在多线程的环境下是不能保证只创建一个实例的， <br>然后小伙伴想了下，这还不简单，加个同步关键字就可以了：</p><pre><code>    private  static DoubleCheckSingleton instance;  \r\n      \r\n    //私有的构造方法  \r\n    private DoubleCheckSingleton() {}  \r\n      \r\n    public synchronized static DoubleCheckSingleton getErrorInstance(){  \r\n        if (instance==null){  \r\n            instance=new DoubleCheckSingleton();  \r\n        }  \r\n        return instance;  \r\n    }  <br></code></pre><p>嗯，这下看起来没问题，但唯一的不足就是，这段代码虽然可以保证只创建一个单例，但其性能不高，因为每次访问这个方法的时候都需要执行同步操作，那么有没有方法可以避免这一个缺点呢？这个时候我们就可以用双检锁的模式了：<br></p><pre><code>private  volatile static DoubleCheckSingleton instance;  \r\n      \r\n    //私有的构造方法  \r\n    private DoubleCheckSingleton() {}  \r\n      \r\n    public static DoubleCheckSingleton getInstance(){  \r\n  \r\n        if(instance==null){ //第一层检查  \r\n  \r\n            synchronized (DoubleCheckSingleton.class){  \r\n  \r\n                if(instance==null){ //第二层检查  \r\n  \r\n                    instance=new DoubleCheckSingleton();  \r\n  \r\n                }  \r\n  \r\n            }  \r\n  \r\n        }  \r\n        return instance;  \r\n  \r\n    }</code></pre><p>想要彻底理解双检锁模式的原理，首先要明白在Java里面一个线程对共享变量的修改，对于另外一个线程是不可预知的，也就是说它可能看不到变化，也有可能会看到，虽然在大多数时候是看不到的，但这不能证明它总是会被看到，除非正确的使用同步，否则是没法掌控的。 <br>\r\n<br>上面的基础认知非常重要，我原来就理解错误了，因为我通过代码检测出来，一个线程的修改对于另外一个线程是不可见的，所以就一直认为总是不可见的。但其实这是不正确的认识，因为编写多线程代码可能是容易的，但测试多线程程序是非常复杂的，或者说在一些情况下，没有人知道应该怎么测和怎么复现多线程bug，这也是多线程程序很难调试的的原因。\r\n<br>\r\n<br>\r\n<br>关于双检锁里面为什么必须要加volatile关键字，主要用来避免重排序问题导致其他的线程看到了一个已经分配内存和地址但没有初始化的对象，也就是说这个对象还不是处于可用状态，就被其他线程引用了。\r\n<br>\r\n<br>下面的代码在多线程环境下不是原子执行的。<br></p><pre><code>instance=new DoubleCheckSingleton();</code></pre><p>正常的底层执行顺序会转变成三步：<br></p><p>(1) 给DoubleCheckSingleton类的实例instance分配内存&nbsp;</p><p>&nbsp;(2) 调用实例instance的构造函数来初始化成员变量&nbsp;</p><p>&nbsp;(3) 将instance指向分配的内存地址&nbsp;</p><p>上面的三步，无论在A线程当前执行到那一步骤，对B线程来说可能看到A的状态只能是两种1，2看到的都是null，3看到的非null，这是没问题的。 <br>\r\n<br>但是如果线程A在重排序的情况下，上面的执行顺序会变成1,3,2。现在假设A线程按1,3,2三个步骤顺序执行，当执行到第二步的时候。B线程开始调用这个方法，那么在第一个null的检查的时候，就有可能看到这个实例不是null，然后直接返回这个实例开始使用，但其实是有问题的，因为对象还没有初始化，状态还处于不可用的状态，故而会导致异常发生。\r\n<br>\r\n<br>要解决这个问题，可以通过volatile关键词来避免指令重排序，这里相比可见性问题主要是为了避免重排序问题。如果使用了volatile修饰成员变量，那么在变量赋值之后，会有一个内存屏障。也就说只有执行完1,2,3步操作后，读取操作才能看到，读操作不会被重排序到写操作之前。这样以来就解决了对象状态不完整的问题。\r\n<br>\r\n<br>那么volatile到底如何保证可见性和禁止指令重排序的\r\n<br>在《深入理解Java虚拟机》一书中有描述：\r\n<br>“观察加入volatile关键字和没有加入volatile关键字时所生成的汇编代码发现，加入volatile关键字时，会多出一个lock前缀指令”\r\n<br>lock前缀指令实际上相当于一个内存屏障（也成内存栅栏），内存屏障会提供3个功能：<br></p><p>1）它确保指令重排序时不会把其后面的指令排到内存屏障之前的位置，   \r\n    也不会把前面的指令排到内存屏障的后面；即在执行到内存屏障这句指令时  \r\n    ，在它前面的操作已经全部完成；  \r\n  \r\n　　</p><p>2）它会强制将对缓存的修改操作立即写入主存；  \r\n  \r\n　　</p><p>3）如果是写操作，它会导致其他CPU中对应的缓存行无效。&nbsp;</p><p>从上面可以看到volatile不保证原子性，保证可见性和部分有序性，这一点需要谨记。 <br>\r\n<br>此外这里需要注意的是在JDK5之前，就算加了volatile关键字也依然有问题，原因是之前的JMM模型是有缺陷，volatile变量前后的代码仍然可以出现重排序问题，这个问题在JDK5之后才得到解决，所以现在才可以这么使用。\r\n<br></p>',0,'2020-06-17 10:54:59',0),(109,'关于web.xml配置中的&lt;url-pattern&gt;','&lt;url-pattern&gt;，web.xml','',NULL,'<h3>标签&lt;url-pattern&gt;</h3><p>&lt;url-pattern&gt;是我们用Servlet做Web项目时需要经常配置的标签，例：</p><p>&lt;servlet&gt;<br>&lt;servlet-name&gt;index&lt;/servlet-name&gt;<br>&lt;servlet-class&gt;com.we.servlet.IndexServlet&lt;/servlet-class&gt;<br>&lt;/servlet&gt;<br>&lt;servlet-mapping&gt;<br>&lt;servlet-name&gt;index&lt;/servlet-name&gt;<br>&lt;url-pattern&gt;/index&lt;/url-pattern&gt;<br>&lt;/servlet-mapping&gt;</p><p>当我们在浏览器的地址栏里输入http://localhost:8080/we/index时[假设我部署在webapps目录下的项目名为we]</p><p>就会匹配到我们指定的&lt;url-pattern&gt;中，即/index然后一步一步找到对应的&lt;servlet-class&gt;</p><p>那我们输入的URL：http://localhost:8080/we/index又是如何与&lt;url-pattern&gt;中的/index匹配的呢？</p><p>首先我们要知道URL的组成</p><p>http://localhost:8080 &nbsp; &nbsp;我们可以理解为是我们的服务器地址，而该地址之后的部分我们统称为：RequestURI</p><p>RequestURI是我们需要重点注意的部分，其又可以分解为几部分</p><p>/we &nbsp;是我们的ServletConext的上下文地址，我们称为ServletContext Path，可以简单理解为部署项目时的webapps目录下的项目名</p><p>/index &nbsp;是我们的Servlet的地址，我们称为Servlet Path，这里就是需要与我们的&lt;url-pattern&gt;匹配的内容</p><p>注：在/index后边我们还可以跟其他的信息，例如：/index?name=admin&amp;pass=admin &nbsp;这是其中一种明文表示的方式</p><p>&nbsp;</p><h3>标签&lt;url-pattern&gt;中*的使用</h3><p>我们知道在写&lt;url-pattern&gt;时有一种通配符的使用写法，即*</p><p>1.当我使用&lt;url-pattern&gt;/*&lt;/url-pattern&gt;时，我们可以匹配所有的请求，即所有的请求都会经过该标签对应的Servlet</p><p>此时就需要注意静态资源的请求，因为当我们使用http://localhost:8080/we/login.html时，依然会匹配该Servlet，</p><p>而很多静态资源其实是不需要经过Servlet的，例如：js，css，html，jsp，img等静态资源文件，此时就需要在该Servlet中对静态资源做特殊处理</p><p>2.如果配有如下两个&lt;url-pattern&gt;标签时，URL地址为http://localhost:8080/we/index时又是如何匹配的呢？</p><p>&lt;url-pattern&gt;/index&lt;/url-pattern&gt;</p><p>&lt;url-pattern&gt;/*&lt;/url-pattern&gt;</p><p>上边我们已经说过，/*可以匹配所有的请求，而/index也可以匹配我们的URL地址，此时URL地址会自动且优先的进行精确匹配，即/index，</p><p>且只匹配一次，也就是说一旦匹配到一个Servlet即执行该Servlet不再对其他Servlet进行匹配，</p><p>当我们输入一个http://localhost:8080/we/login时，由于此时匹配不到/login所以只能匹配/*了</p><p>3.在Servlet Path部分我们还可以使用更精确的匹配，例如：</p><p>&lt;url-pattern&gt;/index/login&lt;/url-pattern&gt;匹配http://localhost:8080/we/index/login</p><p>&lt;url-pattern&gt;/index/logout&lt;/url-pattern&gt;匹配http://localhost:8080/we/index/logout</p><p>此时/index/login和/index/logout才是我们的Servlet Path</p><p>&nbsp;4.我们可以通过使用&lt;url-pattern&gt;*.do&lt;/url-pattern&gt;来过滤请求，</p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p>这样如果我们在页面中的请求中添加后缀名.do就可以避免对静态资源的过滤了，也就不需要对静态资源做特殊处理了</p>',20,'2020-06-17 11:11:37',0),(108,'java异常类的执行流程与自定义异常类','异常类','',NULL,'<p>\r\n<span>在我们写代码时，可以通过判断一些参数是否正确来决定是否中断程序（抛出异常）</span>&nbsp;</p><pre><code>class WrongInputException extends Exception { // 自定义的类    \r\n　　　　　WrongInputException(String s) {\r\n        super(s);\r\n    }\r\n}\r\nclass Input {\r\n//如果一个函数要抛出异常但是自己不处理异常（catch）,而是交给调用它的函数去处理，那么就要声明抛出的异常类型\r\n//即throws WrongInputException\r\nvoid method() throws WrongInputException { \r\n　　　　if(isWrong(input))//如果输入值错误那么就抛出异常\r\n        throw new WrongInputException(\"Wrong input\"); // 抛出自定义的类\r\n    }\r\n}\r\nclass TestInput {\r\n//如果一个函数要抛出异常并且自己处理异常（catch），那么不用声明抛出的异常类型\r\n//没有throws WrongInputException\r\npublic static void main(String[] args){ try {\r\n            new Input().method();\r\n        }\r\n        catch(WrongInputException wie) {\r\n            System.out.println(wie.getMessage());\r\n        }\r\n    } \r\n}</code></pre><p>\r\n</p><p>在程序中一些地方如果因为出现异常而需要中断时，可以使用throw语句抛出异常（每个异常都是一个名叫Throwable的类的一个实例，exception类继承自throwable类），相应的catch语句会接管执行。但是catch语句不一定和throw语句在同一个函数中。</p><p>抛出异常有两种方法：</p><p>1.抛出异常的函数自己处理异常try...catch...finally结构。</p><p>\r\n\r\n</p><pre><code>//如果一个函数要抛出异常并且自己处理异常（catch），那么不用声明抛出的异常类型\r\n//没有throws WrongInputException\r\npublic static void main(String[] args){ \r\n　　　　　try {\r\n            new Input().method();\r\n        }\r\n        catch(WrongInputException wie) {\r\n            System.out.println(wie.getMessage());\r\n        }\r\n    }</code></pre><p>\r\n<span>2.抛出异常的函数不处理异常，而是将异常抛出给调用自己的函数（函数名后跟throws...语句）。</span></p><pre><code>//如果一个函数要抛出异常但是自己不处理异常（catch）,而是交给调用它的函数去处理，那么就要声明抛出的异常类型\r\n//即throws WrongInputException\r\nvoid method() throws WrongInputException { \r\n　　　　if(isWrong(input))//如果输入值错误那么就抛出异常\r\n        throw new WrongInputException(\"Wrong input\"); // 抛出自定义的类\r\n    }</code></pre><p>\r\n<span>自定义异常类：</span>\r\n</p><pre><code>class WrongInputException extends Exception { // 自定义的类    \r\n　　　　　WrongInputException(String s) {\r\n        super(s);\r\n    }\r\n}</code></pre><p>\r\n<span>一般继承Exception类，异常类的作用是遇到throw语句时跳转到catch语句，本质上是个跳转语句。</span>\r\n\r\n<b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p><p>\r\n<b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p><p>&nbsp;<b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p><p><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p><p><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p>',0,'2019-09-03 13:44:03',0),(107,'wangEiditor的快捷键','快捷键','',NULL,'<p>&nbsp;wangEditor中默认的快捷键有：</p><ol><li>ctrl + b &nbsp;加粗</li><li>ctrl + i 斜体</li><li>ctrl + u 下划线</li><li>ctrl + z 撤销</li></ol><p>\r\n\r\n</p>',0,'2020-03-19 17:45:01',0),(130,'c语言局部变量与全局变量大小的限制','c，堆栈','',NULL,'<p>写程序时发现了一个大数组无法使用局部变量的问题，必须使用全局变量，总结时发现了博主这篇很好的文章，收藏！</p><p>看代码</p><p>#include &lt;stdio.h&gt;<br>int main(){<br>int a[1000000];//局部变量<br>return 0;<br>}</p><p>编译运行后发现溢出错误。</p><p>#include &lt;stdio.h&gt;<br>int a[1000000];//全局变量<br>int main(){<br>return 0;<br>}</p><p>编译运行后正常。</p><p>在解释原因前我们先看一下一个由C/C++编译的程序占用的内存分为几个部分：</p><p>1、栈区(stack segment)：由编译器自动分配释放，存放函数的参数的值，局部变量的值等。在Windows下，栈是向低地址扩展的数据结构，是一块连续的内存的区域。这句话的意思是栈顶的地址和栈的最大容量是系统预先规定好的，在WINDOWS下，栈的大小是2M(也有的是1M，总之是一个编译时就确定的常数)，如果申请的空间超过栈的剩余空间时，将提示overflow。因此，能从栈获得的空间较小。</p><p>2、堆区(heap segment)&nbsp;：一般由程序员分配释放，若程序员不释放，程序结束时可能由系统回收。它与数据结构中的堆是两回事。堆是向高地址扩展的数据结构，是不连续的内存区域。这是由于系统是用链表来存储的空闲内存地址的，自然是不连续的，而链表的遍历方向是由低地址向高地址。堆的大小受限于计算机系统中有效的虚拟内存。由此可见，堆获得的空间比较灵活，也比较大。</p><p>3、全局区(静态区)(data segment)：全局变量和静态变量的存储区域是在一起的，程序结束后由系统释放。数据区的大小由系统限定，一般很大。</p><p>4、文字常量区：常量字符串就是放在这里的， 程序结束后由系统释放。</p><p>5、程序代码区：存放函数体的二进制代码。</p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p>综上所述，局部变量空间是很小的，我们开一个a[1000000]就会导致栈溢出；而全局变量空间在Win 32bit 下可以达到4GB，因此不会溢出。</p>',4,'2020-06-17 10:57:17',0),(126,'Java方法中传递数组与改变数组值的问题','java参数值传递，地址传递','',NULL,'<p>在java中，不允许程序员选择值传递还是地址传递各个参数，基本类型总是按值传递。对于对象来说，是将对象的引用也就是副本传递给了方法，在方法中只有对对象进行修改才能影响该对象的值，操作对象的引用时是无法影响对象。</p><p>现在说说数组：如果将单个基本类型数组的元素传递给方法，并在方法中对 其进行修改，则在被调用方法结束执行时，该元素中存储的并不是修改后的值，因为这种元素是按值传递，如果传递的是数组的引用，则对数组元素的后续修改可以 在原始数组中反映出来（因为数组本身就是个对象，int[] a = new int[2];，这里面的int是数组元素的类型，而数组元素的修改是操作对象</p><p>\r\n\r\n</p><p>再看我这个Java代码：</p><pre><code>import java.util.*;\r\n\r\nimport static java.lang.StrictMath.floorMod;\r\n\r\npublic class Test {\r\n\r\n    public static void main(String[] args) {\r\n\r\n        int [] array = {1};\r\n        reOrderArray(array);\r\n\r\n        System.out.println(Arrays.toString(array));\r\n\r\n    }\r\n\r\n    public static void reOrderArray(int [] array){\r\n\r\n        int [] tempArray = {0};\r\n\r\n//        1. --------------\r\n//        for(int i = 0;i &lt; array.length;i++) {\r\n//            array[i] = tempArray[i];\r\n//        }\r\n//        2. --------------\r\n//        array = tempArray;\r\n\r\n//        3. --------------\r\n\r\n//        array = Arrays.copyOf(tempArray, tempArray.length);\r\n    }\r\n}</code></pre><p>定义了一个无返回值的方法，传入一个array数组，在方法中对数组进行修改，采用1、2、3的方法对array数组进行修改，方法结束后得到的数组是不一样的，大家可以试一下，2、3方法对main方法里的array不能产生任何影响，只有采用1后，array数组中的值才会变化，这个点很大可能在代码中产生不必要的麻烦，所以，我建议除非自己知道，在方法里做数组拷贝时，建议循环拷贝。<br></p>',0,'2020-06-17 10:47:30',0);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `content` text NOT NULL COMMENT '评论内容',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论日期',
  `name` varchar(10) DEFAULT NULL COMMENT '留言者昵称',
  `email` varchar(30) DEFAULT NULL COMMENT '留言者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `test_roles_permissions` */

DROP TABLE IF EXISTS `test_roles_permissions`;

CREATE TABLE `test_roles_permissions` (
  `role_name` varchar(20) DEFAULT NULL,
  `permission` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test_roles_permissions` */

/*Table structure for table `test_user_roles` */

DROP TABLE IF EXISTS `test_user_roles`;

CREATE TABLE `test_user_roles` (
  `username` varchar(20) DEFAULT NULL,
  `role_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test_user_roles` */

insert  into `test_user_roles`(`username`,`role_name`) values ('dmlr','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
