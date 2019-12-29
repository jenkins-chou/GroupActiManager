package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity_bill
//arp.addMapping("activity_bill", ActivityBillModel.class);
public class ActivityBillModel extends Model<ActivityBillModel>{
	public static final ActivityBillModel dao = new ActivityBillModel();
	
	public Page<ActivityBillModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from activity_bill order by create_time asc");
	}
}