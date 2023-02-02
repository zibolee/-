package cn.byau.modules.mapper;

import java.util.List;

import cn.byau.modules.entity.MessageKind;

public interface MessageKindMapper {
	
	
	List<MessageKind> list();
	List<MessageKind> list3t();
	
	List<MessageKind> countByKindId();

	MessageKind getByKindId(String messagekindId);
	
	
	
	int delete(String messagekindId);

    
	
	int save(MessageKind record);


    
    int update(MessageKind messagekind);
	
	

}