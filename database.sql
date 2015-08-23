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
    (0,'@daichi119', 21),
    (0,'@k0hei1993', 21),
    (0,'@toshichan', 21),
    (0,'@riku-^^', 23),
    (1,'@yuina', 21),
    (1,'@eriko1990', 28),
    (0,'@ai0119', 17);

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
    (1, 6),
    (2, 5),
    (3, 7);

/*datesのテーブル作成*/
create table dates (
    id int not null auto_increment primary key,
    couple_id int not null,
    name varchar(255),
    description varchar(255),
    budget varchar(255),
    created datetime default null,
    modified datetime default null
);

insert into dates (couple_id, name, description, budget, created, modified) values 
    (1, "渋谷デート", "晴れの日を二人で過ごしました。お金がなかったので、有名どころを回って来ました(^^)", "4000", now(), now()),
    (2, "自由が丘デート", "オシャレな街、自由が丘。カフェや雑貨屋さんを見てきました。まったりしたい方におすすめです！！", "5000",now(), now()),
    (3, "江ノ島デート", "夏ということで江ノ島に行ってきました！海に入らなくても江ノ島は楽しいですよ！", "6000",now(), now());

/*postsのテーブル作成*/
create table posts(
    id int not null auto_increment primary key,
    date_id int not null,
    content varchar(255) not null,
    location varchar(255),
    created datetime default null,
    modified datetime default null
);

insert into posts (date_id, content, location, created, modified) values 
    (1, "ヒカリエに集合！天気も良好◎　さすが晴れ男！！", "渋谷", now(), now()),
    (1, "ハチ公前で写真撮影！いぇーい！！", "渋谷", now(), now()),
    (1, "TOHOシネマで映画鑑賞！疲れてたからちょっと寝ちゃった…笑", "渋谷", now(), now()),
    (1, "楽天カフェで一休み！ワンピースの音楽が永遠リピート。。。懐かしい！！", "渋谷", now(), now()),
    (1, "LOFTでお買い物！二人でお揃いの手帳ゲッチュ(*^^*)カラクリすごかった！！", "渋谷", now(), now()),
    (1, "ディナーは予約してました！美味しい料理がたくさんあって幸せだった♪", "原宿", now(), now()),
    (1, "寂しいけど、ばいばーい（泣）夜景すごくキレイだった！！", "表参道", now(), now()),
    (2, "駅前で集合、人やばい。", "自由が丘", now(), now()),
    (2, "スタバでいっぱい！新作のフラペチーノ美味しい♡", "自由が丘", now(), now()),
    (2, "メインストリートをゆっくりお散歩", "自由が丘", now(), now()),
    (2, "楽天カフェで一休み！ワンピースの音楽が永遠リピート。。。懐かしい！！", "自由が丘", now(), now()),
    (2, "LOFTでお買い物！二人でお揃いの手帳ゲッチュ(*^^*)カラクリすごかった！！", "自由が丘", now(), now()),
    (2, "ディナーは予約してました！美味しい料理がたくさんあって幸せだった♪", "自由が丘", now(), now()),
    (2, "寂しいけど、ばいばーい（泣）夜景すごくキレイだった！！", "自由が丘", now(), now()),    
    (3, "駅前で集合、人やばい。", "自由が丘", now(), now()),
    (3, "スタバでいっぱい！新作のフラペチーノ美味しい♡", "自由が丘", now(), now()),
    (3, "メインストリートをゆっくりお散歩", "自由が丘", now(), now()),
    (3, "楽天カフェで一休み！ワンピースの音楽が永遠リピート。。。懐かしい！！", "自由が丘", now(), now()),
    (3, "LOFTでお買い物！二人でお揃いの手帳ゲッチュ(*^^*)カラクリすごかった！！", "自由が丘", now(), now()),
    (3, "ディナーは予約してました！美味しい料理がたくさんあって幸せだった♪", "自由が丘", now(), now()),
    (3, "寂しいけど、ばいばーい（泣）夜景すごくキレイだった！！", "自由が丘", now(), now());

/*photosのテーブル作成*/
create table photos (
    id int not null auto_increment primary key,
    post_id int,
    filename varchar(255),
    created datetime default null,
    modified datetime default null
);

insert into photos (post_id, filename, created, modified) values 
    (1, 'hikarie.jpg', now(), now()),
    (2, 'hachiko.jpg', now(), now()),
    (3, 'tohocinema.jpeg', now(), now()),
    (4, 'rakutencafe_inner.jpg', now(), now()),
    (4, 'rakutencafe_outer.jpg', now(), now()),
    (5, 'loft.jpg', now(), now()),
    (6, 'dinner.jpg', now(), now()),
    (7, 'omotesando.jpg', now(), now());

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
    (1, 1, 3, now(), now()),
    (1, 1, 4, now(), now()),
    (1, 2, 1, now(), now()),
    (1, 2, 2, now(), now()),
    (1, 3, 2, now(), now()),
    (1, 3, 3, now(), now()),
    (1, 3, 4, now(), now());

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
    (1, 1, 1, now(), now()),
    (1, 1, 2, now(), now()),
    (1, 1, 3, now(), now()),
    (1, 3, 1, now(), now()),
    (1, 4, 2, now(), now()),
    (1, 4, 1, now(), now()),
    (1, 5, 2, now(), now());