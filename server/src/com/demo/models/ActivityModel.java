package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity
//arp.addMapping("activity", ActivityModel.class);
public class ActivityModel extends Model<ActivityModel>{
	public static final ActivityModel dao = new ActivityModel();
	
	public Page<ActivityModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from activity order by create_time asc");
	}
}