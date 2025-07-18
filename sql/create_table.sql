# 数据库初始化
# @author wch
# @from  chonghe

-- 创建库
create database if not exists js_railway;

-- 切换库
use js_railway;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;

CREATE TABLE `city` (
    `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '区县ID',
    `name` VARCHAR(50) NOT NULL UNIQUE COMMENT '区县名称',
    `pinyin` VARCHAR(100) COMMENT '区县名称全拼',
    `pinyin_initial` VARCHAR(50) COMMENT '城市名称拼音首字母',
    `is_hot` TINYINT DEFAULT 0 COMMENT '是否热门区县 (1:是, 0:否)',
    `is_delete`     tinyint      default 0  not null comment '是否删除',
    `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX `idx_city_name` (`name`),
    INDEX `idx_city_pinyin` (`pinyin`),
    INDEX `idx_city_pinyin_initial` (`pinyin_initial`),
    INDEX `idx_city_is_hot` (`is_hot`)
) COMMENT='区县信息表';

CREATE TABLE `station` (
   `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '车站ID',
   `name` VARCHAR(100) NOT NULL UNIQUE COMMENT '车站名称',
   `code` VARCHAR(10) UNIQUE COMMENT '车站代码 (如北京站: BJP)',
   `address` VARCHAR(128) COMMENT '车站地址',
   `pinyin` VARCHAR(200) COMMENT '车站名称全拼',
   `pinyin_initial` VARCHAR(100) COMMENT '车站名称拼音首字母',
   `city_id` INT COMMENT '所属城市ID',
   `longitude` DECIMAL(10, 7) COMMENT '经度',
   `latitude` DECIMAL(10, 7) COMMENT '纬度',
   `is_active` TINYINT DEFAULT 1 COMMENT '是否启用 (1:启用, 0:停用)',
   `is_delete`     tinyint      default 0  not null comment '是否删除',
   `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `updated_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
   INDEX `idx_station_name` (`name`),
   INDEX `idx_station_pinyin` (`pinyin`),
   INDEX `idx_station_pinyin_initial` (`pinyin_initial`),
   INDEX `idx_station_city_id` (`city_id`),
   FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
) COMMENT='火车站信息表';

CREATE TABLE `train` (
     `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '车次ID',
     `train_number` VARCHAR(20) NOT NULL UNIQUE COMMENT '车次号 (如G101, K19)',
     `train_type` VARCHAR(10) COMMENT '列车类型 (如: G-高铁, D-动车, K-快速, Z-直达)',
     `start_station_id` INT NOT NULL COMMENT '始发站ID',
     `end_station_id` INT NOT NULL COMMENT '终点站ID',
     `total_duration_minutes` INT COMMENT '车次全程总耗时 (分钟)',
     `weekend_active` TINYINT DEFAULT 1 COMMENT '周末是否运行 (1:有效, 0:无效)',
     `is_delete`     tinyint      default 0  not null comment '是否删除',
     `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
     `updated_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
     INDEX `idx_train_number` (`train_number`),
     INDEX `idx_train_start_end` (`start_station_id`, `end_station_id`),
     FOREIGN KEY (`start_station_id`) REFERENCES `station`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
     FOREIGN KEY (`end_station_id`) REFERENCES `station`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT='列车车次信息表';

CREATE TABLE `train_station_schedule` (
      `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
      `train_id` INT NOT NULL COMMENT '车次ID',
      `station_id` INT NOT NULL COMMENT '停靠车站ID',
      `station_order` INT NOT NULL COMMENT '停靠站顺序 (从1开始)',
      `arrival_time` TIME COMMENT '到站时间 (HH:MM:SS)',
      `departure_time` TIME COMMENT '发车时间 (HH:MM:SS)',
      `stay_duration_minutes` INT COMMENT '停留时间 (分钟)',
      `run_duration_from_start_minutes` INT COMMENT '从始发站到本站的累计运行时间 (分钟)',
      `is_delete`     tinyint      default 0  not null comment '是否删除',
      `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `updated_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      UNIQUE KEY `uk_train_station_order` (`train_id`, `station_order`) COMMENT '确保同一车次站序唯一',
      INDEX `idx_schedule_train_id` (`train_id`),
      INDEX `idx_schedule_station_id` (`station_id`),
      FOREIGN KEY (`train_id`) REFERENCES `train`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
      FOREIGN KEY (`station_id`) REFERENCES `station`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT='车次停靠站时刻表';

CREATE TABLE `ticket_price` (
    `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '票价ID',
    `train_id` INT NOT NULL COMMENT '车次ID',
    `from_station_id` INT NOT NULL COMMENT '出发站ID',
    `to_station_id` INT NOT NULL COMMENT '目的站ID',
    `price` INT NOT NULL COMMENT '票价',
    `is_delete`     tinyint      default 0  not null comment '是否删除',
    `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    UNIQUE KEY `uk_price_train_from_to_seat` (`train_id`, `from_station_id`, `to_station_id`),
    INDEX `idx_price_train_id` (`train_id`),
    INDEX `idx_price_from_to` (`from_station_id`, `to_station_id`),
    FOREIGN KEY (`train_id`) REFERENCES `train`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`from_station_id`) REFERENCES `station`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (`to_station_id`) REFERENCES `station`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT='车次票价信息表';