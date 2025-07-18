package com.wch.jsrailway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wch.jsrailway.model.entity.City;
import com.wch.jsrailway.mapper.CityMapper;
import com.wch.jsrailway.service.CityService;
import org.springframework.stereotype.Service;

/**
* @author 86180
* @description 针对表【city(区县信息表)】的数据库操作Service实现
* @createDate 2025-07-18 20:34:21
*/
@Service
public class CityServiceImpl extends ServiceImpl<CityMapper, City>
    implements CityService{

}




