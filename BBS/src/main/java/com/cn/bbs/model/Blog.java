package com.cn.bbs.model;

/**
 * 博客 主表
 * @author Joy.Wu
 *
 */
public class Blog  {
	
	private String aid;
	private String userId;
	private String title;
	private String content;
	private String createTime;
	private String sectionId;//版块id
	private String type;//1:发布  2:草稿
	
	private String sectionName;
	private String username;
	
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getSectionId() {
		return sectionId;
	}
	public void setSectionId(String sectionId) {
		this.sectionId = sectionId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	

}
