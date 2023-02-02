package cn.byau.modules.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.byau.modules.entity.MessageKind;
import cn.byau.modules.mapper.MessageKindMapper;

/**
 * Created by tjh on 2017/5/13.
 */
@Service("messageKindService")
public class MessageKindService {

    @Autowired
    private MessageKindMapper messageKindDAO;

    
    public List<MessageKind> list3t(){
    	return messageKindDAO.list3t();
    }
	
    
    
    public List<MessageKind> list() {
        return messageKindDAO.list();
    }
    public MessageKind getByKindId(String messagekindId) {
        return messageKindDAO.getByKindId(messagekindId);
    }
    
    public void save(MessageKind messageKind) {
    	messageKindDAO.save(messageKind);
	}

	

	public void update(MessageKind messageKind) {
		messageKindDAO.update(messageKind);
	}
	
	public List<MessageKind> countByKindId(){
		return messageKindDAO.countByKindId();
	}

	

	public void delete(String messagekindId) {
		messageKindDAO.delete(messagekindId);
	}
	/**
     *   这个方法中用到了分页插件pagehelper
     *   很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * @param pageNum 开始页数
     * @param pageSize 每页显示的数据条数
     
     * @return
     */
	public PageInfo<MessageKind> listByPage(Integer pageNum, Integer pageSize) {
		 //将参数传给这个方法就可以实现物理分页了，非常简单。
		PageHelper.startPage(pageNum, pageSize);
		List<MessageKind> list = messageKindDAO.list();
		PageInfo<MessageKind> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
    
    
    
}
