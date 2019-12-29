package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity_member
//arp.addMapping("activity_member", ActivityMemberModel.class);
public class ActivityMemberModel extends Model<ActivityMemberModel>{
	public static final ActivityMemberModel dao = new ActivityMemberModel();
	
	public Page<ActivityMemberModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from activity_member order by create_time asc");
	}
}