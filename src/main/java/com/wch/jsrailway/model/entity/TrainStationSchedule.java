package com.wch.jsrailway.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 车次停靠站时刻表
 * @TableName train_station_schedule
 */
@TableName(value ="train_station_schedule")
@Data
public class TrainStationSchedule implements Serializable {
    /**
     * 主键ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 车次ID
     */
    private Integer train_id;

    /**
     * 停靠车站ID
     */
    private Integer station_id;

    /**
     * 停靠站顺序 (从1开始)
     */
    private Integer station_order;

    /**
     * 到站时间 (HH:MM:SS)
     */
    private Date arrival_time;

    /**
     * 发车时间 (HH:MM:SS)
     */
    private Date departure_time;

    /**
     * 停留时间 (分钟)
     */
    private Integer stay_duration_minutes;

    /**
     * 从始发站到本站的累计运行时间 (分钟)
     */
    private Integer run_duration_from_start_minutes;

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