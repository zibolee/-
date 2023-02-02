package cn.byau.modules.mapper;

import java.util.List;

import cn.byau.modules.entity.Message;

public interface MessageMapper {
//	/**
//	 * 根据 courseId 删除一条记录
//	 * @param courseId
//	 * @return 被删除的记录个数
//	 */
//	int delete(String courseId);

	/**
	 * 添加一条记录
	 * @param course
	 * @return
	 */
	int save(Message message);

	/**
	 * 根据courseId查询一条记录
	 * @param courseId
	 * @return
	 */
	Message getById(String messageId);

	/**
	 * 修改一条记录
	 * 
	 * @param course
	 * @return
	 */
	int update(Message message);

	

	/**
	 * 根据courseId的值进行模糊查询后分页得到的记录数
	 * @param map
	 * @return
	 */
	List<Message> listByPage(String messageId);

	/**
	 * 显示所有记录
	 * 
	 * @return
	 */
	List<Message> list();

	/**
	 * 批量添加 ，从excel导入时使用
	 * @param messageList
	 * @return
	 */

	int insertBatch(List<Message> messageList);


	/**
	 * 批量删除
	 * 
	 * @param ids为主键构成的数组
	 * @return
	 */
	int deleteBatch(List<String> idList);

}