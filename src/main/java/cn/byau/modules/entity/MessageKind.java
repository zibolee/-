package cn.byau.modules.entity;

import java.util.List;

public class MessageKind {
    private String messagekindId;

    private String messagekindName;

    private String messagekindRemark;
    
    private Member member;
    
	private  int count;
   // private List<Course> courseList;
    
    public MessageKind() {
		super();
	}


//    public MessageKind(String kindId, String kindName, String kindRemark, Member speciality, int count) {
//	super();
//	this.kindId = kindId;
//	this.kindName = kindName;
//	this.kindRemark = kindRemark;
//	this.speciality = speciality;
//	this.count = count;
//}


	public MessageKind(String messagekindId, String messagekindName, String messagekindRemark, Member member,
			int count) {
		super();
		this.messagekindId = messagekindId;
		this.messagekindName = messagekindName;
		this.messagekindRemark = messagekindRemark;
		this.member = member;
		this.count = count;
	}


//	@Override
//	public String toString() {
//		return "CourseKind [kindId=" + kindId + ", kindName=" + kindName + ", kindRemark=" + kindRemark
//				+ ", speciality=" + speciality  + "]";
//	}

	@Override
	public String toString() {
		return "MessageKind [messagekindId=" + messagekindId + ", messagekindName=" + messagekindName
				+ ", messagekindRemark=" + messagekindRemark + ", member=" + member + "]";
	}
	
	
	
//    public String getKindId() {
//		return kindId;
//	}
//
//	public void setKindId(String kindId) {
//		this.kindId = kindId;
//	}
//
//	public String getKindName() {
//		return kindName;
//	}
//
//	public void setKindName(String kindName) {
//		this.kindName = kindName;
//	}
//
//	public String getKindRemark() {
//		return kindRemark;
//	}
//
//	public void setKindRemark(String kindRemark) {
//		this.kindRemark = kindRemark;
//	}

	

	public String getMessagekindId() {
		return messagekindId;
	}


	public void setMessagekindId(String messagekindId) {
		this.messagekindId = messagekindId;
	}


	public String getMessagekindName() {
		return messagekindName;
	}


	public void setMessagekindName(String messagekindName) {
		this.messagekindName = messagekindName;
	}


	public String getMessagekindRemark() {
		return messagekindRemark;
	}


	public void setMessagekindRemark(String messagekindRemark) {
		this.messagekindRemark = messagekindRemark;
	}

	
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


    
}