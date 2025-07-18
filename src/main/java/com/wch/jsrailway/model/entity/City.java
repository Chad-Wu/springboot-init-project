package com.wch.jsrailway.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 区县信息表
 * @TableName city
 */
@TableName(value ="city")
@Data
public class City implements Serializable {
    /**
     * 区县ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 区县名称
     */
    private String name;

    /**
     * 区县名称全拼
     */
    private String pinyin;

    /**
     * 城市名称拼音首字母
     */
    private String pinyin_initial;

    /**
     * 是否热门区县 (1:是, 0:否)
     */
    private Integer is_hot;

    /**
     * 是否删除
     */
    private Integer is_delete;

    /**
     * 创建时间
     */
    private Date created_time;

    /**
     * 更新时间
     */
    private Date updated_time;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}