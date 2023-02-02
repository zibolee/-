package cn.byau.system.mapper;

import java.util.HashMap;
import java.util.List;

import cn.byau.system.entity.LogInfo;

public interface LogInfoMapper {
        int save(LogInfo logInfo);

  
       List<LogInfo> list(HashMap hm);
}