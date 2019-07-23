

create table admin
(
  user_id varchar(36) not null
    primary key,
  permission text null,
  create_time varchar(19) not null,
  update_time varchar(19) not null
)
  engine=InnoDB
;

create table buyer
(
  user_id varchar(36) not null
    primary key,
  bank_card varchar(36) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null
)
  engine=InnoDB
;

create table classify_of_goods
(
  id varchar(36) not null
    primary key,
  classify_selled_id varchar(36) null,
  goods_id varchar(36) null
)
  engine=InnoDB
;

create index classify_of_goods_store_sell_classify_id_fk
  on classify_of_goods (classify_selled_id)
;

create index classify_of_goods_goods_goods_id_fk
  on classify_of_goods (goods_id)
;

create table goods
(
  goods_id varchar(36) not null
    primary key,
  store_id varchar(36) not null,
  goods_name varchar(36) null,
  description text null,
  pic_url text null,
  status varchar(20) null,
  old_level varchar(20) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null,
  constraint store_id
  unique (store_id, goods_name)
)
  engine=InnoDB
;

create index goods_store_store_id_fk
  on goods (store_id)
;

alter table classify_of_goods
  add constraint classify_of_goods_goods_goods_id_fk
foreign key (goods_id) references goods (goods_id)
  on update cascade on delete cascade
;

create table goods_classify
(
  classify_id varchar(36) not null
    primary key,
  top_level_classify_id varchar(36) not null,
  parent_id varchar(36) null,
  classify_name varchar(36) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null
)
  engine=InnoDB
;

create table in_cart_of
(
  id varchar(36) not null
    primary key,
  buyer_id varchar(36) not null,
  good_id varchar(36) not null,
  good_num int default '1' not null,
  constraint in_cart_of_buyer_user_id_fk
  foreign key (buyer_id) references buyer (user_id)
    on update cascade on delete cascade,
  constraint in_cart_of_goods_goods_id_fk
  foreign key (good_id) references goods (goods_id)
    on update cascade on delete cascade
)
  engine=InnoDB
;

create index in_cart_of_buyer_user_id_fk
  on in_cart_of (buyer_id)
;

create index in_cart_of_goods_goods_id_fk
  on in_cart_of (good_id)
;

create table seller
(
  user_id varchar(36) not null
    primary key,
  bank_card varchar(36) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null
)
  engine=InnoDB
;

create table store
(
  store_id varchar(36) not null
    primary key,
  note text null,
  store_pic_url text null,
  store_classify varchar(36) null,
  level varchar(36) null,
  certification varchar(36) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null,
  constraint store_goods_classify_classify_id_fk
  foreign key (store_classify) references goods_classify (classify_id)
    on update cascade on delete cascade
)
  engine=InnoDB
;

create index store_goods_classify_classify_id_fk
  on store (store_classify)
;

alter table goods
  add constraint goods_store_store_id_fk
foreign key (store_id) references store (store_id)
  on update cascade on delete cascade
;

create table store_sell_classify
(
  id varchar(36) not null
    primary key,
  store_id varchar(36) null,
  classify_id varchar(36) null,
  constraint store_sell_classify_store_store_id_fk
  foreign key (store_id) references store (store_id)
    on update cascade on delete cascade,
  constraint store_sell_classify_goods_classify_classify_id_fk
  foreign key (classify_id) references goods_classify (classify_id)
    on update cascade on delete cascade
)
  engine=InnoDB
;

create index store_sell_classify_store_store_id_fk
  on store_sell_classify (store_id)
;

create index store_sell_classify_goods_classify_classify_id_fk
  on store_sell_classify (classify_id)
;

alter table classify_of_goods
  add constraint classify_of_goods_store_sell_classify_id_fk
foreign key (classify_selled_id) references store_sell_classify (id)
  on update cascade on delete cascade
;

create table user
(
  user_id varchar(36) not null
    primary key,
  verify varchar(16) not null,
  realname varchar(36) null,
  nickname varchar(36) null,
  avator_url text null,
  sex tinyint(1) null,
  email varchar(320) not null,
  note text null,
  identity varchar(20) null,
  create_time varchar(19) not null,
  update_time varchar(19) not null
)
  engine=InnoDB
;

alter table admin
  add constraint admin_user_user_id_fk
foreign key (user_id) references user (user_id)
  on update cascade on delete cascade
;

alter table buyer
  add constraint buyer_user_user_id_fk
foreign key (user_id) references user (user_id)
  on update cascade on delete cascade
;

alter table seller
  add constraint seller_user_user_id_fk
foreign key (user_id) references user (user_id)
  on update cascade on delete cascade
;

