SET NAMES UTF8;
DROP DATABASE IF EXISTS kaola;
create database kaola;
use kaola;

#用户表
create table users(
	UID int not null  primary key auto_increment comment "用户编号",
	UName varchar(20) not null comment "用户名",
	UPwd varchar(50) not null comment "用户密码",
	UPhone varchar(13) not null comment "手机号"
);
insert into users(`UName`,`UPwd`,`UPhone`)
values("zxcv","bb521","1234567891"),
("asdf","bb521","1234567891"),
("abcd","bb521","1234567891"),
("efgh","bb521","1234567891"),
("qwer","bb521","1234567891");

/*地址信息表*/
CREATE TABLE yhd_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/*数据库分类表*/
create table classify(
	CID int not null  primary key auto_increment comment "分类编号",
	CName varchar(20) not null comment "分类名称",
	FCID int comment "父级分类",
	CLvevl int not null comment "分类级别"
);

/* 商品信息表*/
create table goods(
	GID int not null primary key auto_increment comment "商品编号",
	GName varchar(20) not null comment "商品名称",
	GClass int not null comment "商品类别",
	GPrice double not null comment "商品价格",
	GIntro varchar(100) not null comment "商品简介"
);

/*商品图片表*/
create table images(
	ID int not null primary key auto_increment comment "图片编号",
	ImgSrc varchar(50) not null comment "图片路径",
	GoodsID int not null comment "所属商品编号",
	ImgClass varchar(5) not null comment "图片类型"
);

/*商品评论表*/
create table discuss(
	DID int not null primary key auto_increment comment "评论编号",
	GoodsID int not null comment "所属商品编号",
	UserID int not null comment "所属用户编号",
	Content varchar(400) not null comment "评论内容",
	DisTime date not null comment "评论时间"
);

/**购物车条目**/
CREATE TABLE yhd_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE yhd_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE yhd_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);