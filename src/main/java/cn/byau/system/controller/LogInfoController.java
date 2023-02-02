package cn.byau.system.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import cn.byau.system.entity.LogInfo;
import cn.byau.system.service.LogInfoService;

/**
 * Created by tjh on 2017/5/13.
 */
@Controller
@RequestMapping("/system/loginfo")
public class LogInfoController {

	@Autowired
	private LogInfoService logInfoService;

	@RequestMapping("/listByPage")
	public String pageList(ModelMap map,
			@RequestParam(defaultValue="1",required=false) Integer pageNum,
			@RequestParam(defaultValue="5",required=false)  Integer pageSize,
			@RequestParam(defaultValue="",required=false)  String startTime,   
			@RequestParam(defaultValue="",required=false)  String endTime   
			)throws Exception{
        HashMap<String,String> hm=new HashMap<>();

        hm.put("startTime",startTime);
        hm.put("endTime",endTime);
        PageInfo<LogInfo> pageInfo=logInfoService.listByPage(pageNum, pageSize,hm);
        map.addAttribute("pageInfo", pageInfo);
        return "/system/loginfo/list.jsp";
    }

}
