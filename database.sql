create database planbox character set utf8;

grant all on connect.* to dbuser@localhost identified by 'planbox';

use planbox;

/*usersのテーブル作成*/
create table users (
    id int not null auto_increment primary key,
    gender int not null,
    name varchar(255),
    password varchar(255),
    age int
);

/*couplesのテーブル作成*/
create table couples (
    id int not null auto_increment primary key,
    male_id int not null,
    female_id int not null,
    email varchar(255),
    profile varchar(255),
    start_date date, 
    created datetime default null,
    modified datetime default null
);

/*datesのテーブル作成*/
create table dates (
    id int not null auto_increment primary key,
    couple_id int not null,
    name varchar(255),
    content varchar(255),
    created datetime default null,
    modified datetime default null
);

/*postsのテーブル作成*/
create table posts(
    id int not null auto_increment primary key,
    date_id int not null,
    content varchar(255) not null,
    created datetime default null,
    modified datetime default null
);

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

/*relationshipsのテーブル作成*/
create table relationships (
    id int not null auto_increment primary key,
    fav_flg int,
    follow_id int,
    follow_id int,
    created datetime default null,
    modified datetime default null
  );
