package cn.byau.modules.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

public class Member {
	
	@TableId(type = IdType.INPUT)
	private String memberId;
	private String memberName;
	public Member(String memberId, String memberName) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
	}
	public Member() {
		super();
	}
//	public String getSpecialityId() {
//		return specialityId;
//	}
//	public void setSpecialityId(String specialityId) {
//		this.specialityId = specialityId;
//	}
//	public String getSpecialityName() {
//		return specialityName;
//	}
//	public void setSpecialityName(String specialityName) {
//		this.specialityName = specialityName;
//	}
//	@Override
//	public String toString() {
//		return "Speciality [specialityId=" + specialityId + ", specialityName=" + specialityName + "]";
//	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + "]";
	}
	
	

}
