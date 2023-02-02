package cn.byau.modules.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.byau.modules.entity.MessageKind;
import cn.byau.modules.entity.PieData;
import cn.byau.modules.service.MessageKindService;
import cn.byau.system.util.Result2;

/**
 * Created by tjh on 2017/5/13.
 */
@Controller
@RequestMapping("/admin/messageKind")
public class MessageKindController {

	@Autowired
	private MessageKindService messageKindService;

	@RequestMapping("/list")
	public ModelAndView list(HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/admin/messagekind/list.jsp");
		mv.addObject("list", messageKindService.list());
		return mv;
	}

	@RequestMapping("/barByKindId")
	@ResponseBody
	public List<MessageKind> barByKindId(HttpServletResponse response) {
		return messageKindService.countByKindId();
	}

	@RequestMapping("/pieByKindId")
	@ResponseBody
	public List<PieData> pieByKindId(HttpServletResponse response) {
		List<MessageKind> messageKinds = messageKindService.countByKindId();
		List<PieData> pieDatas = new ArrayList<>();
		for (MessageKind ck : messageKinds) {
			PieData data = new PieData();
			data.setName(ck.getMessagekindName());
			data.setValue(ck.getCount());
			pieDatas.add(data);
		}
		return pieDatas;
	}

	@RequestMapping("/getByKindId")
	public ModelAndView getBykindId(HttpServletRequest request, HttpServletResponse response) {
		String messagekindId = request.getParameter("kindId");
		System.out.println(messagekindId);
		ModelAndView mv = new ModelAndView("/admin/messagekind/getByKindId.jsp");
		mv.addObject("messageKind", messageKindService.getByKindId(messagekindId));

		return mv;
	}

	@RequestMapping("/save")
	@ResponseBody
	public Result2 save(MessageKind messageKind) {

		Result2 result = new Result2();
		if (messageKindService.getByKindId(messageKind.getMessagekindId()) == null) {
			try {
				messageKindService.save(messageKind);
				result.setMsg("OK");
			} catch (Exception e) {
				result.setMsg("FAIL");
			}
		} else {
			result.setMsg("主键重复");
		}
		return result;

	}

	@RequestMapping("/update")
	@ResponseBody
	public Result2 update(MessageKind messageKind) {
		Result2 result = new Result2();
		try {
			messageKindService.update(messageKind);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;

	}

	@RequestMapping("/delete")
	@ResponseBody
	public Result2 delete(String messagekindId) {
		Result2 result = new Result2();
		try {
			messageKindService.delete(messagekindId);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;
	}
}