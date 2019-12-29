package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table vote
//arp.addMapping("vote", VoteModel.class);
public class VoteModel extends Model<VoteModel>{
	public static final VoteModel dao = new VoteModel();
	
	public Page<VoteModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from vote order by create_time asc");
	}
}