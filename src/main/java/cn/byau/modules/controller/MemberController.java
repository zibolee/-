package cn.byau.modules.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.metadata.IPage;

import cn.byau.modules.entity.Member;
import cn.byau.modules.service.MemberService;
import cn.byau.system.util.Result;

/**
 * 控制器类
 */
@Controller
@RequestMapping(value = "/admin/member")
public class MemberController {
	// @Resource(name="personDao")
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/listByPage", method = RequestMethod.GET)
	@ResponseBody
	private Map<String, Object> listByPage(@RequestParam(defaultValue = "1", required = false) Integer page,
			@RequestParam(defaultValue = "5", required = false) Integer limit) {

		IPage<Member> pageInfo = memberService.list(page, limit);

		// total为总记录数
		long total = pageInfo.getTotal();
		List<Member> list = pageInfo.getRecords();

		logger.info("listByPage{}" + list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", total);
		map.put("data", list);
		return map;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	private Object save(@RequestBody Member messageKind) {
		logger.info("save方法入参{}" + messageKind);
		try {
			boolean result = memberService.save(messageKind);
			if (result) {
				return Result.ok(true, 1, "添加成功");
			} else {
				return Result.error(false, 0, "添加失败");
			}
		} catch (Exception e) {
			logger.error("保存学生异常  {   } ", e.getMessage());
			return Result.error().data("error", e.getMessage());
		}

	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Result update(@RequestBody Member member) {
		logger.info("update方法入参{}" + member);
		try {
			boolean result = memberService.updateById(member);
			if (result) {
				return Result.ok(true, 1, "更新成功");
			} else {
				return Result.error(false, 0, "更新失败");
			}
		} catch (Exception e) {
			logger.error("更新学生异常 {  } ", e.getMessage());
			return Result.error().data("error", e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Result delete(String memberId) {
		logger.info("delete方法入参{}" + memberId);
		try {
			boolean result = memberService.removeById(memberId);
			if (result) {
				return Result.ok(true, 1, "删除成功");
			} else {
				return Result.error(false, 0, "删除失败");
			}
		} catch (Exception e) {
			logger.error("刪除学生异常 {  } ", e.getMessage());
			return Result.error().data("error", e.getMessage());
		}
	}
}
