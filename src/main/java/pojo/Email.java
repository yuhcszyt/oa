package pojo;

import java.util.Date;

public class Email {

	
/*	  `id` INT(4) NOT NULL AUTO_INCREMENT,
	  `recipients` VARCHAR(30) NOT NULL,
	  `sender` VARCHAR(30) NOT NULL,
	  `title` VARCHAR(100) DEFAULT NULL,
	  `content` MEDIUMTEXT,
	  `enclosure` VARCHAR(100) DEFAULT NULL,
	  `sendtime` DATE DEFAULT '0000-00-00',
	  `sendip` VARCHAR(20) DEFAULT NULL,
	  `isread` INT(11) DEFAULT '0',
	  `readtime` DATE DEFAULT NULL,
	  `isdelete` INT(11) DEFAULT '0',
	 */
	
	
	private Integer id;
	
	private String recipients;
	
	private String sender;
	
	private String title;
	
	private String content;
	
	private String enclosure;
	
	private Date sendTime;
	
	private Integer isRead;
	
	private Date readtime;
	
	private Integer isdelete;
	
	private String UserId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRecipients() {
		return recipients;
	}

	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
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

	public String getEnclosure() {
		return enclosure;
	}

	public void setEnclosure(String enclosure) {
		this.enclosure = enclosure;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}



	public Integer getIsRead() {
		return isRead;
	}

	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}

	public Date getReadtime() {
		return readtime;
	}

	public void setReadtime(Date readtime) {
		this.readtime = readtime;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}
	
	
	
	
}
