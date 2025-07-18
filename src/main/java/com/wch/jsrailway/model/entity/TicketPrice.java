package com.wch.jsrailway.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 车次票价信息表
 * @TableName ticket_price
 */
@TableName(value ="ticket_price")
@Data
public class TicketPrice implements Serializable {
    /**
     * 票价ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 车次ID
     */
    private Integer train_id;

    /**
     * 出发站ID
     */
    private Integer from_station_id;

    /**
     * 目的站ID
     */
    private Integer to_station_id;

    /**
     * 票价
     */
    private Integer price;

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