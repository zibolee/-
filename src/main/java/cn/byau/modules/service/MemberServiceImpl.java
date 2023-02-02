package cn.byau.modules.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.byau.modules.entity.Member;
import cn.byau.modules.mapper.MemberMapper;

@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements MemberService {
	@Autowired
	private MemberMapper memberMapper;


	public IPage<Member> list(int pageNum, int pageSize) {
		QueryWrapper<Member> queryWrapper = new QueryWrapper<>();

		Page<Member> page = new Page<>(pageNum, pageSize);
		IPage<Member> iPage = memberMapper.selectPage(page, queryWrapper);
//System.out.println(iPage.getPages());
//System.out.println(iPage.getTotal());
		// List<Speciality> list = iPage.getRecords();
		return iPage;
	}

}
