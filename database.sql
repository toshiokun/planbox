create database planbox character set utf8;

grant all on planbox.* to dbuser@localhost identified by 'planbox';

use planbox;

/*usersのテーブル作成*/
create table users (
    id int not null auto_increment primary key,
    gender int not null,
    name varchar(255),
    password varchar(255),
    age int
);

insert into users (gender, name, age) values 
    (0,'daichi', 21),
    (0,'kohei', 21),
    (0,'toshihiro', 21),
    (0,'riku', 23),
    (1,'yuina', 21),
    (1,'eriko', 28),
    (0,'kazushi', 17);

/*couplesのテーブル作成*/
create table couples (
    id int not null auto_increment primary key,
    male_id int not null,
    female_id int not null,
    email varchar(255),
    profile varchar(255),
    start_date date, 
    cover_url varchar(255),
    profile_url varchar(255),
    created datetime default null,
    modified datetime default null
);

insert into couples (male_id, female_id) values 
    (0, 5),
    (1, 4);

/*datesのテーブル作成*/
create table dates (
    id int not null auto_increment primary key,
    couple_id int not null,
    name varchar(255),
    content varchar(255),
    created datetime default null,
    modified datetime default null
);

insert into dates (couple_id, name, content, created, modified) values 
    (0, "渋谷デート", "あｓｌ；なｓｌんヴぁんｖ", now(), now()),
    (0, "自由が丘デート", "ｓだｖなぁんｄｓヴぁｖ", now(), now()),
    (1, "江ノ島デート", "じゃｋｄんさんｖ；ｓ", now(), now()),
    (1, "ベルギー旅行", "二人の初めてのデート！", now(), now());

/*postsのテーブル作成*/
create table posts(
    id int not null auto_increment primary key,
    date_id int not null,
    content varchar(255) not null,
    created datetime default null,
    modified datetime default null
);

insert into posts (date_id, content, created, modified) values 
    (0, "ヒカリエに集合", now(), now()),
    (0, "ハチ公前で写真撮影", now(), now()),
    (0, "解散", now(), now()),
    (1, "ヒカリエに集合", now(), now()),
    (1, "ハチ公前で写真撮影", now(), now()),
    (1, "解散", now(), now()),
    (2, "ヒカリエに集合", now(), now()),
    (2, "ハチ公前で写真撮影", now(), now()),
    (2, "解散", now(), now()),
    (3, "ヒカリエに集合", now(), now()),
    (3, "ハチ公前で写真撮影", now(), now()),
    (3, "解散", now(), now());

/*photosのテーブル作成*/
create table photos (
    id int not null auto_increment primary key,
    post_id int,
    photo_url varchar(255),
    created datetime default null,
    modified datetime default null
);

/*countriesのテーブル作成*/
create table favorites (
    id int not null auto_increment primary key,
    fav_flg int,
    user_id int,
    date_id int,
    created datetime default null,
    modified datetime default null
  );

insert into favorites (fav_flg, user_id, date_id, created, modified) values 
    (1, 0, 2, now(), now()),
    (1, 0, 3, now(), now()),
    (1, 1, 0, now(), now()),
    (1, 1, 1, now(), now()),
    (1, 2, 2, now(), now()),
    (1, 2, 3, now(), now()),
    (1, 2, 4, now(), now());

/*followsのテーブル作成*/
create table follows (
    id int not null auto_increment primary key,
    fav_flg int,
    user_id int,
    couple_id int,
    created datetime default null,
    modified datetime default null
  );

insert into follows (fav_flg, user_id, couple_id, created, modified) values 
    (1, 0, 1, now(), now()),
    (1, 1, 0, now(), now()),
    (1, 2, 0, now(), now()),
    (1, 2, 1, now(), now()),
    (1, 3, 0, now(), now()),
    (1, 3, 1, now(), now()),
    (1, 4, 0, now(), now());