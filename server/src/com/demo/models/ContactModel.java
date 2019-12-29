package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity_member
//arp.addMapping("activity_member", ActivityMemberModel.class);
public class ContactModel extends Model<ContactModel>{
	public static final ContactModel dao = new ContactModel();
	
	public Page<ContactModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from contact order by create_time asc");
	}
}