package com.wch.jsrailway.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 火车站信息表
 * @TableName station
 */
@TableName(value ="station")
@Data
public class Station implements Serializable {
    /**
     * 车站ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 车站名称
     */
    private String name;

    /**
     * 车站代码 (如北京站: BJP)
     */
    private String code;

    /**
     * 车站地址
     */
    private String address;

    /**
     * 车站名称全拼
     */
    private String pinyin;

    /**
     * 车站名称拼音首字母
     */
    private String pinyin_initial;

    /**
     * 所属城市ID
     */
    private Integer city_id;

    /**
     * 经度
     */
    private BigDecimal longitude;

    /**
     * 纬度
     */
    private BigDecimal latitude;

    /**
     * 是否启用 (1:启用, 0:停用)
     */
    private Integer is_active;

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