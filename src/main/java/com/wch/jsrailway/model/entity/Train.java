package com.wch.jsrailway.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 列车车次信息表
 * @TableName train
 */
@TableName(value ="train")
@Data
public class Train implements Serializable {
    /**
     * 车次ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 车次号 (如G101, K19)
     */
    private String train_number;

    /**
     * 列车类型 (如: G-高铁, D-动车, K-快速, Z-直达)
     */
    private String train_type;

    /**
     * 始发站ID
     */
    private Integer start_station_id;

    /**
     * 终点站ID
     */
    private Integer end_station_id;

    /**
     * 车次全程总耗时 (分钟)
     */
    private Integer total_duration_minutes;

    /**
     * 周末是否运行 (1:有效, 0:无效)
     */
    private Integer weekend_active;

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