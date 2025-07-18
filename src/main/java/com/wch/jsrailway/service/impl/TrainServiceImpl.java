package com.wch.jsrailway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wch.jsrailway.model.entity.Train;
import com.wch.jsrailway.mapper.TrainMapper;
import com.wch.jsrailway.service.TrainService;
import org.springframework.stereotype.Service;

/**
* @author 86180
* @description 针对表【train(列车车次信息表)】的数据库操作Service实现
* @createDate 2025-07-18 20:34:21
*/
@Service
public class TrainServiceImpl extends ServiceImpl<TrainMapper, Train>
    implements TrainService{

}




