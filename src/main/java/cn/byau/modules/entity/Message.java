package cn.byau.modules.entity;

public class Message {
    private String messageId;

	private String messageTit;

    private String messagekindId;

	private String messageContent;

    private String messageDate;

    private String messageReply;

    private MessageKind messageKind;
    
    public Message() {
		super();
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getMessageTit() {
		return messageTit;
	}

	public void setMessageTit(String messageTit) {
		this.messageTit = messageTit;
	}

	public String getMessagekindId() {
		return messagekindId;
	}

	public void setMessagekindId(String messagekindId) {
		this.messagekindId = messagekindId;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageReply() {
		return messageReply;
	}

	public void setMessageReply(String messageReply) {
		this.messageReply = messageReply;
	}

	public MessageKind getMessageKind() {
		return messageKind;
	}

	public void setMessageKind(MessageKind messageKind) {
		this.messageKind = messageKind;
	}

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", messageTit=" + messageTit + ", messagekindId=" + messagekindId
				+ ", messageContent=" + messageContent + ", messageDate=" + messageDate + ", messageReply="
				+ messageReply + ", messageKind=" + messageKind + "]";
	}

	public Message(String messageId, String messageTit, String messagekindId, String messageContent, String messageDate,
			String messageReply, MessageKind messageKind) {
		super();
		this.messageId = messageId;
		this.messageTit = messageTit;
		this.messagekindId = messagekindId;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.messageReply = messageReply;
		this.messageKind = messageKind;
	}
    
    
}