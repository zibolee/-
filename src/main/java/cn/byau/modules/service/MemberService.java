package cn.byau.modules.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import cn.byau.modules.entity.Member;

public interface MemberService extends IService<Member>{
	
	//PageVo<Speciality> listBylile(Speciality q);
	IPage<Member> list(int pageNum,int pageSize);

}

