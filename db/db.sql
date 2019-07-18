drop database if EXISTS  shopping_platform;
CREATE database shopping_platform;
use shopping_platform;

-- 用户基本信息

DROP TABLE IF EXISTS `user`; -- 用户表
DROP TABLE IF EXISTS `admin`; -- 管理员表
DROP TABLE IF EXISTS `buyer`; -- 买家表
DROP TABLE IF EXISTS `seller`; -- 卖家表

CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,-- 32+4多四位
  `verify` varchar(16) NOT NULL CHECK(length(verify)>=6),-- 16位以下,6位以上
  `sex` BOOLEAN,
  `name` varchar(36),
  `email` varchar(320) NOT NULL,
  `identity` varchar(20),
  `create_time` varchar(19) NOT NULL, -- 20191212-110211
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `admin` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `avator_url` TEXT,
  `note` varchar(260),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `buyer` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `nickname`varchar(36),
  `avator_url` TEXT,
  `bank_card` varchar(36),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);

CREATE TABLE `seller` (
  `user_id` varchar(36) NOT NULL PRIMARY KEY,
  `nickname`varchar(36),
  `avator_url` TEXT,
  `bank_card` varchar(36),
  `create_time` varchar(19) NOT NULL,
  `update_time` varchar(19) NOT NULL
);
-- null值    ''空值   正常值

