package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity_progress
//arp.addMapping("activity_progress", ActivityProgressModel.class);
public class ActivityProgressModel extends Model<ActivityProgressModel>{
	public static final ActivityProgressModel dao = new ActivityProgressModel();
	
	public Page<ActivityProgressModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from activity_progress order by create_time asc");
	}
}