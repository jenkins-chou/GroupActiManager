package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table activity_votes
//arp.addMapping("activity_votes", ActivityVotesModel.class);
public class ActivityVotesModel extends Model<ActivityVotesModel>{
	public static final ActivityVotesModel dao = new ActivityVotesModel();
	
	public Page<ActivityVotesModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from activity_votes order by create_time asc");
	}
}