insert INTO user VALUES('123456','000000',TRUE ,NULL,'123@163.com','admin',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO user VALUES('654321','000000',FALSE,'','','buyer',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO user VALUES('142536','000000',NULL ,'hello','321@163.com','seller',
                        date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO admin VALUES('123456','https://www.google.com/','this is a note',
                         date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO buyer VALUES('654321','monkey','https://www.google.com/','9999888877776666',
                         date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));
insert INTO seller VALUES('142536','monkey','https://www.google.com/','9999888877776666',
                          date_format(NOW(),'%Y%m%d-%H%i%s'),date_format(NOW(),'%Y%m%d-%H%i%s'));

-- 用户基本信息 end

-- 商品基本信息
DROP TABLE IF EXISTS `store`; --
DROP TABLE IF EXISTS `goods`; --
DROP TABLE IF EXISTS `goods_classify`;
DROP TABLE IF EXISTS `belongsTo`;

CREATE TABLE goods_classify
(
  classify_id           VARCHAR(36) NOT NULL
    PRIMARY KEY,
  top_level_classify_id VARCHAR(36) NOT NULL,
  classify_name         VARCHAR(36) NULL,
  create_time           VARCHAR(19) NOT NULL,
  update_time           VARCHAR(19) NOT NULL
)
  ENGINE = InnoDB;

CREATE TABLE store
(
  store_id       VARCHAR(36) NOT NULL
    PRIMARY KEY,
  note           TEXT        NULL,
  store_pic_url  TEXT        NULL,
  store_classify VARCHAR(36) NULL,
  level          VARCHAR(36) NULL,
  certification  VARCHAR(36) NULL,
  create_time    VARCHAR(19) NOT NULL,
  update_time    VARCHAR(19) NOT NULL,
  CONSTRAINT store_goods_classify_classify_id_fk
  FOREIGN KEY (store_classify) REFERENCES goods_classify (classify_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX store_goods_classify_classify_id_fk
  ON store (store_classify);

CREATE TABLE store_sell_classify
(
  id          VARCHAR(36) NOT NULL
    PRIMARY KEY,
  store_id    VARCHAR(36) NULL,
  classify_id VARCHAR(36) NULL,
  CONSTRAINT store_sell_classify_store_store_id_fk
  FOREIGN KEY (store_id) REFERENCES store (store_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT store_sell_classify_goods_classify_classify_id_fk
  FOREIGN KEY (classify_id) REFERENCES goods_classify (classify_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX store_sell_classify_store_store_id_fk
  ON store_sell_classify (store_id);

CREATE INDEX store_sell_classify_goods_classify_classify_id_fk
  ON store_sell_classify (classify_id);

CREATE TABLE goods
(
  goods_id    VARCHAR(36) NOT NULL
    PRIMARY KEY,
  store_id    VARCHAR(36) NOT NULL,
  pic_url     TEXT        NULL,
  status      VARCHAR(20) NULL,
  old_level   VARCHAR(20) NULL,
  create_time VARCHAR(19) NOT NULL,
  update_time VARCHAR(19) NOT NULL,
  CONSTRAINT goods_store_store_id_fk
  FOREIGN KEY (store_id) REFERENCES store (store_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX goods_store_store_id_fk
  ON goods (store_id);

CREATE TABLE classify_of_goods
(
  id          VARCHAR(36) NOT NULL
    PRIMARY KEY,
  classify_id VARCHAR(36) NULL,
  goods_id    VARCHAR(36) NULL,
  CONSTRAINT classify_of_goods_store_sell_classify_id_fk
  FOREIGN KEY (classify_id) REFERENCES store_sell_classify (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT classify_of_goods_goods_goods_id_fk
  FOREIGN KEY (goods_id) REFERENCES goods (goods_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX classify_of_goods_store_sell_classify_id_fk
  ON classify_of_goods (classify_id);

CREATE INDEX classify_of_goods_goods_goods_id_fk
  ON classify_of_goods (goods_id);


INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('1', '0', '食品', '20190718-134138', '20190718-134138');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('2', '0', '服饰', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('3', '1', '方便面', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('4', '1', '冰红茶', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('5', '3', '汤达人', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('6', '2', '耐克', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('7', '2', '阿迪达斯', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) VALUES ('8', '5', 'AJ球鞋', '20190718-111541', '20190718-111541');

INSERT INTO shopping_platform.store (store_id, note, store_pic_url, store_classify, level, certification, create_time, update_time) VALUES ('0000', 'first store', 'https://www.google.com/', '3', '5', 'fastExpress', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.store (store_id, note, store_pic_url, store_classify, level, certification, create_time, update_time) VALUES ('0001', 'second store', 'https://www.google.com/', '4', '1', 'fastExpress', '20190718-111541', '20190718-111541');

INSERT INTO shopping_platform.store_sell_classify (id, store_id, classify_id) VALUES ('0', '0000', '2');
INSERT INTO shopping_platform.store_sell_classify (id, store_id, classify_id) VALUES ('1', '0000', '3');
INSERT INTO shopping_platform.store_sell_classify (id, store_id, classify_id) VALUES ('2', '0000', '4');
INSERT INTO shopping_platform.store_sell_classify (id, store_id, classify_id) VALUES ('3', '0001', '5');

INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('001', '0000', 'https://www.google.com/', 'selling', 'new', '20190718-134040', '20190718-134040');
INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('002', '0000', 'https://www.google.com/', 'selling', 'new', '20190718-134040', '20190718-134040');
INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('003', '0000', 'https://www.google.com/', 'selling', 'new', '20190718-134040', '20190718-134040');
INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('101', '0001', 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('102', '0001', 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');
INSERT INTO shopping_platform.goods (goods_id, store_id, pic_url, status, old_level, create_time, update_time) VALUES ('103', '0001', 'https://www.google.com/', 'selling', 'new', '20190718-111541', '20190718-111541');

INSERT INTO shopping_platform.classify_of_goods (id, classify_id, goods_id) VALUES ('0', '0', '001');
INSERT INTO shopping_platform.classify_of_goods (id, classify_id, goods_id) VALUES ('1', '1', '002');
INSERT INTO shopping_platform.classify_of_goods (id, classify_id, goods_id) VALUES ('2', '2', '003');
INSERT INTO shopping_platform.classify_of_goods (id, classify_id, goods_id) VALUES ('3', '3', '101');

-- 商品基本信息 end

-- Shopping Cart
DROP TABLE IF EXISTS in_cart_of;

create table in_cart_of
(
    id       varchar(36)   not null
        primary key,
    buyer_id varchar(36)   not null,
    good_id  varchar(36)   not null,
    good_num int default 1 not null,
    constraint in_cart_of_buyer_user_id_fk
        foreign key (buyer_id) references buyer (user_id)
            on update cascade on delete cascade,
    constraint in_cart_of_goods_goods_id_fk
        foreign key (good_id) references goods (goods_id)
            on update cascade on delete cascade
);
-- Shopping Cart Ends