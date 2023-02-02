package cn.byau.modules.controller;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.PageInfo;
import cn.byau.modules.entity.Message;
import cn.byau.modules.entity.MessageKind;
import cn.byau.modules.service.MessageKindService;
import cn.byau.modules.service.MessageService;
import cn.byau.system.util.Result2;



/**
 * Created by tjh on 2017/5/13.
 */
@Controller
@RequestMapping("/admin/message")
public class MessageController {

	@Autowired
	private MessageService messageService;
	@Autowired
	private MessageKindService messageKindService;
	private Logger logger =  LoggerFactory.getLogger(this.getClass());
	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toSave")
	@RequiresPermissions("message:add")
	public String savePage(HttpServletRequest request) {
		List<MessageKind> list = messageKindService.list();
		request.setAttribute("list", list);
		return "/admin/message/save.jsp";
	}

	/**
	 * 跳转到上传页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUpload")
	@RequiresPermissions("message:import")
	public String upload() {
		return "/admin/message/upload.jsp";
	}

	/**
	 * 跳转到分页显示页面
	 * 
	 * @param pageNum  为当前页号
	 * @param courseId 为查询的课程编号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/listByPage")
	public String listByPage(@RequestParam(defaultValue = "1", required = false) Integer pageNum,
			@RequestParam(defaultValue = "5", required = false) Integer pageSize,
			@RequestParam(defaultValue = "", required = false) String messageId, HttpServletRequest request,
			HttpServletResponse response) {
		PageInfo<Message> pageInfo = messageService.listByPage(pageNum, pageSize, messageId);
		request.setAttribute("pageInfo", pageInfo);

		request.setAttribute("messageId", messageId);
		return "/admin/message/list.jsp";

	}

	/**
	 * 跳转到添加页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping("/save")
	@ResponseBody
	@RequiresPermissions("message:add")
	public Result2 save(Message message) {
		 logger.info("save方法入参{}"+message);
		Result2 result = new Result2();
		try {
			messageService.save(message);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;

	}

	/**
	 * 跳转到更新页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping("/toUpdate")
	@RequiresPermissions("message:update")
	public ModelAndView updatePage(HttpServletRequest request) {
		String messageId = request.getParameter("messageId");
		Message message = messageService.getById(messageId);

		ModelAndView mv = new ModelAndView("/admin/message/update.jsp");
		mv.addObject("message", message);

		List<MessageKind> list = messageKindService.list();
		mv.addObject("list", list);

		return mv;
	}
	

	@RequestMapping("/update")
	@RequiresPermissions("message:update")
	@ResponseBody
	public Result2 update(Message message) {
		logger.info("update方法入参{}"+message);
		Result2 result = new Result2();
		try {
			messageService.update(message);
			result.setMsg("OK");
		} catch (Exception e) {
			result.setMsg("FAIL");
		}
		return result;
	}

	@RequestMapping("/deleteBatch")
	@ResponseBody
	@RequiresPermissions("message:delete")
	public Result2 deleteBatch(String messageIds) {
		logger.info("deleteBatch方法入参{}"+messageIds);
		Result2 result = new Result2();
		String ids[] = messageIds.split(",");
		List<String> idList = Arrays.asList(ids);
		messageService.deleteBatch(idList);
		result.setMsg("OK");
		return result;
	}

	@RequestMapping("/importFile")
	/**
	 * 
	 * @param mFile
	 * @param request
	 * @param response
	 * @return
	 * MultipartFile 可以改为CommonsMultipartFile， MultipartFile 是接口,CommonsMultipartFile是实现类
	 * springmvc.xml中的CommonsMultipartResolver可以产生CommonsMultipartFile对象
	 */
	public String importFile(@RequestParam(value = "uploadFile") MultipartFile mFile, HttpServletRequest request,
			HttpServletResponse response) {
		String rootPath = request.getServletContext().getRealPath("/upload/");
		String msg = messageService.importFile(mFile, rootPath);
		request.setAttribute("msg", msg);
		return "/admin/message/upload.jsp";
	}

	@RequestMapping("/exportFile")
	public ModelAndView exportFile(HttpServletResponse response) {
		messageService.exportFile(response);

		ModelAndView mv = new ModelAndView();
		mv.addObject("type", "export");
		mv.setViewName("/admin/message/success.jsp");
		return mv;
	}
}
