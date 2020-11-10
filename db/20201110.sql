create table wx_msg_reply_rule
(
    rule_id            int auto_increment
        primary key,
    appid              char(20)        default ''                null comment 'appid',
    rule_name          varchar(20)                               not null comment '规则名称',
    type               char(2)         default '3'               null comment '类型（1、关注时回复；2、消息回复；3、关键词回复）',
    match_value        varchar(200)                              not null comment '匹配的关键词、事件等',
    req_type           varchar(10)     default 'text'            null comment '请求消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置）',
    reply_type         varchar(20)     default 'text'            not null comment '回复消息类型请求消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置）',
    exact_match        tinyint(1)      default 0                 not null comment '是否精确匹配',
    reply_content      varchar(1024)                             not null comment '回复消息内容',
    rep_media_id       varchar(1024)                             null comment '回复类型imge、voice、news、video的mediaID或音乐缩略图的媒体id',
    rep_name           varchar(64)                               null comment '回复的素材名、视频和音乐的标题',
    rep_desc           varchar(200)                              null comment '视频和音乐的描述',
    rep_url            varchar(500)                              null comment '链接',
    rep_hq_url         varchar(500)                              null comment '高质量链接',
    rep_thumb_media_id varchar(64)                               null comment '缩略图的媒体Id',
    rep_thumb_url      varchar(500)                              null comment '缩略图url',
    content            mediumtext                                null comment '图文消息的内容',
    status             tinyint(1)      default 1                 not null comment '规则是否有效',
    `desc`             varchar(255)                              null comment '备注说明',
    effect_time_start  time            default '00:00:00'        null comment '生效起始时间',
    effect_time_end    time            default '23:59:59'        null comment '生效结束时间',
    priority           int(3) unsigned default 0                 null comment '规则优先级',
    update_time        datetime        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间'
)
    comment '自动回复规则';

create index idx_appid
    on wx_msg_reply_rule (appid)
    comment 'appid';

INSERT INTO wx.wx_msg_reply_rule (rule_id, appid, rule_name, type, match_value, req_type, reply_type, exact_match, reply_content, rep_media_id, rep_name, rep_desc, rep_url, rep_hq_url, rep_thumb_media_id, rep_thumb_url, content, status, `desc`, effect_time_start, effect_time_end, priority, update_time) VALUES (1, 'wx5deed3a14709dd32', '关注公众号', '1', 'subscribe', null, 'text', 0, '你好，欢迎关注！7771', null, null, null, null, null, null, null, null, 1, '关注回复', '00:00:00', '23:59:59', 0, '2020-11-08 11:02:00');
INSERT INTO wx.wx_msg_reply_rule (rule_id, appid, rule_name, type, match_value, req_type, reply_type, exact_match, reply_content, rep_media_id, rep_name, rep_desc, rep_url, rep_hq_url, rep_thumb_media_id, rep_thumb_url, content, status, `desc`, effect_time_start, effect_time_end, priority, update_time) VALUES (36, '', '你好', '3', '你好', null, 'text', 0, '你好', null, null, null, null, null, null, null, null, 1, '测试', '00:00:00', '23:59:59', 0, '2020-10-26 21:45:01');