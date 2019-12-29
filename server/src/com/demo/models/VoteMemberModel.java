package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table vote_member
//arp.addMapping("vote_member", VoteMemberModel.class);
public class VoteMemberModel extends Model<VoteMemberModel>{
	public static final VoteMemberModel dao = new VoteMemberModel();
	
	public Page<VoteMemberModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from vote_member order by create_time asc");
	}
}