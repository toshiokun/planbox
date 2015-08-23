create database planbox character set utf8;

grant all on planbox.* to dbuser@localhost identified by 'planbox';

use planbox;

/*usersのテーブル作成*/
create table users (
    id int not null auto_increment primary key,
    gender int not null,
    name varchar(255),
    password varchar(255),
    photo varchar(255),
    baithday varchar(255),
    age int
);

insert into users (gender, name, age, photo) values 
    (0,'@daichi119', 21, "daichi.jpg"),
    (0,'@k0hei1993', 21, "kohei.jpeg"),
    (0,'@toshichan', 21, "taniguchi.jpg"),
    (0,'@riku-^^', 23, "daichi.jpg"),
    (1,'@gakigaki', 21, "gaki.jpeg"),
    (1,'@mitsuki', 28, "yamamoto.jpg"),
    (0,'@makihori', 17, "horikita.jpg");

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
    often_area varchar(255),
    often_place varchar(255),
    relationship varchar(255),
    anniversary varchar(255),
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
    (2, "デザート食べまくってお昼スキップー！ジェラート美味しすぎた！", "自由が丘", now(), now()),
    (2, "雑貨屋さんに行ってきたよー！", "自由が丘", now(), now()),
    (2, "ディナーはイタリアン！ラボエムにいってきたよー！オシャレな内装でおすすめ！", "自由が丘", now(), now()),
    (2, "夜景すごくキレイだった！！また来たい街だなー自由が丘！", "自由が丘", now(), now()),    
    (3, "駅前で集合、彼氏が遅刻！", "藤沢駅", now(), now()),
    (3, "はじめての江ノ電！ローカル線すぎるー！ゆっくり動くー！", "江の電", now(), now()),
    (3, "江ノ電で途中下車、スラムダンク発祥の高校があるみたい", "七里ガ浜駅", now(), now()),
    (3, "江の島到着！江の島って橋を渡っていけるんだね！散歩行ってきまーす！", "江の島", now(), now()),
    (3, "江の島といえば、しらす丼だよね！美味しい！", "江の島", now(), now()),
    (3, "夜も綺麗な江の島ー！でもお店閉まるの早すぎ！早めの帰宅ー", "江の島", now(), now()),
    (3, "家に帰って来ちゃった〜！江の島散策の1日でした！", "横浜", now(), now());

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