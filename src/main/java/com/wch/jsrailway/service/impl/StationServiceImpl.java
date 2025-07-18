package com.wch.jsrailway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wch.jsrailway.model.entity.Station;
import com.wch.jsrailway.mapper.StationMapper;
import com.wch.jsrailway.service.StationService;
import org.springframework.stereotype.Service;

/**
* @author 86180
* @description 针对表【station(火车站信息表)】的数据库操作Service实现
* @createDate 2025-07-18 20:34:21
*/
@Service
public class StationServiceImpl extends ServiceImpl<StationMapper, Station>
    implements StationService{

}




