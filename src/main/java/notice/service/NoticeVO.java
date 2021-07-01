package notice.service;

public class NoticeVO {
	  private int bno;
      private String title;
      private String content;
      private String user;
      private int view;
      private String fixtop;
      private String regdate;
    
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	
	public String getFixtop() {
		return fixtop;
	}
	public void setFixtop(String fixtop) {
		this.fixtop = fixtop;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
      

}
